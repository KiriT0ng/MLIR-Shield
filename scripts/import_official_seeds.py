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
    ("mlir/test/Dialect/Tensor/canonicalize.mlir", "tensor/canonicalize_extra.mlir"),
    ("mlir/test/Dialect/Tensor/ops.mlir", "tensor/ops_extra.mlir"),
    ("mlir/test/Dialect/MemRef/canonicalize.mlir", "memref/canonicalize_extra.mlir"),
    ("mlir/test/Dialect/MemRef/invalid.mlir", "memref/invalid_extra.mlir"),
    ("mlir/test/Dialect/MemRef/ops.mlir", "memref/ops_extra.mlir"),
    ("mlir/test/Dialect/SCF/canonicalize.mlir", "scf/canonicalize_extra.mlir"),
    ("mlir/test/Dialect/SCF/for-loop-specialization.mlir", "scf/for_loop_specialization.mlir"),
    ("mlir/test/Dialect/LLVMIR/canonicalize.mlir", "llvmir/canonicalize_extra.mlir"),
    ("mlir/test/Dialect/Math/canonicalize.mlir", "math/canonicalize_extra.mlir"),
    ("mlir/test/Dialect/Shape/canonicalize.mlir", "shape/canonicalize_extra.mlir"),
    ("mlir/test/Dialect/Bufferization/Transforms/one-shot-bufferize.mlir", "bufferization/one_shot_bufferize.mlir"),
    ("mlir/test/Conversion/FuncToLLVM/convert-funcs.mlir", "conversion/func_to_llvm_convert_funcs_extra.mlir"),
    ("mlir/test/Conversion/MemRefToLLVM/memref-to-llvm.mlir", "conversion/memref_to_llvm_extra.mlir"),
    ("mlir/test/Conversion/VectorToLLVM/vector-to-llvm.mlir", "conversion/vector_to_llvm_extra.mlir"),
    ("mlir/test/Conversion/GPUToNVVM/gpu-to-nvvm.mlir", "conversion/gpu_to_nvvm_extra.mlir"),
    ("mlir/test/Conversion/TosaToLinalg/tosa-to-linalg.mlir", "conversion/tosa_to_linalg_extra.mlir"),
]


def main() -> int:
    source_index = load_source_index()
    added = 0
    skipped = 0
    failed = 0
    for remote_path, local_path in TARGETS:
        target = ROOT / "seeds" / "real_official" / local_path
        key = relative_key(target)
        if target.exists():
            skipped += 1
            source_index.setdefault(
                key,
                {
                    "origin": "official",
                    "source": f"https://github.com/llvm/llvm-project/blob/main/{remote_path}",
                },
            )
            continue
        url = RAW_BASE + remote_path
        try:
            text = download(url)
        except urllib.error.URLError as exc:
            print(f"failed: {remote_path}: {exc}", file=sys.stderr)
            failed += 1
            continue
        cleaned = strip_filecheck_noise(text)
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(cleaned, encoding="utf-8")
        source_index[key] = {
            "origin": "official",
            "source": f"https://github.com/llvm/llvm-project/blob/main/{remote_path}",
        }
        added += 1
    SOURCE_INDEX.write_text(
        json.dumps(dict(sorted(source_index.items())), ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
    print(f"official seeds added={added} skipped={skipped} failed={failed}")
    return 0 if failed == 0 else 1


def load_source_index() -> dict:
    if not SOURCE_INDEX.exists():
        return {}
    return json.loads(SOURCE_INDEX.read_text(encoding="utf-8"))


def relative_key(path: Path) -> str:
    return str(path.relative_to(ROOT)).replace("\\", "/")


def download(url: str) -> str:
    request = urllib.request.Request(url, headers={"User-Agent": "mlirdiff-seed-importer"})
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
