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
SEED_DIR = ROOT / "seeds" / "frontier_fuzz_mlir23"
OUT_DIR = ROOT / "outputs" / "frontier_fuzz_mlir23"
SOURCE_INDEX = ROOT / "data" / "seed_sources.json"


@dataclass(frozen=True)
class Pipeline:
    name: str
    args: list[str]


PIPELINES = [
    Pipeline("parse_verify", []),
    Pipeline("memref_metadata_lower", ["--expand-strided-metadata", "--memref-expand", "--normalize-memrefs", "--canonicalize", "--cse"]),
    Pipeline("memref_to_llvm", ["--expand-strided-metadata", "--memref-expand", "--finalize-memref-to-llvm", "--canonicalize"]),
    Pipeline("vector_mask_lower", ["--lower-vector-mask", "--lower-vector-multi-reduction", "--canonicalize", "--cse"]),
    Pipeline("vector_to_llvm", ["--convert-vector-to-scf", "--convert-vector-to-llvm", "--canonicalize"]),
    Pipeline("tensor_reify", ["--reify-result-shapes", "--resolve-shaped-type-result-dims", "--fold-tensor-subset-ops", "--canonicalize", "--cse"]),
    Pipeline("buffer_dealloc", ["--one-shot-bufferize", "--ownership-based-buffer-deallocation", "--bufferization-lower-deallocations", "--canonicalize"]),
    Pipeline("sparse_foreach", ["--pre-sparsification-rewrite", "--lower-sparse-ops-to-foreach", "--lower-sparse-foreach-to-scf", "--canonicalize"]),
]


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Frontier MLIR 23 fuzzing without inliner-oriented pipelines.")
    parser.add_argument("--count", type=int, default=160)
    parser.add_argument("--seed", type=int, default=20260603)
    parser.add_argument("--case-timeout", type=int, default=10)
    parser.add_argument("--remote-mlir-opt", default=os.environ.get("REMOTE_MLIR_OPT", "mlir-opt-23"))
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
    families = [
        memref_metadata,
        tensor_pad,
        vector_outerproduct_mask,
        vector_transfer,
        buffer_materialize,
        sparse_convert,
    ]
    rows = []
    for i in range(count):
        family = families[i % len(families)]
        name, text = family(i)
        rows.append((name, family.__name__, text))
    return rows


def memref_metadata(i: int) -> tuple[str, str]:
    rank = 2 + i % 3
    dyn = "x".join(["?"] * rank)
    indices = ", ".join(f"%i{n}" for n in range(rank))
    args = ", ".join(f"%i{n}: index" for n in range(rank))
    return (
        f"frontier_memref_metadata_{i:04d}.mlir",
        f"""func.func @frontier_memref_metadata_{i}(%m: memref<{dyn}xf32, strided<[{', '.join(['?'] * rank)}], offset: ?>>, {args}) -> f32 {{
  %base, %offset, %sizes:{rank}, %strides:{rank} = memref.extract_strided_metadata %m : memref<{dyn}xf32, strided<[{', '.join(['?'] * rank)}], offset: ?>> -> memref<f32>, index, {', '.join(['index'] * rank)}, {', '.join(['index'] * rank)}
  %v = memref.load %m[{indices}] : memref<{dyn}xf32, strided<[{', '.join(['?'] * rank)}], offset: ?>>
  return %v : f32
}}
""",
    )


