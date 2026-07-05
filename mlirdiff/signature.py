from __future__ import annotations

import hashlib
import re

from .model import RunRecord


_HEX_RE = re.compile(r"0x[0-9a-fA-F]+")
_PATH_RE = re.compile(r"([A-Za-z]:)?[\\/][^\s:]+")
_NUMBER_RE = re.compile(r"\b\d+\b")
_WS_RE = re.compile(r"\s+")


def failure_signature(run: RunRecord) -> str:
    """Return a stable signature for grouping similar failures."""
    text = run.stderr or run.stdout or run.category
    lines = [_normalize_line(line) for line in text.splitlines()]
    lines = [line for line in lines if line]
    if not lines:
        lines = [run.category or "unknown failure"]
    basis = "\n".join(lines[:5])
    digest = hashlib.sha1(basis.encode("utf-8", errors="replace")).hexdigest()[:10]
    return f"{run.category}:{digest}"


def signature_excerpt(run: RunRecord, limit: int = 320) -> str:
    text = (run.stderr or run.stdout or "").strip()
    if not text:
        return run.category
    compact = "\n".join(line.rstrip() for line in text.splitlines()[:8])
    if len(compact) > limit:
        return compact[: limit - 3] + "..."
    return compact


def _normalize_line(line: str) -> str:
    line = _HEX_RE.sub("0xADDR", line)
    line = _PATH_RE.sub("/PATH", line)
    line = _NUMBER_RE.sub("N", line)
    line = _WS_RE.sub(" ", line)
    return line.strip().lower()
