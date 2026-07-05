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
SEED_DIR = ROOT / "seeds" / "independent_fuzz_mlir23"
OUT_DIR = ROOT / "outputs" / "independent_fuzz_mlir23"
SOURCE_INDEX = ROOT / "data" / "seed_sources.json"


@dataclass(frozen=True)
class Pipeline:
    name: str
    args: list[str]


PIPELINES = [
    Pipeline("parse_verify", []),
    Pipeline("memref_metadata_to_llvm", ["--expand-strided-metadata", "--memref-expand", "--fold-memref-alias-ops", "--finalize-memref-to-llvm", "--canonicalize", "--cse"]),
    Pipeline("tensor_shape_canon", ["--reify-result-shapes", "--resolve-shaped-type-result-dims", "--fold-tensor-subset-ops", "--canonicalize", "--cse"]),
    Pipeline("vector_lowering_chain", ["--lower-vector-mask", "--lower-vector-multi-reduction", "--convert-vector-to-scf", "--convert-vector-to-llvm", "--canonicalize", "--cse"]),
    Pipeline("bufferization_ownership", ["--one-shot-bufferize", "--ownership-based-buffer-deallocation", "--bufferization-lower-deallocations", "--canonicalize", "--cse"]),
    Pipeline("linalg_bufferize_lower", ["--one-shot-bufferize", "--convert-linalg-to-loops", "--convert-scf-to-cf", "--canonicalize", "--cse"]),
    Pipeline("sparse_lowering_chain", ["--pre-sparsification-rewrite", "--sparsification", "--sparse-tensor-conversion", "--canonicalize", "--cse"]),
    Pipeline("arith_cf_llvm", ["--convert-arith-to-llvm", "--convert-cf-to-llvm", "--canonicalize", "--cse"]),
]


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Targeted MLIR 23 search for independent non-inliner original candidates.")
    parser.add_argument("--count", type=int, default=240)
    parser.add_argument("--seed", type=int, default=20260604)
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
    return 1 if report["independent_candidates"] else 0


def generate(count: int) -> list[tuple[str, str, str]]:
    families = [
        memref_layout_cast_chain,
        memref_rank_reassociation,
        tensor_pad_insert_slice,
        tensor_extract_slice_rank_mix,
        vector_mask_transfer_write,
        vector_contract_transpose,
        bufferization_alias_loop,
        linalg_dynamic_tensor,
        sparse_rank_convert,
        arith_cf_select_ext,
    ]
    rows: list[tuple[str, str, str]] = []
    for i in range(count):
        family = families[i % len(families)]
        name, text = family(i)
        rows.append((name, family.__name__, text))
    return rows


