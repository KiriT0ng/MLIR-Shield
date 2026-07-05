from __future__ import annotations

import argparse
import json
import os
import random
import sys
import time
from dataclasses import dataclass
from pathlib import Path

import paramiko


ROOT = Path(__file__).resolve().parents[1]
SEED_DIR = ROOT / "seeds" / "generic_fuzz_mlir23"
OUT_DIR = ROOT / "outputs" / "generic_fuzz_mlir23"
SOURCE_INDEX = ROOT / "data" / "seed_sources.json"


@dataclass(frozen=True)
class Pipeline:
    name: str
    args: list[str]


PIPELINES = [
    Pipeline("parse_verify_allow_unregistered", ["--allow-unregistered-dialect"]),
    Pipeline("inline_allow_unregistered", ["--allow-unregistered-dialect", "--inline"]),
    Pipeline("canonicalize_allow_unregistered", ["--allow-unregistered-dialect", "--canonicalize", "--cse"]),
    Pipeline("symbol_dce_inline_allow_unregistered", ["--allow-unregistered-dialect", "--symbol-dce", "--inline", "--canonicalize"]),
    Pipeline("convert_ub_to_llvm", ["--convert-ub-to-llvm"]),
]


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Generic/custom MLIR robustness fuzzing for current MLIR 23.")
    parser.add_argument("--count", type=int, default=200)
    parser.add_argument("--seed", type=int, default=20260602)
    parser.add_argument("--remote-mlir-opt", default=os.environ.get("REMOTE_MLIR_OPT", "mlir-opt-23"))
    parser.add_argument("--case-timeout", type=int, default=12)
    parser.add_argument("--host", default=os.environ.get("MLIR_SSH_HOST", "192.168.54.128"))
    parser.add_argument("--user", default=os.environ.get("MLIR_SSH_USER", "toby"))
    parser.add_argument("--password-env", default="MLIR_SSH_PASSWORD")
    args = parser.parse_args(argv)

    password = os.environ.get(args.password_env)
    if not password:
        print(f"missing password env var: {args.password_env}", file=sys.stderr)
        return 2
    random.seed(args.seed)
    seeds = generate(args.count)
    write_seeds(seeds)
    client = connect(args.host, args.user, password)
    try:
        report = run(client, args.remote_mlir_opt, seeds, args.case_timeout)
    finally:
        client.close()
    write_report(report)
    sync_source_index(seeds)
    print_summary(report)
    return 1 if report["hard_failures"] else 0


def generate(count: int) -> list[tuple[str, str, str]]:
    families = [custom_region, custom_graph_region, ub_cycle, nested_symbol]
    seeds = []
    for i in range(count):
        name, text = families[i % len(families)](i)
        seeds.append((name, families[i % len(families)].__name__, text))
    return seeds


def custom_region(i: int) -> tuple[str, str]:
    terminator = '"test.term"() : () -> ()' if i % 3 else ""
    return (
        f"generic_custom_region_{i:04d}.mlir",
        f"""module {{
  func.func @f{i}() {{
    "orig.region"() ({{
      "orig.inner"() : () -> ()
      {terminator}
    }}) : () -> ()
    return
  }}
}}
""",
    )


def custom_graph_region(i: int) -> tuple[str, str]:
    return (
        f"generic_graph_region_{i:04d}.mlir",
        f"""module {{
  "orig.graph"() ({{
    %0 = "orig.source"() : () -> i32
    %1 = "orig.mix"(%0) : (i32) -> i32
    "orig.sink"(%1) : (i32) -> ()
  }}) {{region_kind = "graph"}} : () -> ()
}}
""",
    )


def ub_cycle(i: int) -> tuple[str, str]:
    op = "arith.addi" if i % 2 else "arith.muli"
    return (
        f"generic_ub_cycle_{i:04d}.mlir",
        f""""builtin.module"() ({{
  %0 = "{op}"(%1, %0) <{{overflowFlags = #arith.overflow<none>}}> : (index, index) -> index
  %1 = "arith.constant"() <{{value = {i % 3} : index}}> : () -> index
}}) : () -> ()
""",
    )


def nested_symbol(i: int) -> tuple[str, str]:
    return (
        f"generic_nested_symbol_{i:04d}.mlir",
        f"""module {{
  func.func private @dead{i}()
  func.func @caller{i}() {{
    "orig.wrap"() ({{
      func.call @dead{i}() : () -> ()
      "orig.yield"() : () -> ()
    }}) : () -> ()
    return
  }}
}}
""",
    )


def write_seeds(seeds: list[tuple[str, str, str]]) -> None:
    SEED_DIR.mkdir(parents=True, exist_ok=True)
    for name, _family, text in seeds:
        (SEED_DIR / name).write_text(text, encoding="utf-8")


def connect(host: str, user: str, password: str) -> paramiko.SSHClient:
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(host, username=user, password=password, timeout=10)
    return client