def tensor_pad(i: int) -> tuple[str, str]:
    m = 2 + i % 5
    n = 2 + (i // 5) % 5
    low = i % 3
    high = (i // 3) % 3
    return (
        f"frontier_tensor_pad_{i:04d}.mlir",
        f"""func.func @frontier_tensor_pad_{i}(%arg0: tensor<{m}x{n}xf32>) -> tensor<{m + low + high}x{n + low + high}xf32> {{
  %cst = arith.constant 0.000000e+00 : f32
  %pad = tensor.pad %arg0 low[{low}, {low}] high[{high}, {high}] {{
  ^bb0(%i: index, %j: index):
    tensor.yield %cst : f32
  }} : tensor<{m}x{n}xf32> to tensor<{m + low + high}x{n + low + high}xf32>
  return %pad : tensor<{m + low + high}x{n + low + high}xf32>
}}
""",
    )


def vector_outerproduct_mask(i: int) -> tuple[str, str]:
    n = 2 + i % 6
    kind = ["add", "mul", "maxnumf", "minnumf"][i % 4]
    scalable = "[" + str(n) + "]" if i % 5 == 0 else str(n)
    return (
        f"frontier_vector_outerproduct_{i:04d}.mlir",
        f"""func.func @frontier_vector_outerproduct_{i}(%a: vector<{scalable}xf32>, %b: f32, %acc: vector<{scalable}xf32>, %m: vector<{scalable}xi1>) -> vector<{scalable}xf32> {{
  %0 = vector.mask %m {{ vector.outerproduct %a, %b, %acc {{kind = #vector.kind<{kind}>}} : vector<{scalable}xf32>, f32 }} : vector<{scalable}xi1> -> vector<{scalable}xf32>
  return %0 : vector<{scalable}xf32>
}}
""",
    )


def vector_transfer(i: int) -> tuple[str, str]:
    m = 1 + i % 4
    n = 2 + (i // 4) % 5
    return (
        f"frontier_vector_transfer_{i:04d}.mlir",
        f"""func.func @frontier_vector_transfer_{i}(%m: memref<?x?xf32, strided<[?, ?], offset: ?>>, %i: index, %j: index) -> vector<{m}x{n}xf32> {{
  %pad = arith.constant 0.000000e+00 : f32
  %v = vector.transfer_read %m[%i, %j], %pad {{in_bounds = [{str(i % 2 == 0).lower()}, {str(i % 3 == 0).lower()}]}} : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<{m}x{n}xf32>
  return %v : vector<{m}x{n}xf32>
}}
""",
    )


def buffer_materialize(i: int) -> tuple[str, str]:
    n = 2 + i % 8
    return (
        f"frontier_buffer_materialize_{i:04d}.mlir",
        f"""func.func @frontier_buffer_materialize_{i}(%src: tensor<{n}xf32>, %dst_mem: memref<{n}xf32>) -> tensor<{n}xf32> {{
  %dst = bufferization.to_tensor %dst_mem restrict writable : memref<{n}xf32> to tensor<{n}xf32>
  %0 = bufferization.materialize_in_destination %src in restrict writable %dst : (tensor<{n}xf32>, tensor<{n}xf32>) -> tensor<{n}xf32>
  return %0 : tensor<{n}xf32>
}}
""",
    )


def sparse_convert(i: int) -> tuple[str, str]:
    n = 8 + i % 8
    return (
        f"frontier_sparse_convert_{i:04d}.mlir",
        f"""#SV = #sparse_tensor.encoding<{{ map = (d0) -> (d0 : compressed) }}>
func.func @frontier_sparse_convert_{i}(%arg0: tensor<{n}xf32, #SV>) -> tensor<?xf32, #SV> {{
  %0 = sparse_tensor.convert %arg0 : tensor<{n}xf32, #SV> to tensor<?xf32, #SV>
  return %0 : tensor<?xf32, #SV>
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
        seed_path = f"seeds/frontier_fuzz_mlir23/{name}"
        parse = run_remote(client, mlir_opt, [], text, timeout_seconds)
        parse_item = record(seed_path, family, "parse_verify", parse)
        runs.append(parse_item)
        write_artifact(artifacts, name, "parse_verify", parse)
        if parse_item["category"] != "success":
            continue
        for pipeline in PIPELINES[1:]:
            result = run_remote(client, mlir_opt, pipeline.args, text, timeout_seconds)
            item = record(seed_path, family, pipeline.name, result)
            runs.append(item)
            write_artifact(artifacts, name, pipeline.name, result)
            if item["category"] in {"memory/assertion", "timeout"}:
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
        "# Frontier MLIR 23 Fuzz Report",
        "",
        f"- Tool: `{report['tool']}`",
        f"- Seeds: {report['seed_count']}",
        f"- Runs: {len(report['runs'])}",
        f"- Hard/timeout candidates: {len(report['hard_failures'])}",
        "",
    ]
    for item in report["hard_failures"][:30]:
        lines.extend(["## Candidate", "", f"- Seed: `{item['seed']}`", f"- Pipeline: `{item['pipeline']}`", f"- Family: `{item['family']}`", f"- Category: `{item['category']}`", "", "```text", item["stderr_excerpt"], "```", ""])
    if not report["hard_failures"]:
        lines.append("No hard failure or timeout found.")
    (OUT_DIR / "report.md").write_text("\n".join(lines), encoding="utf-8")


def sync_source_index(seeds: list[tuple[str, str, str]]) -> None:
    source_index = json.loads(SOURCE_INDEX.read_text(encoding="utf-8-sig")) if SOURCE_INDEX.exists() else {}
    for name, family, _text in seeds:
        source_index[f"seeds/frontier_fuzz_mlir23/{name}"] = {
            "origin": "generated-original-frontier-fuzz",
            "source": "local frontier generator scripts/fuzz_frontier_mlir23.py",
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
