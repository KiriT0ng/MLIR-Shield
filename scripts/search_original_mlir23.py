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
SEED_DIR = ROOT / "seeds" / "original_search_mlir23"
OUT_DIR = ROOT / "outputs" / "original_search_mlir23"
SOURCE_INDEX = ROOT / "data" / "seed_sources.json"


@dataclass(frozen=True)
class Pipeline:
    name: str
    args: list[str]


PIPELINES = [
    Pipeline("parse_verify", []),
    Pipeline("canonicalize_cse_sccp", ["--canonicalize", "--cse", "--sccp", "--canonicalize"]),
    Pipeline("symbol_dce_inline", ["--symbol-dce", "--inline", "--canonicalize", "--cse"]),
    Pipeline("scf_to_cf", ["--convert-scf-to-cf", "--canonicalize", "--cse"]),
    Pipeline("bufferize", ["--one-shot-bufferize", "--canonicalize"]),
    Pipeline("linalg_affine", ["--convert-linalg-to-affine-loops", "--canonicalize"]),
    Pipeline("mem2reg", ["--mem2reg"]),
    Pipeline("memref_alias_fold", ["--fold-memref-alias-ops", "--canonicalize"]),
    Pipeline("expand_strided_metadata", ["--expand-strided-metadata", "--canonicalize", "--cse"]),
    Pipeline("vector_multi_reduction", ["--lower-vector-multi-reduction", "--canonicalize", "--cse"]),
    Pipeline("lower_vector_mask", ["--lower-vector-mask", "--canonicalize", "--cse"]),
    Pipeline("vector_to_scf_llvm", ["--convert-vector-to-scf", "--convert-vector-to-llvm", "--canonicalize"]),
    Pipeline("linalg_to_loops", ["--convert-linalg-to-loops", "--canonicalize", "--cse"]),
    Pipeline("linalg_to_parallel_gpu", ["--convert-linalg-to-parallel-loops", "--canonicalize", "--convert-parallel-loops-to-gpu"]),
    Pipeline("tensor_linalg_loops", ["--convert-tensor-to-linalg", "--convert-linalg-to-loops", "--canonicalize"]),
    Pipeline("buffer_deallocation", ["--one-shot-bufferize", "--ownership-based-buffer-deallocation", "--bufferization-lower-deallocations", "--canonicalize"]),
]


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Generate local-original MLIR seeds and search current MLIR 23.")
    parser.add_argument("--count", type=int, default=160)
    parser.add_argument("--seed", type=int, default=20260531)
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
    seeds = generate_seeds(args.count)
    write_seeds(seeds)
    client = connect(args.host, args.user, password)
    try:
        report = run_search(client, args.remote_mlir_opt, seeds)
    finally:
        client.close()
    write_report(report)
    sync_source_index(seeds)
    print_summary(report)
    return 1 if report["hard_failures"] else 0


def generate_seeds(count: int) -> list[tuple[str, str, str]]:
    generators = [
        gen_memref_dim,
        gen_tensor_slice,
        gen_scf_loop,
        gen_llvm_alloca,
        gen_vector_reduce,
        gen_vector_transfer,
        gen_vector_mask_reduce,
        gen_linalg_elementwise,
        gen_linalg_matmul,
    ]
    seeds: list[tuple[str, str, str]] = []
    for index in range(count):
        family = generators[index % len(generators)]
        name, text = family(index)
        seeds.append((name, family.__name__.replace("gen_", ""), text))
    return seeds


def gen_memref_dim(index: int) -> tuple[str, str]:
    rank = 2 + index % 3
    dims = "x".join(["?"] * rank)
    static_sizes = ["1"] * rank
    dynamic_pos = index % rank
    static_sizes[dynamic_pos] = "%n"
    offsets = ["0"] * rank
    strides = ["1"] * rank
    result_rank = rank if index % 4 else rank - 1
    result_dims = ["1" if i != dynamic_pos else "?" for i in range(rank)]
    if result_rank < rank:
        result_dims = [d for d in result_dims if d != "1"] or ["?"]
    source = f"memref<{dims}xf32, strided<[?, {', '.join(['?'] * (rank - 1))}], offset: ?>>"
    result = f"memref<{'x'.join(result_dims)}xf32, strided<[{', '.join(['?'] * len(result_dims))}], offset: ?>>"
    dim_index = min(dynamic_pos, len(result_dims) - 1)
    return (
        f"orig_memref_dim_{index:04d}.mlir",
        f"""func.func @orig_memref_dim_{index}(%arg0: {source}, %n: index) -> index {{
  %c{dim_index} = arith.constant {dim_index} : index
  %sub = memref.subview %arg0[{', '.join(offsets)}] [{', '.join(static_sizes)}] [{', '.join(strides)}] : {source} to {result}
  %d = memref.dim %sub, %c{dim_index} : {result}
  return %d : index
}}
""",
    )


