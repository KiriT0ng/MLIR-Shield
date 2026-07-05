from __future__ import annotations

from .model import RunRecord


def classify_run(record: RunRecord) -> str:
    if record.return_code == 0 and not record.timed_out:
        return "success"
    text = f"{record.stderr}\n{record.stdout}".lower()
    if record.timed_out:
        return "timeout"
    crash_markers = (
        "assertion failed",
        "stack dump",
        "segmentation fault",
        "please submit a bug report",
        "llvm error",
        "aborted",
        "access violation",
    )
    if any(marker in text for marker in crash_markers):
        return "memory/assertion"
    if "unknown dialect" in text or "unregistered" in text:
        return "dialect registration"
    if "expected" in text and ("operation" in text or "ssa" in text or "type" in text):
        return "parser"
    if "failed to legalize" in text or "illegal type" in text or "type mismatch" in text:
        return "type legality"
    if "verification failed" in text or "verifier" in text:
        return "verifier"
    if "pattern" in text or "rewrite" in text:
        return "rewrite"
    return "unknown failure"
