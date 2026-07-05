from __future__ import annotations

import re
from collections import Counter


_OP_RE = re.compile(r"(?:^|[=\s])([a-zA-Z_][\w]*\.[a-zA-Z_][\w.]*)\b")
_TYPE_RE = re.compile(r"\b(tensor|memref|vector|index|i\d+|f\d+)\b")


def ir_stats(text: str) -> dict:
    text = "\n".join(_code_lines(text))
    operations = _OP_RE.findall(text)
    dialects = [op.split(".", 1)[0] for op in operations]
    types = _TYPE_RE.findall(text)
    return {
        "operation_count": len(operations),
        "dialects": dict(sorted(Counter(dialects).items())),
        "top_operations": dict(Counter(operations).most_common(10)),
        "types": dict(sorted(Counter(types).items())),
        "function_count": sum(1 for op in operations if op == "func.func"),
    }


def _code_lines(text: str) -> list[str]:
    lines = []
    for line in text.splitlines():
        stripped = line.strip()
        if not stripped or stripped.startswith("//"):
            continue
        if "//" in line:
            line = line.split("//", 1)[0]
        lines.append(line)
    return lines


def stats_delta(base_name: str, base_text: str, other_name: str, other_text: str) -> str:
    base = ir_stats(base_text)
    other = ir_stats(other_text)
    lines = [
        "Structured IR summary",
        f"- {base_name}: operations={base['operation_count']}, functions={base['function_count']}, dialects={_compact(base['dialects'])}",
        f"- {other_name}: operations={other['operation_count']}, functions={other['function_count']}, dialects={_compact(other['dialects'])}",
    ]
    changed_types = _changed_map(base["types"], other["types"])
    if changed_types:
        lines.append(f"- type-count changes: {_compact(changed_types)}")
    return "\n".join(lines)


def _changed_map(left: dict[str, int], right: dict[str, int]) -> dict[str, str]:
    keys = sorted(set(left) | set(right))
    changed: dict[str, str] = {}
    for key in keys:
        if left.get(key, 0) != right.get(key, 0):
            changed[key] = f"{left.get(key, 0)}->{right.get(key, 0)}"
    return changed


def _compact(values: dict) -> str:
    if not values:
        return "none"
    return ", ".join(f"{key}:{value}" for key, value in values.items())
