from __future__ import annotations

import difflib
from collections import defaultdict

from .ir_stats import stats_delta
from .model import Issue, RunRecord


def analyze_runs(runs: list[RunRecord]) -> list[Issue]:
    issues: list[Issue] = []
    by_seed: dict[str, list[RunRecord]] = defaultdict(list)
    for run in runs:
        by_seed[run.seed].append(run)

    for seed, seed_runs in by_seed.items():
        successes = [run for run in seed_runs if run.return_code == 0 and not run.timed_out]
        failures = [run for run in seed_runs if run.return_code != 0 or run.timed_out]

        if successes and failures:
            issues.append(
                Issue(
                    seed=seed,
                    severity="high",
                    kind="pipeline divergence",
                    summary="Some pipelines succeeded while others failed.",
                    details=_status_table(seed_runs),
                )
            )
        elif failures:
            categories = sorted({run.category for run in failures})
            issues.append(
                Issue(
                    seed=seed,
                    severity="medium",
                    kind="all pipelines failed",
                    summary=f"All pipelines failed. Categories: {', '.join(categories)}.",
                    details=_status_table(seed_runs),
                )
            )

    return issues


def collect_output_deltas(runs: list[RunRecord], limit: int = 50) -> list[dict]:
    deltas: list[dict] = []
    by_seed: dict[str, list[RunRecord]] = defaultdict(list)
    for run in runs:
        by_seed[run.seed].append(run)

    for seed, seed_runs in by_seed.items():
        successes = [run for run in seed_runs if run.return_code == 0 and not run.timed_out]
        if len(successes) < 2:
            continue
        normalized = {run.pipeline: _normalize_ir(run.stdout) for run in successes}
        values = list(normalized.values())
        if any(value != values[0] for value in values[1:]):
            deltas.append(
                {
                    "seed": seed,
                    "summary": "Successful pipelines produced different IR text. This is an analysis signal, not a security issue by itself.",
                    "details": _first_diff(normalized),
                }
            )
            if len(deltas) >= limit:
                break
    return deltas


def _normalize_ir(text: str) -> str:
    lines = []
    for line in text.splitlines():
        stripped = line.strip()
        if stripped:
            lines.append(stripped)
    return "\n".join(lines)


def _first_diff(outputs: dict[str, str]) -> str:
    names = list(outputs)
    base_name = names[0]
    base = outputs[base_name].splitlines()
    for other_name in names[1:]:
        other = outputs[other_name].splitlines()
        if base != other:
            text_diff = "\n".join(
                difflib.unified_diff(
                    base,
                    other,
                    fromfile=base_name,
                    tofile=other_name,
                    lineterm="",
                    n=3,
                )
            )
            return (
                stats_delta(base_name, outputs[base_name], other_name, outputs[other_name])
                + "\n\nText diff\n"
                + text_diff
            )
    return ""


def _status_table(runs: list[RunRecord]) -> str:
    rows = ["pipeline | return_code | category | timed_out", "--- | --- | --- | ---"]
    for run in runs:
        rows.append(
            f"{run.pipeline} | {run.return_code} | {run.category} | {str(run.timed_out).lower()}"
        )
    return "\n".join(rows)
