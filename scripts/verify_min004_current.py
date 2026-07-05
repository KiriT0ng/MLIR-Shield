from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SEED = ROOT / "outputs" / "minimized" / "mlir22_memref_canonicalize_current.chunk.min.mlir"
OUT_DIR = ROOT / "outputs" / "current_validation"
ARGS = ["--canonicalize", "--cse", "--sccp", "--canonicalize", "-o", "-"]


def run_remote(tool: str, timeout: float) -> dict:
    env = os.environ.copy()
    cmd = [
        sys.executable,
        str(ROOT / "scripts" / "ssh_mlir_opt.py"),
        "--remote-mlir-opt",
        tool,
        *ARGS,
    ]
    started = time.perf_counter()
    completed = subprocess.run(
        cmd,
        input=SEED.read_text(encoding="utf-8"),
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        env=env,
        timeout=timeout,
        check=False,
    )
    elapsed_ms = round((time.perf_counter() - started) * 1000, 2)
    return {
        "tool": tool,
        "args": ARGS,
        "seed": str(SEED.relative_to(ROOT)).replace("\\", "/"),
        "return_code": completed.returncode,
        "elapsed_ms": elapsed_ms,
        "stdout": completed.stdout,
        "stderr": completed.stderr,
        "classification": classify(completed.returncode, completed.stderr),
    }


def classify(return_code: int, stderr: str) -> str:
    lowered = stderr.lower()
    if return_code == 0:
        return "resolved-or-not-reproduced"
    if "stack dump" in lowered or "assertion" in lowered or "crash" in lowered:
        return "hard-failure"
    if "expected" in lowered or "error:" in lowered:
        return "diagnostic-failure"
    return "unknown-failure"


def write_report(result: dict) -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    (OUT_DIR / "min004_current_stdout.mlir").write_text(result["stdout"], encoding="utf-8")
    (OUT_DIR / "min004_current_stderr.txt").write_text(result["stderr"], encoding="utf-8")
    json_path = OUT_DIR / "min004_current_validation.json"
    json_path.write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")

    status = "仍可复现 hard failure" if result["classification"] == "hard-failure" else "未复现 hard failure"
    md = f"""# MIN-004 当前版本验证

## 结论

{status}

## 运行信息

- Tool: `{result['tool']}`
- Return code: `{result['return_code']}`
- Classification: `{result['classification']}`
- Elapsed: `{result['elapsed_ms']} ms`
- Seed: `{result['seed']}`
- Args: `{' '.join(result['args'])}`

## stdout 摘要

```mlir
{result['stdout'][:2000]}
```

## stderr 摘要

```text
{result['stderr'][:2000]}
```
"""
    (OUT_DIR / "min004_current_validation.md").write_text(md, encoding="utf-8")
    print(json_path)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Verify MIN-004 against a current remote mlir-opt tool.")
    parser.add_argument("--tool", default="mlir-opt-23", help="Remote mlir-opt command.")
    parser.add_argument("--timeout", type=float, default=120.0)
    args = parser.parse_args(argv)

    result = run_remote(args.tool, args.timeout)
    write_report(result)
    print(f"{args.tool}: {result['classification']} return_code={result['return_code']}")
    return 0 if result["classification"] != "hard-failure" else 1


if __name__ == "__main__":
    raise SystemExit(main())
