from __future__ import annotations

import re
from dataclasses import asdict, dataclass

from .ir_stats import ir_stats
from .model import RunRecord


_LOWERING_HINTS = {
    "convert-vector-to-llvm": {"vector"},
    "convert-func-to-llvm": {"func"},
    "finalize-memref-to-llvm": {"memref"},
    "convert-linalg-to-affine": {"linalg"},
    "convert-linalg-to-loops": {"linalg"},
    "lower-affine": {"affine"},
    "convert-scf-to-cf": {"scf"},
}


@dataclass(frozen=True)
class InvariantFinding:
    seed: str
    pipeline: str
    kind: str
    severity: str
    summary: str
    evidence: str

    def to_dict(self) -> dict:
        return asdict(self)


def analyze_invariants(runs: list[RunRecord]) -> list[InvariantFinding]:
    findings: list[InvariantFinding] = []
    for run in runs:
        if run.command.startswith("mock-mlir-opt"):
            continue
        if run.return_code != 0 or run.timed_out:
            continue
        expected_removed = _expected_removed_dialects(run.command)
        if not expected_removed:
            continue
        stats = ir_stats(run.stdout)
        dialects = set(stats["dialects"])
        residual = sorted(dialects & expected_removed)
        if not residual:
            continue
        findings.append(
            InvariantFinding(
                seed=run.seed,
                pipeline=run.pipeline,
                kind="residual dialect after lowering",
                severity="info",
                summary=(
                    "A lowering pipeline completed but the output still contains "
                    f"high-level dialect(s): {', '.join(residual)}."
                ),
                evidence=_evidence(run.stdout, residual),
            )
        )
    return findings


def _expected_removed_dialects(command: str) -> set[str]:
    expected: set[str] = set()
    for marker, dialects in _LOWERING_HINTS.items():
        if marker in command:
            expected.update(dialects)
    return expected


def _evidence(text: str, dialects: list[str]) -> str:
    patterns = [re.compile(rf"\b{re.escape(dialect)}\.[A-Za-z_][\w.]*\b") for dialect in dialects]
    lines = []
    for line in text.splitlines():
        if line.strip().startswith("//"):
            continue
        if any(pattern.search(line) for pattern in patterns):
            lines.append(line.strip())
        if len(lines) >= 8:
            break
    return "\n".join(lines) if lines else "Dialect remains in structured statistics."
