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
from mlirdiff.signature import failure_signature, signature_excerpt


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Try to reduce an MLIR seed while preserving a failure signature."
    )
    parser.add_argument("seed", help="Input .mlir seed to minimize.")
    parser.add_argument(
        "--command",
        required=True,
        help="Command template. Use {seed} for path-based tools, or pass --stdin for stdin-based tools.",
    )
    parser.add_argument("--stdin", action="store_true", help="Stream seed text to the command stdin.")
    parser.add_argument("--out", default="", help="Output minimized seed path.")
    parser.add_argument("--timeout", type=float, default=20.0)
    parser.add_argument(
        "--target-signature",
        default="",
        help="Expected failure signature. If omitted, the original seed's signature is used.",
    )
    return parser


def main() -> int:
    args = build_parser().parse_args()
    seed = Path(args.seed)
    if not seed.exists():
        print(f"error: seed not found: {seed}", file=sys.stderr)
        return 2
    source = seed.read_text(encoding="utf-8")
    baseline = execute(args.command, seed, args.timeout, args.stdin)
    if baseline.return_code == 0 and not baseline.timed_out:
        print("error: original seed does not fail; nothing to minimize", file=sys.stderr)
        return 2
    target = args.target_signature or failure_signature(baseline)
    lines = source.splitlines()
    minimized = ddmin(lines, args.command, args.timeout, target, args.stdin)
    out = Path(args.out) if args.out else seed.with_name(seed.stem + ".min.mlir")
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text("\n".join(minimized) + "\n", encoding="utf-8")
    print(f"target signature: {target}")
    print(f"original lines: {len(lines)}")
    print(f"minimized lines: {len(minimized)}")
    print(f"output: {out}")
    return 0


def ddmin(lines: list[str], command: str, timeout: float, target: str, use_stdin: bool) -> list[str]:
    current = lines[:]
    chunk = max(1, len(current) // 2)
    while chunk >= 1:
        changed = False
        start = 0
        while start < len(current):
            candidate = current[:start] + current[start + chunk :]
            if candidate and preserves_failure(candidate, command, timeout, target, use_stdin):
                current = candidate
                changed = True
            else:
                start += chunk
        if not changed:
            chunk //= 2
    return current


def preserves_failure(lines: list[str], command: str, timeout: float, target: str, use_stdin: bool) -> bool:
    with tempfile.TemporaryDirectory(prefix="mlirdiff_min_") as temp_dir:
        seed = Path(temp_dir) / "candidate.mlir"
        seed.write_text("\n".join(lines) + "\n", encoding="utf-8")
        record = execute(command, seed, timeout, use_stdin)
    return (record.return_code != 0 or record.timed_out) and failure_signature(record) == target


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
        pipeline="minimize",
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


def signature_excerpt_text(text: str, limit: int = 320) -> str:
    text = text.strip()
    return text[: limit - 3] + "..." if len(text) > limit else text


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except subprocess.TimeoutExpired as exc:
        text = (exc.stderr or exc.stdout or "").strip()
        print("error: command timed out", file=sys.stderr)
        if text:
            print(signature_excerpt_text(text), file=sys.stderr)
        raise SystemExit(124)