def memref_layout_cast_chain(i: int) -> tuple[str, str]:
    m = 2 + i % 5
    n = 3 + (i // 5) % 5
    offset = i % 4
    return (
        f"ind_memref_layout_cast_chain_{i:04d}.mlir",
        f"""func.func @ind_memref_layout_cast_chain_{i}(%arg0: memref<{m}x{n}xf32>, %i: index, %j: index) -> f32 {{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %cast = memref.cast %arg0 : memref<{m}x{n}xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  %sub = memref.subview %cast[%c0, %c0][{m}, {n}][%c1, %c1] : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<{m}x{n}xf32, strided<[?, ?], offset: ?>>
  %re = memref.reinterpret_cast %sub to offset: [{offset}], sizes: [{m}, {n}], strides: [{n}, 1] : memref<{m}x{n}xf32, strided<[?, ?], offset: ?>> to memref<{m}x{n}xf32, strided<[{n}, 1], offset: {offset}>>
  %v = memref.load %re[%i, %j] : memref<{m}x{n}xf32, strided<[{n}, 1], offset: {offset}>>
  return %v : f32
}}
""",
    )


def memref_rank_reassociation(i: int) -> tuple[str, str]:
    a = 2 + i % 3
    b = 2 + (i // 3) % 4
    c = 2 + (i // 7) % 3
    return (
        f"ind_memref_rank_reassociation_{i:04d}.mlir",
        f"""func.func @ind_memref_rank_reassociation_{i}(%arg0: memref<{a}x{b}x{c}xf32>, %i: index, %j: index) -> f32 {{
  %collapsed = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<{a}x{b}x{c}xf32> into memref<{a*b}x{c}xf32>
  %expanded = memref.expand_shape %collapsed [[0, 1], [2]] output_shape [{a}, {b}, {c}] : memref<{a*b}x{c}xf32> into memref<{a}x{b}x{c}xf32>
  %v = memref.load %expanded[%i, %j, %i] : memref<{a}x{b}x{c}xf32>
  return %v : f32
}}
""",
    )


def tensor_pad_insert_slice(i: int) -> tuple[str, str]:
    m = 2 + i % 4
    n = 2 + (i // 4) % 4
    pad = 1 + i % 2
    return (
        f"ind_tensor_pad_insert_slice_{i:04d}.mlir",
        f"""func.func @ind_tensor_pad_insert_slice_{i}(%src: tensor<{m}x{n}xf32>, %dst: tensor<{m + 2 * pad}x{n + 2 * pad}xf32>) -> tensor<{m + 2 * pad}x{n + 2 * pad}xf32> {{
  %zero = arith.constant 0.000000e+00 : f32
  %padded = tensor.pad %src low[{pad}, {pad}] high[{pad}, {pad}] {{
  ^bb0(%i: index, %j: index):
    tensor.yield %zero : f32
  }} : tensor<{m}x{n}xf32> to tensor<{m + 2 * pad}x{n + 2 * pad}xf32>
  %out = tensor.insert_slice %padded into %dst[0, 0] [{m + 2 * pad}, {n + 2 * pad}] [1, 1] : tensor<{m + 2 * pad}x{n + 2 * pad}xf32> into tensor<{m + 2 * pad}x{n + 2 * pad}xf32>
  return %out : tensor<{m + 2 * pad}x{n + 2 * pad}xf32>
}}
""",
    )


def tensor_extract_slice_rank_mix(i: int) -> tuple[str, str]:
    m = 4 + i % 5
    n = 4 + (i // 5) % 5
    return (
        f"ind_tensor_extract_slice_rank_mix_{i:04d}.mlir",
        f"""func.func @ind_tensor_extract_slice_rank_mix_{i}(%arg0: tensor<{m}x{n}xf32>) -> tensor<2xf32> {{
  %slice = tensor.extract_slice %arg0[1, 0] [1, 2] [1, 1] : tensor<{m}x{n}xf32> to tensor<2xf32>
  return %slice : tensor<2xf32>
}}
""",
    )


def vector_mask_transfer_write(i: int) -> tuple[str, str]:
    rows = 1 + i % 4
    cols = 2 + (i // 4) % 4
    in0 = "true" if i % 2 == 0 else "false"
    in1 = "true" if i % 3 == 0 else "false"
    return (
        f"ind_vector_mask_transfer_write_{i:04d}.mlir",
        f"""func.func @ind_vector_mask_transfer_write_{i}(%src: memref<?x?xf32>, %dst: memref<?x?xf32>, %i: index, %j: index, %mask: vector<{rows}x{cols}xi1>) {{
  %pad = arith.constant 0.000000e+00 : f32
  %v = vector.transfer_read %src[%i, %j], %pad {{in_bounds = [{in0}, {in1}]}} : memref<?x?xf32>, vector<{rows}x{cols}xf32>
  vector.mask %mask {{ vector.transfer_write %v, %dst[%i, %j] {{in_bounds = [{in0}, {in1}]}} : vector<{rows}x{cols}xf32>, memref<?x?xf32> }} : vector<{rows}x{cols}xi1>
  return
}}
""",
    )


def vector_contract_transpose(i: int) -> tuple[str, str]:
    m = 2 + i % 3
    n = 2 + (i // 3) % 3
    return (
        f"ind_vector_contract_transpose_{i:04d}.mlir",
        f"""#map0 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
func.func @ind_vector_contract_transpose_{i}(%a: vector<{m}x{n}xf32>, %b: vector<{n}x{m}xf32>, %acc: vector<{m}x{m}xf32>) -> vector<{m}x{m}xf32> {{
  %0 = vector.contract {{indexing_maps = [#map0, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>}} %a, %b, %acc : vector<{m}x{n}xf32>, vector<{n}x{m}xf32> into vector<{m}x{m}xf32>
  %1 = vector.transpose %0, [1, 0] : vector<{m}x{m}xf32> to vector<{m}x{m}xf32>
  return %1 : vector<{m}x{m}xf32>
}}
""",
    )


def bufferization_alias_loop(i: int) -> tuple[str, str]:
    n = 3 + i % 6
    return (
        f"ind_bufferization_alias_loop_{i:04d}.mlir",
        f"""func.func @ind_bufferization_alias_loop_{i}(%arg0: tensor<{n}xf32>) -> tensor<{n}xf32> {{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c{n} = arith.constant {n} : index
  %init = tensor.empty() : tensor<{n}xf32>
  %out = scf.for %iv = %c0 to %c{n} step %c1 iter_args(%iter = %init) -> (tensor<{n}xf32>) {{
    %v = tensor.extract %arg0[%iv] : tensor<{n}xf32>
    %next = tensor.insert %v into %iter[%iv] : tensor<{n}xf32>
    scf.yield %next : tensor<{n}xf32>
  }}
  return %out : tensor<{n}xf32>
}}
""",
    )


def linalg_dynamic_tensor(i: int) -> tuple[str, str]:
    m = 2 + i % 4
    n = 2 + (i // 4) % 4
    return (
        f"ind_linalg_dynamic_tensor_{i:04d}.mlir",
        f"""#map = affine_map<(d0, d1) -> (d0, d1)>
func.func @ind_linalg_dynamic_tensor_{i}(%lhs: tensor<{m}x{n}xf32>, %rhs: tensor<{m}x{n}xf32>) -> tensor<{m}x{n}xf32> {{
  %init = tensor.empty() : tensor<{m}x{n}xf32>
  %out = linalg.generic {{indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]}} ins(%lhs, %rhs : tensor<{m}x{n}xf32>, tensor<{m}x{n}xf32>) outs(%init : tensor<{m}x{n}xf32>) {{
  ^bb0(%a: f32, %b: f32, %old: f32):
    %sum = arith.addf %a, %b : f32
    linalg.yield %sum : f32
  }} -> tensor<{m}x{n}xf32>
  return %out : tensor<{m}x{n}xf32>
}}
""",
    )


def sparse_rank_convert(i: int) -> tuple[str, str]:
    n = 4 + i % 8
    return (
        f"ind_sparse_rank_convert_{i:04d}.mlir",
        f"""#Sparse1D = #sparse_tensor.encoding<{{ map = (d0) -> (d0 : compressed) }}>
func.func @ind_sparse_rank_convert_{i}(%arg0: tensor<{n}xf32, #Sparse1D>) -> tensor<?xf32, #Sparse1D> {{
  %out = sparse_tensor.convert %arg0 : tensor<{n}xf32, #Sparse1D> to tensor<?xf32, #Sparse1D>
  return %out : tensor<?xf32, #Sparse1D>
}}
""",
    )


def arith_cf_select_ext(i: int) -> tuple[str, str]:
    return (
        f"ind_arith_cf_select_ext_{i:04d}.mlir",
        f"""func.func @ind_arith_cf_select_ext_{i}(%cond: i1, %x: i8, %y: i8) -> i64 {{
  %sel = arith.select %cond, %x, %y : i8
  %ext = arith.extui %sel : i8 to i64
  cf.cond_br %cond, ^bb1(%ext : i64), ^bb2(%ext : i64)
^bb1(%a: i64):
  return %a : i64
^bb2(%b: i64):
  return %b : i64
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
    independent = []
    for name, family, text in seeds:
        seed_path = f"seeds/independent_fuzz_mlir23/{name}"
        parse = run_remote(client, mlir_opt, [], text, timeout_seconds)
        parse_item = record(seed_path, family, "parse_verify", parse)
        runs.append(parse_item)
        write_artifact(artifacts, name, "parse_verify", parse)
        if parse_item["category"] != "success":
            continue
        for pipeline in relevant_pipelines(family):
            result = run_remote(client, mlir_opt, pipeline.args, text, timeout_seconds)
            item = record(seed_path, family, pipeline.name, result)
            item["known_similarity"] = known_similarity(result["stderr"], pipeline.name)
            runs.append(item)
            write_artifact(artifacts, name, pipeline.name, result)
            if item["category"] in {"memory/assertion", "timeout"}:
                hard.append(item)
                if item["known_similarity"] == "none":
                    independent.append(item)
    return {
        "tool": mlir_opt,
        "seed_count": len(seeds),
        "pipelines": [p.name for p in PIPELINES],
        "runs": runs,
        "hard_failures": hard,
        "independent_candidates": independent,
        "summary": summarize(runs, hard, independent),
    }


def relevant_pipelines(family: str) -> list[Pipeline]:
    if family.startswith("memref"):
        return [PIPELINES[1], PIPELINES[2]]
    if family.startswith("tensor"):
        return [PIPELINES[2], PIPELINES[4]]
    if family.startswith("vector"):
        return [PIPELINES[3]]
    if family.startswith("bufferization"):
        return [PIPELINES[4]]
    if family.startswith("linalg"):
        return [PIPELINES[4], PIPELINES[5]]
    if family.startswith("sparse"):
        return [PIPELINES[6]]
    if family.startswith("arith"):
        return [PIPELINES[7]]
    return PIPELINES[1:]


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


def known_similarity(stderr: str, pipeline_name: str) -> str:
    text = stderr.lower()
    if "inliner::doinlining" in text or "symboluses" in text:
        return "similar-to-llvm-197960"
    if "operation destroyed but still has uses" in text or "mem2reg" in text:
        return "similar-to-llvm-197158"
    if pipeline_name == "arith_cf_llvm" and ("stack overflow" in text or "segmentation fault" in text):
        return "check-against-llvm-159675"
    return "none"


def record(seed: str, family: str, pipeline: str, result: dict) -> dict:
    return {
        "seed": seed,
        "family": family,
        "pipeline": pipeline,
        "return_code": result["return_code"],
        "category": classify(result),
        "elapsed_ms": result["elapsed_ms"],
        "stderr_excerpt": result["stderr"][:1600],
    }


def write_artifact(artifacts: Path, seed_name: str, pipeline: str, result: dict) -> None:
    stem = seed_name.removesuffix(".mlir")
    (artifacts / f"{stem}__{pipeline}.stdout.mlir").write_text(result["stdout"], encoding="utf-8")
    (artifacts / f"{stem}__{pipeline}.stderr.txt").write_text(result["stderr"], encoding="utf-8")


def summarize(runs: list[dict], hard: list[dict], independent: list[dict]) -> dict:
    categories: dict[str, int] = {}
    families: dict[str, int] = {}
    for run_item in runs:
        categories[run_item["category"]] = categories.get(run_item["category"], 0) + 1
        families[run_item["family"]] = families.get(run_item["family"], 0) + 1
    return {
        "run_categories": categories,
        "family_runs": families,
        "hard_failure_count": len(hard),
        "independent_candidate_count": len(independent),
    }


def write_report(report: dict) -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    (OUT_DIR / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    md = render_markdown(report)
    (OUT_DIR / "report.md").write_text(md, encoding="utf-8")
    (OUT_DIR / "report.html").write_text(render_html(md), encoding="utf-8")


def render_markdown(report: dict) -> str:
    lines = [
        "# Independent MLIR 23 Targeted Fuzz Report",
        "",
        f"- Tool: `{report['tool']}`",
        f"- Seeds: {report['seed_count']}",
        f"- Runs: {len(report['runs'])}",
        f"- Hard/timeout failures: {len(report['hard_failures'])}",
        f"- Independent candidates after public-similarity filter: {len(report['independent_candidates'])}",
        "",
        "## Category Counts",
        "",
    ]
    for key, value in sorted(report["summary"]["run_categories"].items()):
        lines.append(f"- {key}: {value}")
    lines.extend(["", "## Independent Candidates", ""])
    if not report["independent_candidates"]:
        lines.append("No independent non-inliner hard failure was found in this batch.")
    for item in report["independent_candidates"][:30]:
        lines.extend([
            "### Candidate",
            "",
            f"- Seed: `{item['seed']}`",
            f"- Family: `{item['family']}`",
            f"- Pipeline: `{item['pipeline']}`",
            f"- Category: `{item['category']}`",
            "",
            "```text",
            item["stderr_excerpt"],
            "```",
            "",
        ])
    lines.extend(["", "## All Hard/Timeout Failures", ""])
    if not report["hard_failures"]:
        lines.append("No hard failure or timeout found.")
    for item in report["hard_failures"][:30]:
        lines.extend([
            "### Hard/Timeout",
            "",
            f"- Seed: `{item['seed']}`",
            f"- Family: `{item['family']}`",
            f"- Pipeline: `{item['pipeline']}`",
            f"- Category: `{item['category']}`",
            f"- Known similarity: `{item.get('known_similarity', 'none')}`",
            "",
            "```text",
            item["stderr_excerpt"],
            "```",
            "",
        ])
    return "\n".join(lines)


def render_html(markdown: str) -> str:
    escaped = markdown.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
    return f"""<!doctype html>
<html lang=\"zh-CN\">
<meta charset=\"utf-8\">
<title>Independent MLIR 23 Targeted Fuzz Report</title>
<style>
body {{ font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", sans-serif; margin: 32px; color: #172033; }}
pre {{ background: #f4f6f8; padding: 14px; overflow: auto; border-radius: 6px; }}
</style>
<pre>{escaped}</pre>
</html>
"""


def sync_source_index(seeds: list[tuple[str, str, str]]) -> None:
    source_index = json.loads(SOURCE_INDEX.read_text(encoding="utf-8-sig")) if SOURCE_INDEX.exists() else {}
    for name, family, _text in seeds:
        source_index[f"seeds/independent_fuzz_mlir23/{name}"] = {
            "origin": "generated-independent-fuzz",
            "source": "local targeted generator scripts/fuzz_independent_mlir23.py",
            "family": family,
        }
    SOURCE_INDEX.write_text(json.dumps(dict(sorted(source_index.items())), ensure_ascii=False, indent=2), encoding="utf-8")


def print_summary(report: dict) -> None:
    print(f"seeds: {report['seed_count']}")
    print(f"runs: {len(report['runs'])}")
    print(f"categories: {report['summary']['run_categories']}")
    print(f"hard_failures: {len(report['hard_failures'])}")
    print(f"independent_candidates: {len(report['independent_candidates'])}")
    print(f"report: {OUT_DIR / 'report.md'}")


if __name__ == "__main__":
    raise SystemExit(main())