def gen_tensor_slice(index: int) -> tuple[str, str]:
    dyn = "?" if index % 2 else "4"
    return (
        f"orig_tensor_slice_{index:04d}.mlir",
        f"""func.func @orig_tensor_slice_{index}(%arg0: tensor<{dyn}x8xf32>, %i: index) -> tensor<1x4xf32> {{
  %c0 = arith.constant 0 : index
  %slice = tensor.extract_slice %arg0[%i, %c0] [1, 4] [1, 1] : tensor<{dyn}x8xf32> to tensor<1x4xf32>
  return %slice : tensor<1x4xf32>
}}
""",
    )


def gen_scf_loop(index: int) -> tuple[str, str]:
    return (
        f"orig_scf_loop_{index:04d}.mlir",
        f"""func.func @orig_scf_loop_{index}(%lb: index, %ub: index, %step: index, %init: tensor<4xf32>) -> tensor<4xf32> {{
  %r = scf.for %i = %lb to %ub step %step iter_args(%acc = %init) -> (tensor<4xf32>) {{
    %next = tensor.insert_slice %acc into %acc[0] [4] [1] : tensor<4xf32> into tensor<4xf32>
    scf.yield %next : tensor<4xf32>
  }}
  return %r : tensor<4xf32>
}}
""",
    )


def gen_llvm_alloca(index: int) -> tuple[str, str]:
    return (
        f"orig_llvm_alloca_{index:04d}.mlir",
        f"""llvm.func @orig_llvm_alloca_{index}() -> f64 {{
  %one = llvm.mlir.constant(1 : i32) : i32
  %cst = llvm.mlir.constant({float(index % 9 + 1):.1f} : f64) : f64
  %p = llvm.alloca %one x f64 : (i32) -> !llvm.ptr
  llvm.store %cst, %p : f64, !llvm.ptr
  %v = llvm.load %p : !llvm.ptr -> f64
  llvm.return %v : f64
}}
""",
    )


