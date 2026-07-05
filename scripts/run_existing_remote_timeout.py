from __future__ import annotations

import argparse
import json
import os
import sys
import time
from pathlib import Path

import paramiko

ROOT = Path(__file__).resolve().parents[1]

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from mlirdiff.config import load_pipelines


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Run an existing seed dir through remote mlir-opt with remote timeout.")
    parser.add_argument("--seeds", required=True)
    parser.add_argument("--pipelines", required=True)
    parser.add_argument("--out", required=True)
    parser.add_argument("--limit", type=int, default=40)
    parser.add_argument("--offset", type=int, default=0)
    parser.add_argument("--case-timeout", type=int, default=8)
    parser.add_argument("--remote-mlir-opt", default=os.environ.get("REMOTE_MLIR_OPT", "mlir-opt-23"))
    parser.add_argument("--host", default=os.environ.get("MLIR_SSH_HOST", "192.168.54.128"))
    parser.add_argument("--user", default=os.environ.get("MLIR_SSH_USER", "toby"))
    parser.add_argument("--password-env", default="MLIR_SSH_PASSWORD")
    args = parser.parse_args(argv)

    password = os.environ.get(args.password_env)
    if not password:
        print(f"missing password env var: {args.password_env}", file=sys.stderr)
        return 2
    seed_dir = ROOT / args.seeds
    pipelines = load_pipelines(ROOT / args.pipelines)
    seeds = sorted(seed_dir.glob("*.mlir"))[args.offset : args.offset + args.limit]
    out_dir = ROOT / args.out
    artifacts = out_dir / "artifacts"
    artifacts.mkdir(parents=True, exist_ok=True)

    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(args.host, username=args.user, password=password, timeout=10)
    runs = []
    hard = []
    try:
        for seed in seeds:
            source = seed.read_text(encoding="utf-8")
            for pipeline in pipelines:
                result = run_remote(client, args.remote_mlir_opt, pipeline.args, source, args.case_timeout)
                item = {
                    "seed": rel(seed),
                    "pipeline": pipeline.name,
                    "return_code": result["return_code"],
                    "category": classify(result),
                    "elapsed_ms": result["elapsed_ms"],
                    "stderr_excerpt": result["stderr"][:1200],
                }
                runs.append(item)
                stem = seed.stem + "__" + pipeline.name
                (artifacts / f"{stem}.stdout.mlir").write_text(result["stdout"], encoding="utf-8")
                (artifacts / f"{stem}.stderr.txt").write_text(result["stderr"], encoding="utf-8")
                if item["category"] in {"memory/assertion", "timeout"}:
                    hard.append(item)
    finally:
        client.close()

    report = {
        "tool": args.remote_mlir_opt,
        "seed_count": len(seeds),
        "pipelines": [p.name for p in pipelines],
        "runs": runs,
        "hard_failures": hard,
    }
    out_dir.mkdir(parents=True, exist_ok=True)
    (out_dir / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    (out_dir / "report.md").write_text(render(report), encoding="utf-8")
    print(f"seeds: {len(seeds)}")
    print(f"runs: {len(runs)}")
    print(f"hard_failures: {len(hard)}")
    print(f"report: {out_dir / 'report.md'}")
    return 1 if hard else 0


def run_remote(client: paramiko.SSHClient, mlir_opt: str, args: list[str], source: str, timeout_seconds: int) -> dict:
    inner = " ".join([quote(mlir_opt), *(quote(arg) for arg in args), "-o", "-"])
    command = f"timeout {timeout_seconds}s {inner}"
    start = time.perf_counter()
    stdin, stdout, stderr = client.exec_command(command, timeout=None)
    stdin.write(source)
    stdin.channel.shutdown_write()
    out = stdout.read().decode("utf-8", errors="replace")
    err = stderr.read().decode("utf-8", errors="replace")
    code = stdout.channel.recv_exit_status()
    return {"stdout": out, "stderr": err, "return_code": code, "elapsed_ms": int((time.perf_counter() - start) * 1000)}


def classify(result: dict) -> str:
    if result["return_code"] == 0:
        return "success"
    if result["return_code"] == 124:
        return "timeout"
    text = (result["stdout"] + "\n" + result["stderr"]).lower()
    if any(marker in text for marker in ["assertion failed", "stack dump", "segmentation fault", "please submit a bug report", "llvm error", "aborted"]):
        return "memory/assertion"
    if "unknown dialect" in text or "unregistered" in text:
        return "dialect registration"
    if "expected" in text or "error:" in text:
        return "parser/verifier"
    return "unknown failure"


def render(report: dict) -> str:
    lines = [
        "# Remote Timeout Existing Seed Report",
        "",
        f"- Tool: `{report['tool']}`",
        f"- Seeds: {report['seed_count']}",
        f"- Runs: {len(report['runs'])}",
        f"- Hard/timeout candidates: {len(report['hard_failures'])}",
        "",
    ]
    for item in report["hard_failures"][:30]:
        lines.extend(["## Candidate", "", f"- Seed: `{item['seed']}`", f"- Pipeline: `{item['pipeline']}`", f"- Category: `{item['category']}`", "", "```text", item["stderr_excerpt"], "```", ""])
    if not report["hard_failures"]:
        lines.append("No hard failure or timeout found.")
    return "\n".join(lines)


def quote(value: str) -> str:
    if all(ch.isalnum() or ch in "-_./:=,()" for ch in value):
        return value
    return "'" + value.replace("'", "'\"'\"'") + "'"


def rel(path: Path) -> str:
    return str(path.relative_to(ROOT)).replace("\\", "/")


if __name__ == "__main__":
    raise SystemExit(main())
