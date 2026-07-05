from __future__ import annotations

import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "seeds" / "real_official_main23"
DST = ROOT / "seeds" / "real_official_main23_functions"
SOURCE_INDEX = ROOT / "data" / "seed_sources.json"


def main() -> int:
    DST.mkdir(parents=True, exist_ok=True)
    source_index = json.loads(SOURCE_INDEX.read_text(encoding="utf-8-sig")) if SOURCE_INDEX.exists() else {}
    added = 0
    for path in sorted(SRC.glob("*.mlir")):
        text = path.read_text(encoding="utf-8")
        prefix = collect_prefix(text)
        for idx, chunk in enumerate(extract_func_chunks(text)):
            if "expected-" in chunk or "expected error" in chunk.lower():
                continue
            out = DST / f"{path.stem}__fn_{idx:03d}.mlir"
            if out.exists():
                continue
            out.write_text((prefix + "\n" + chunk).strip() + "\n", encoding="utf-8")
            source_index[rel(out)] = {
                "origin": "official-main23-function-extract",
                "source": f"function extracted from {rel(path)}",
            }
            added += 1
    SOURCE_INDEX.write_text(json.dumps(dict(sorted(source_index.items())), ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"function seeds added={added}")
    print(f"output={DST}")
    return 0


def collect_prefix(text: str) -> str:
    lines = []
    for line in text.splitlines():
        stripped = line.strip()
        if stripped.startswith("#") or stripped.startswith("module attributes"):
            lines.append(line)
            continue
        if stripped.startswith("func.func") or stripped.startswith("module ") or stripped.startswith("llvm.func"):
            break
    return "\n".join(lines)


def extract_func_chunks(text: str) -> list[str]:
    lines = text.splitlines()
    chunks: list[str] = []
    current: list[str] = []
    depth = 0
    active = False
    for line in lines:
        stripped = line.strip()
        if not active and (stripped.startswith("func.func ") or stripped.startswith("llvm.func ")):
            active = True
            current = [line]
            depth = brace_delta(line)
            if depth == 0 and "{" in line:
                chunks.append("\n".join(current))
                active = False
            continue
        if active:
            current.append(line)
            depth += brace_delta(line)
            if depth <= 0:
                chunk = "\n".join(current)
                if looks_self_contained(chunk):
                    chunks.append(chunk)
                active = False
                current = []
    return chunks


def brace_delta(line: str) -> int:
    cleaned = re.sub(r"//.*", "", line)
    return cleaned.count("{") - cleaned.count("}")


def looks_self_contained(chunk: str) -> bool:
    return "return" in chunk or "llvm.return" in chunk or "func.return" in chunk


def rel(path: Path) -> str:
    return str(path.relative_to(ROOT)).replace("\\", "/")


if __name__ == "__main__":
    raise SystemExit(main())