def gen_vector_reduce(index: int) -> tuple[str, str]:
    m = 2 + (index % 4)
    n = 2 + ((index // 4) % 5)
    kind = ["add", "mul", "minnumf", "maxnumf"][index % 4]
    return (
        f"orig_vector_reduce_{index:04d}.mlir",
        f"""func.func @orig_vector_reduce_{index}(%arg0: vector<{m}x{n}xf32>, %acc: vector<{m}xf32>) -> vector<{m}xf32> {{
  %0 = vector.multi_reduction <{kind}>, %arg0, %acc [1] : vector<{m}x{n}xf32> to vector<{m}xf32>
  return %0 : vector<{m}xf32>
}}
""",
    )


def gen_vector_transfer(index: int) -> tuple[str, str]:
    m = 2 + (index % 5)
    n = 2 + ((index // 3) % 5)
    return (
        f"orig_vector_transfer_{index:04d}.mlir",
        f"""func.func @orig_vector_transfer_{index}(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %i: index, %j: index) -> vector<{m}x{n}xf32> {{
  %cst = arith.constant 0.000000e+00 : f32
  %v = vector.transfer_read %arg0[%i, %j], %cst {{in_bounds = [{str(index % 2 == 0).lower()}, {str(index % 3 == 0).lower()}]}} : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<{m}x{n}xf32>
  return %v : vector<{m}x{n}xf32>
}}
""",
    )


def gen_vector_mask_reduce(index: int) -> tuple[str, str]:
    n = 2 + (index % 5)
    return (
        f"orig_vector_mask_reduce_{index:04d}.mlir",
        f"""func.func @orig_vector_mask_reduce_{index}(%source: vector<1x{n}x1xf32>, %acc: vector<1x{n}xf32>, %mask: vector<1x{n}x1xi1>) -> vector<1x{n}xf32> {{
  %0 = vector.mask %mask {{ vector.multi_reduction <add>, %source, %acc [2] : vector<1x{n}x1xf32> to vector<1x{n}xf32> }} : vector<1x{n}x1xi1> -> vector<1x{n}xf32>
  return %0 : vector<1x{n}xf32>
}}
""",
    )


def gen_linalg_elementwise(index: int) -> tuple[str, str]:
    m = 2 + (index % 4)
    n = 2 + ((index // 4) % 4)
    op = "arith.mulf" if index % 2 else "arith.addf"
    symbol = "mulf" if index % 2 else "addf"
    return (
        f"orig_linalg_elementwise_{index:04d}.mlir",
        f"""#map = affine_map<(d0, d1) -> (d0, d1)>
func.func @orig_linalg_elementwise_{index}(%a: tensor<{m}x{n}xf32>, %b: tensor<{m}x{n}xf32>, %out: tensor<{m}x{n}xf32>) -> tensor<{m}x{n}xf32> {{
  %0 = linalg.generic {{indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]}}
      ins(%a, %b : tensor<{m}x{n}xf32>, tensor<{m}x{n}xf32>)
      outs(%out : tensor<{m}x{n}xf32>) {{
    ^bb0(%x: f32, %y: f32, %z: f32):
      %r = {op} %x, %y : f32
      linalg.yield %r : f32
  }} -> tensor<{m}x{n}xf32>
  return %0 : tensor<{m}x{n}xf32>
}}
""".replace(symbol, symbol),
    )


def gen_linalg_matmul(index: int) -> tuple[str, str]:
    m = 2 + (index % 3)
    k = 2 + ((index // 3) % 3)
    n = 2 + ((index // 9) % 3)
    return (
        f"orig_linalg_matmul_{index:04d}.mlir",
        f"""func.func @orig_linalg_matmul_{index}(%a: tensor<{m}x{k}xf32>, %b: tensor<{k}x{n}xf32>) -> tensor<{m}x{n}xf32> {{
  %out = tensor.empty() : tensor<{m}x{n}xf32>
  %zero = arith.constant 0.000000e+00 : f32
  %filled = linalg.fill ins(%zero : f32) outs(%out : tensor<{m}x{n}xf32>) -> tensor<{m}x{n}xf32>
  %0 = linalg.matmul ins(%a, %b : tensor<{m}x{k}xf32>, tensor<{k}x{n}xf32>) outs(%filled : tensor<{m}x{n}xf32>) -> tensor<{m}x{n}xf32>
  return %0 : tensor<{m}x{n}xf32>
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


def run_search(client: paramiko.SSHClient, mlir_opt: str, seeds: list[tuple[str, str, str]]) -> dict:
    runs = []
    hard_failures = []
    artifacts = OUT_DIR / "artifacts"
    artifacts.mkdir(parents=True, exist_ok=True)
    for name, family, text in seeds:
        seed_path = f"seeds/original_search_mlir23/{name}"
        parse = run_remote(client, mlir_opt, [], text)
        runs.append(record(seed_path, family, "parse_verify", parse))
        write_artifact(artifacts, name, "parse_verify", parse)
        if parse["return_code"] != 0:
            continue
        for pipeline in PIPELINES[1:]:
            result = run_remote(client, mlir_opt, pipeline.args, text)
            runs.append(record(seed_path, family, pipeline.name, result))
            write_artifact(artifacts, name, pipeline.name, result)
            category = classify(result)
            if category == "memory/assertion":
                hard_failures.append(record(seed_path, family, pipeline.name, result))
    return {
        "tool": mlir_opt,
        "seed_count": len(seeds),
        "pipelines": [p.name for p in PIPELINES],
        "runs": runs,
        "hard_failures": hard_failures,
    }


def run_remote(client: paramiko.SSHClient, mlir_opt: str, args: list[str], source: str) -> dict:
    command = " ".join([quote(mlir_opt), *(quote(arg) for arg in args), "-o", "-"])
    start = time.perf_counter()
    stdin, stdout, stderr = client.exec_command(command, timeout=None)
    stdin.write(source)
    stdin.channel.shutdown_write()
    out = stdout.read().decode("utf-8", errors="replace")
    err = stderr.read().decode("utf-8", errors="replace")
    code = stdout.channel.recv_exit_status()
    elapsed_ms = int((time.perf_counter() - start) * 1000)
    return {"return_code": code, "stdout": out, "stderr": err, "elapsed_ms": elapsed_ms}


def quote(value: str) -> str:
    if all(ch.isalnum() or ch in "-_./:=,()" for ch in value):
        return value
    return "'" + value.replace("'", "'\"'\"'") + "'"


def classify(result: dict) -> str:
    if result["return_code"] == 0:
        return "success"
    text = (result["stdout"] + "\n" + result["stderr"]).lower()
    markers = ["assertion failed", "stack dump", "segmentation fault", "please submit a bug report", "llvm error", "aborted"]
    if any(marker in text for marker in markers):
        return "memory/assertion"
    if "unknown dialect" in text or "unregistered" in text:
        return "dialect registration"
    if "expected" in text:
        return "parser"
    if "verifier" in text or "verification failed" in text:
        return "verifier"
    return "unknown failure"


def record(seed: str, family: str, pipeline: str, result: dict) -> dict:
    return {
        "seed": seed,
        "family": family,
        "pipeline": pipeline,
        "return_code": result["return_code"],
        "category": classify(result),
        "elapsed_ms": result["elapsed_ms"],
        "stderr_excerpt": result["stderr"][:1000],
    }


def write_artifact(artifacts: Path, seed_name: str, pipeline: str, result: dict) -> None:
    stem = seed_name.removesuffix(".mlir")
    (artifacts / f"{stem}__{pipeline}.stdout.mlir").write_text(result["stdout"], encoding="utf-8")
    (artifacts / f"{stem}__{pipeline}.stderr.txt").write_text(result["stderr"], encoding="utf-8")


def write_report(report: dict) -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    (OUT_DIR / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    lines = [
        "# Original MLIR 23 Search Report",
        "",
        f"- Tool: `{report['tool']}`",
        f"- Seeds: {report['seed_count']}",
        f"- Pipelines: {len(report['pipelines'])}",
        f"- Runs: {len(report['runs'])}",
        f"- Hard failures: {len(report['hard_failures'])}",
        "",
    ]
    if report["hard_failures"]:
        lines.append("## Hard Failures")
        for item in report["hard_failures"]:
            lines.extend([
                "",
                f"### {item['seed']} / {item['pipeline']}",
                "",
                f"- Family: {item['family']}",
                f"- Return: {item['return_code']}",
                f"- Category: {item['category']}",
                "",
                "```text",
                item["stderr_excerpt"],
                "```",
            ])
    else:
        lines.append("No current MLIR 23 hard failure found in this generated-original batch.")
    (OUT_DIR / "report.md").write_text("\n".join(lines), encoding="utf-8")


def sync_source_index(seeds: list[tuple[str, str, str]]) -> None:
    if SOURCE_INDEX.exists():
        source_index = json.loads(SOURCE_INDEX.read_text(encoding="utf-8-sig"))
    else:
        source_index = {}
    for name, family, _text in seeds:
        source_index[f"seeds/original_search_mlir23/{name}"] = {
            "origin": "generated-original-search",
            "source": "local structured generator scripts/search_original_mlir23.py",
            "family": family,
        }
    SOURCE_INDEX.write_text(json.dumps(dict(sorted(source_index.items())), ensure_ascii=False, indent=2), encoding="utf-8")


def print_summary(report: dict) -> None:
    counts: dict[str, int] = {}
    for run in report["runs"]:
        counts[run["category"]] = counts.get(run["category"], 0) + 1
    print(f"seeds: {report['seed_count']}")
    print(f"runs: {len(report['runs'])}")
    print(f"categories: {counts}")
    print(f"hard_failures: {len(report['hard_failures'])}")
    print(f"report: {OUT_DIR / 'report.md'}")


if __name__ == "__main__":
    raise SystemExit(main())
