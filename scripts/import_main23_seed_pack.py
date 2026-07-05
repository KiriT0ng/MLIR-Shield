from __future__ import annotations

import json
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE_INDEX = ROOT / "data" / "seed_sources.json"
RAW_BASE = "https://raw.githubusercontent.com/llvm/llvm-project/main/"


TARGETS = [
    "mlir/test/Dialect/Affine/SuperVectorize/vectorize_1d.mlir",
    "mlir/test/Dialect/Affine/SuperVectorize/vectorize_2d.mlir",
    "mlir/test/Dialect/Affine/affine-loop-invariant-code-motion.mlir",
    "mlir/test/Dialect/Affine/affine-scalrep.mlir",
    "mlir/test/Dialect/Affine/affine-data-copy.mlir",
    "mlir/test/Dialect/Arith/canonicalize.mlir",
    "mlir/test/Dialect/Arith/int-range-opts.mlir",
    "mlir/test/Dialect/Arith/int-range-interface.mlir",
    "mlir/test/Dialect/Bufferization/Transforms/one-shot-bufferize-analysis.mlir",
    "mlir/test/Dialect/Bufferization/Transforms/one-shot-bufferize-allow-return-allocs.mlir",
    "mlir/test/Dialect/Bufferization/Transforms/one-shot-module-bufferize.mlir",
    "mlir/test/Dialect/GPU/canonicalize.mlir",
    "mlir/test/Dialect/GPU/all-reduce-maxnum.mlir",
    "mlir/test/Dialect/GPU/bufferization.mlir",
    "mlir/test/Dialect/Linalg/canonicalize.mlir",
    "mlir/test/Dialect/Linalg/fusion-elementwise-ops.mlir",
    "mlir/test/Dialect/Linalg/fusion-tensor.mlir",
    "mlir/test/Dialect/Linalg/generalize-named-ops.mlir",
    "mlir/test/Dialect/Linalg/inline-scalar-operands.mlir",
    "mlir/test/Dialect/Linalg/loops.mlir",
    "mlir/test/Dialect/Linalg/vectorization.mlir",
    "mlir/test/Dialect/MemRef/canonicalize.mlir",
    "mlir/test/Dialect/MemRef/expand-ops.mlir",
    "mlir/test/Dialect/MemRef/fold-memref-alias-ops.mlir",
    "mlir/test/Dialect/MemRef/memref-dependence-check.mlir",
    "mlir/test/Dialect/SCF/canonicalize.mlir",
    "mlir/test/Dialect/SCF/for-loop-canonicalization.mlir",
    "mlir/test/Dialect/SCF/for-loop-peeling.mlir",
    "mlir/test/Dialect/SCF/for-loop-range-folding.mlir",
    "mlir/test/Dialect/SCF/parallel-loop-collapsing.mlir",
    "mlir/test/Dialect/Shape/canonicalize.mlir",
    "mlir/test/Dialect/Shape/fold-div.mlir",
    "mlir/test/Dialect/SparseTensor/codegen.mlir",
    "mlir/test/Dialect/SparseTensor/codegen_buffer_initialization.mlir",
    "mlir/test/Dialect/SparseTensor/sparse_conv_2d.mlir",
    "mlir/test/Dialect/Tensor/canonicalize.mlir",
    "mlir/test/Dialect/Tensor/decompose-concat.mlir",
    "mlir/test/Dialect/Tensor/fold-into-pack-and-unpack.mlir",
    "mlir/test/Dialect/Tensor/fold-tensor-subset-ops.mlir",
    "mlir/test/Dialect/Tensor/reify-result-shapes.mlir",
    "mlir/test/Dialect/Tosa/canonicalize.mlir",
    "mlir/test/Dialect/Tosa/constant-op-fold.mlir",
    "mlir/test/Dialect/Tosa/ops.mlir",
    "mlir/test/Dialect/Vector/canonicalize.mlir",
    "mlir/test/Dialect/Vector/invalid.mlir",
    "mlir/test/Dialect/Vector/vector-contract-transforms.mlir",
    "mlir/test/Dialect/Vector/vector-transfer-full-partial-split.mlir",
    "mlir/test/Dialect/Vector/vector-transfer-lowering.mlir",
    "mlir/test/Conversion/ArithToLLVM/arith-to-llvm.mlir",
    "mlir/test/Conversion/FuncToLLVM/convert-funcs.mlir",
    "mlir/test/Conversion/LinalgToLoops/linalg-to-loops.mlir",
    "mlir/test/Conversion/MemRefToLLVM/memref-to-llvm.mlir",
    "mlir/test/Conversion/SCFToControlFlow/convert-to-cfg.mlir",
    "mlir/test/Conversion/TosaToLinalg/tosa-to-linalg.mlir",
    "mlir/test/Conversion/VectorToLLVM/vector-to-llvm.mlir",
]


def main() -> int:
    source_index = load_source_index()
    added = 0
    skipped = 0
    failed = 0
    for remote_path in TARGETS:
        local = ROOT / "seeds" / "real_official_main23" / local_name(remote_path)
        key = relative_key(local)
        if local.exists():
            skipped += 1
            source_index.setdefault(key, meta(remote_path))
            continue
        try:
            text = download(RAW_BASE + remote_path)
        except urllib.error.URLError as exc:
            print(f"failed: {remote_path}: {exc}", file=sys.stderr)
            failed += 1
            continue
        local.parent.mkdir(parents=True, exist_ok=True)
        local.write_text(strip_filecheck_noise(text), encoding="utf-8")
        source_index[key] = meta(remote_path)
        added += 1
    SOURCE_INDEX.write_text(
        json.dumps(dict(sorted(source_index.items())), ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
    print(f"main23 official seeds added={added} skipped={skipped} failed={failed}")
    return 0 if added else 1


def local_name(remote_path: str) -> str:
    parts = remote_path.split("/")
    stem = Path(parts[-1]).stem
    if "Dialect" in parts:
        idx = parts.index("Dialect")
        prefix = "dialect_" + "_".join(parts[idx + 1 : -1]).lower()
    elif "Conversion" in parts:
        idx = parts.index("Conversion")
        prefix = "conversion_" + "_".join(parts[idx + 1 : -1]).lower()
    else:
        prefix = "_".join(parts[-3:-1]).lower()
    name = re.sub(r"[^a-zA-Z0-9_]+", "_", prefix + "_" + stem).strip("_")
    return name + ".mlir"


def meta(remote_path: str) -> dict:
    return {
        "origin": "official-main23",
        "source": f"https://github.com/llvm/llvm-project/blob/main/{remote_path}",
    }


def load_source_index() -> dict:
    if not SOURCE_INDEX.exists():
        return {}
    return json.loads(SOURCE_INDEX.read_text(encoding="utf-8"))


def relative_key(path: Path) -> str:
    return str(path.relative_to(ROOT)).replace("\\", "/")


def download(url: str) -> str:
    request = urllib.request.Request(url, headers={"User-Agent": "mlirdiff-main23-importer"})
    with urllib.request.urlopen(request, timeout=30) as response:
        if response.status != 200:
            raise urllib.error.URLError(f"HTTP {response.status}")
        return response.read().decode("utf-8", errors="replace")


def strip_filecheck_noise(text: str) -> str:
    kept = []
    for line in text.splitlines():
        stripped = line.strip()
        if stripped.startswith("// RUN:") or re.match(r"//\s*[A-Z0-9_-]+:", stripped):
            continue
        kept.append(line)
    return "\n".join(kept).strip() + "\n"


if __name__ == "__main__":
    raise SystemExit(main())