def run(client: paramiko.SSHClient, mlir_opt: str, seeds: list[tuple[str, str, str]], timeout_seconds: int) -> dict:
    artifacts = OUT_DIR / "artifacts"
    artifacts.mkdir(parents=True, exist_ok=True)
    runs = []
    hard = []
    for name, family, text in seeds:
        seed_path = f"seeds/generic_fuzz_mlir23/{name}"
        for pipeline in PIPELINES:
            result = run_remote(client, mlir_opt, pipeline.args, text, timeout_seconds)
            item = record(seed_path, family, pipeline.name, result)
            runs.append(item)
            write_artifact(artifacts, name, pipeline.name, result)
            if item["category"] == "memory/assertion":
                hard.append(item)
    return {"tool": mlir_opt, "seed_count": len(seeds), "pipelines": [p.name for p in PIPELINES], "runs": runs, "hard_failures": hard}


def run_remote(client: paramiko.SSHClient, mlir_opt: str, args: list[str], source: str, timeout_seconds: int) -> dict:
    inner = " ".join([quote(mlir_opt), *(quote(a) for a in args), "-o", "-"])
    command = f"timeout {timeout_seconds}s {inner}"
    start = time.perf_counter()
    stdin, stdout, stderr = client.exec_command(command, timeout=None)
    stdin.write(source)
    stdin.channel.shutdown_write()
    out = stdout.read().decode("utf-8", errors="replace")
    err = stderr.read().decode("utf-8", errors="replace")
    code = stdout.channel.recv_exit_status()
    return {"return_code": code, "stdout": out, "stderr": err, "elapsed_ms": int((time.perf_counter() - start) * 1000)}


def quote(value: str) -> str:
    if all(ch.isalnum() or ch in "-_./:=,()" for ch in value):
        return value
    return "'" + value.replace("'", "'\"'\"'") + "'"


def classify(result: dict) -> str:
    if result["return_code"] == 0:
        return "success"
    if result["return_code"] == 124:
        return "timeout"
    text = (result["stdout"] + "\n" + result["stderr"]).lower()
    markers = ["assertion failed", "stack dump", "segmentation fault", "please submit a bug report", "llvm error", "aborted"]
    if any(m in text for m in markers):
        return "memory/assertion"
    if "unknown dialect" in text or "unregistered" in text:
        return "dialect registration"
    if "expected" in text or "error:" in text:
        return "parser/verifier"
    return "unknown failure"


def record(seed: str, family: str, pipeline: str, result: dict) -> dict:
    return {
        "seed": seed,
        "family": family,
        "pipeline": pipeline,
        "return_code": result["return_code"],
        "category": classify(result),
        "elapsed_ms": result["elapsed_ms"],
        "stderr_excerpt": result["stderr"][:1200],
    }


def write_artifact(artifacts: Path, seed_name: str, pipeline: str, result: dict) -> None:
    stem = seed_name.removesuffix(".mlir")
    (artifacts / f"{stem}__{pipeline}.stdout.mlir").write_text(result["stdout"], encoding="utf-8")
    (artifacts / f"{stem}__{pipeline}.stderr.txt").write_text(result["stderr"], encoding="utf-8")


def write_report(report: dict) -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    (OUT_DIR / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    lines = [
        "# Generic MLIR 23 Fuzz Report",
        "",
        f"- Tool: `{report['tool']}`",
        f"- Seeds: {report['seed_count']}",
        f"- Runs: {len(report['runs'])}",
        f"- Hard failures: {len(report['hard_failures'])}",
        "",
    ]
    for item in report["hard_failures"][:20]:
        lines.extend(["## Hard failure", "", f"- Seed: `{item['seed']}`", f"- Pipeline: `{item['pipeline']}`", f"- Family: `{item['family']}`", "", "```text", item["stderr_excerpt"], "```", ""])
    if not report["hard_failures"]:
        lines.append("No hard failure found.")
    (OUT_DIR / "report.md").write_text("\n".join(lines), encoding="utf-8")


def sync_source_index(seeds: list[tuple[str, str, str]]) -> None:
    source_index = json.loads(SOURCE_INDEX.read_text(encoding="utf-8-sig")) if SOURCE_INDEX.exists() else {}
    for name, family, _text in seeds:
        source_index[f"seeds/generic_fuzz_mlir23/{name}"] = {
            "origin": "generated-original-generic-fuzz",
            "source": "local generic generator scripts/fuzz_generic_mlir23.py",
            "family": family,
        }
    SOURCE_INDEX.write_text(json.dumps(dict(sorted(source_index.items())), ensure_ascii=False, indent=2), encoding="utf-8")


def print_summary(report: dict) -> None:
    counts = {}
    for run in report["runs"]:
        counts[run["category"]] = counts.get(run["category"], 0) + 1
    print(f"seeds: {report['seed_count']}")
    print(f"runs: {len(report['runs'])}")
    print(f"categories: {counts}")
    print(f"hard_failures: {len(report['hard_failures'])}")
    print(f"report: {OUT_DIR / 'report.md'}")


if __name__ == "__main__":
    raise SystemExit(main())
