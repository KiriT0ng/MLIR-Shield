from __future__ import annotations

import argparse
import shlex
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from mlirdiff.classifier import classify_run
from mlirdiff.model import RunRecord
from mlirdiff.signature import failure_signature


def main() -> int:
    parser = argparse.ArgumentParser(description="Remove whole top-level MLIR chunks while preserving a failure signature.")
    parser.add_argument("seed")
    parser.add_argument("--command", required=True)
    parser.add_argument("--out", required=True)
    parser.add_argument("--stdin", action="store_true")
    parser.add_argument("--timeout", type=float, default=60.0)
    parser.add_argument("--target-signature", default="")
    args = parser.parse_args()

    seed = Path(args.seed)
    text = seed.read_text(encoding="utf-8")
    baseline = execute(args.command, seed, args.timeout, args.stdin)
    if baseline.return_code == 0:
        print("error: baseline does not fail", file=sys.stderr)
        return 2
    target = args.target_signature or failure_signature(baseline)
    chunks = split_chunks(text)
    current = chunks[:]
    changed = True
    while changed:
        changed = False
        for index in range(len(current)):
            candidate = current[:index] + current[index + 1 :]
            if not candidate:
                continue
            if preserves(candidate, args.command, args.timeout, args.stdin, target):
                current = candidate
                changed = True
                break
    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text("\n".join(current).strip() + "\n", encoding="utf-8")
    print(f"target signature: {target}")
    print(f"original chunks: {len(chunks)}")
    print(f"minimized chunks: {len(current)}")
    print(f"original lines: {len(text.splitlines())}")
    print(f"minimized lines: {len(out.read_text(encoding='utf-8').splitlines())}")
    print(f"output: {out}")
    return 0


def split_chunks(text: str) -> list[str]:
    chunks: list[str] = []
    current: list[str] = []
    depth = 0
    for line in text.splitlines():
        if current and depth == 0 and starts_new_chunk(line):
            chunks.append("\n".join(current).strip())
            current = []
        current.append(line)
        depth += line.count("{") - line.count("}")
        if depth < 0:
            depth = 0
    if current:
        chunks.append("\n".join(current).strip())
    return [chunk for chunk in chunks if chunk.strip()]


def starts_new_chunk(line: str) -> bool:
    stripped = line.strip()
    return stripped.startswith("func.func") or stripped.startswith("#") or stripped.startswith("module")


def preserves(chunks: list[str], command: str, timeout: float, use_stdin: bool, target: str) -> bool:
    with tempfile.TemporaryDirectory(prefix="mlirdiff_chunk_") as temp_dir:
        seed = Path(temp_dir) / "candidate.mlir"
        seed.write_text("\n".join(chunks) + "\n", encoding="utf-8")
        record = execute(command, seed, timeout, use_stdin)
    return record.return_code != 0 and failure_signature(record) == target


def execute(command: str, seed: Path, timeout: float, use_stdin: bool) -> RunRecord:
    command_text = command.format(seed=str(seed))
    source = seed.read_text(encoding="utf-8") if use_stdin else None
    completed = subprocess.run(
        shlex.split(command_text, posix=False),
        input=source,
        capture_output=True,
        text=True,
        timeout=timeout,
        check=False,
    )
    record = RunRecord(
        seed=str(seed),
        pipeline="chunk-minimize",
        command=command_text,
        return_code=completed.returncode,
        timed_out=False,
        elapsed_ms=0,
        stdout=completed.stdout,
        stderr=completed.stderr,
        stdout_path="",
        stderr_path="",
        category="",
    )
    record.category = classify_run(record)
    return record


if __name__ == "__main__":
    raise SystemExit(main())
