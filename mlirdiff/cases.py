from __future__ import annotations

import json
from pathlib import Path

from .signature import failure_signature, signature_excerpt


IMPACT_BY_CATEGORY = {
    "memory/assertion": "The pass pipeline can abort the compiler process, creating a denial-of-service risk in build, CI, or model compilation pipelines.",
    "parser": "The input cannot be accepted by this toolchain path; when other paths accept it, the inconsistency can hide validation gaps.",
    "dialect registration": "Dialect registration and dynamic operation handling disagree across pipelines, which can expose pass precondition bugs.",
    "type legality": "The transformation pipeline rejects or rewrites types inconsistently, which can surface lowering correctness risks.",
    "verifier": "Verifier failures show invalid IR states that should be blocked or normalized before later lowering stages.",
    "unknown failure": "The toolchain returned a non-zero result that needs manual triage and signature comparison.",
    "timeout": "The pipeline exceeded the configured timeout, indicating potential algorithmic complexity or non-termination risk.",
    "success": "The pipeline completed successfully.",
}


def build_issue_cases(report_path: Path, source_index_path: Path, root: Path) -> list[dict]:
    if not report_path.exists():
        return []
    data = json.loads(report_path.read_text(encoding="utf-8"))
    source_index = _read_json(source_index_path)
    runs_by_seed: dict[str, list[dict]] = {}
    for run in data.get("runs", []):
        runs_by_seed.setdefault(str(run.get("seed", "")), []).append(run)

    cases = []
    for seed, runs in sorted(runs_by_seed.items()):
        if "issue_repros" not in seed:
            continue
        meta = source_index.get(seed.replace("\\", "/"), {})
        failing_runs = [
            run for run in runs if run.get("return_code") != 0 or run.get("timed_out")
        ]
        success_runs = [
            run for run in runs if run.get("return_code") == 0 and not run.get("timed_out")
        ]
        categories = sorted({run.get("category", "unknown failure") for run in failing_runs})
        primary = _primary_run(failing_runs or runs)
        issue_id = _issue_id(seed, meta.get("source", ""))
        cases.append(
            {
                "id": issue_id,
                "seed": seed,
                "title": _case_title(issue_id, seed, primary),
                "source": meta.get("source", ""),
                "origin": meta.get("origin", "issue"),
                "expected_pipeline": meta.get("pipeline", ""),
                "status": _case_status(failing_runs, success_runs),
                "impact": _impact(categories),
                "categories": categories,
                "signature": failure_signature_dict(primary) if primary else "",
                "summary": _case_summary(seed, failing_runs, success_runs, categories),
                "reproduce_command": _reproduce_command(seed, meta.get("pipeline", "")),
                "runs": [_run_view(run, root) for run in runs],
            }
        )
    seen = {case["seed"].replace("\\", "/") for case in cases}
    for seed, meta in sorted(source_index.items()):
        normalized_seed = seed.replace("\\", "/")
        if "seeds/issue_repros/" not in normalized_seed or normalized_seed in seen:
            continue
        issue_id = _issue_id(normalized_seed, meta.get("source", ""))
        cases.append(
            {
                "id": issue_id,
                "seed": normalized_seed,
                "title": f"{issue_id} - {Path(normalized_seed).stem} (not run)",
                "source": meta.get("source", ""),
                "origin": meta.get("origin", "issue"),
                "expected_pipeline": meta.get("pipeline", ""),
                "status": "not-run",
                "impact": "This real issue seed has been imported, but the current real Issue Repros report has not executed it yet.",
                "categories": [],
                "signature": "",
                "summary": "Imported real issue seed waiting for a VM/native mlir-opt run.",
                "reproduce_command": _reproduce_command(normalized_seed, meta.get("pipeline", "")),
                "runs": [],
            }
        )
    return cases


def failure_signature_dict(run: dict) -> str:
    class _Record:
        stderr = str(run.get("stderr", ""))
        stdout = str(run.get("stdout", ""))
        category = str(run.get("category", "unknown failure"))

    return failure_signature(_Record)  # type: ignore[arg-type]


def _run_view(run: dict, root: Path) -> dict:
    stdout_path = Path(str(run.get("stdout_path", "")))
    stderr_path = Path(str(run.get("stderr_path", "")))
    return {
        "pipeline": run.get("pipeline", ""),
        "category": run.get("category", ""),
        "return_code": run.get("return_code", 0),
        "timed_out": run.get("timed_out", False),
        "elapsed_ms": run.get("elapsed_ms", 0),
        "command": run.get("command", ""),
        "signature": failure_signature_dict(run)
        if run.get("return_code") != 0 or run.get("timed_out")
        else "",
        "stderr_excerpt": signature_excerpt_dict(run),
        "stdout_url": _artifact_url(stdout_path, root),
        "stderr_url": _artifact_url(stderr_path, root),
    }


def signature_excerpt_dict(run: dict) -> str:
    class _Record:
        stderr = str(run.get("stderr", ""))
        stdout = str(run.get("stdout", ""))
        category = str(run.get("category", "unknown failure"))

    return signature_excerpt(_Record)  # type: ignore[arg-type]


def _primary_run(runs: list[dict]) -> dict | None:
    if not runs:
        return None
    return sorted(
        runs,
        key=lambda run: (
            0 if run.get("category") == "memory/assertion" else 1,
            str(run.get("pipeline", "")),
        ),
    )[0]


def _impact(categories: list[str]) -> str:
    if not categories:
        return "No failing pipeline is present for this seed in the current report."
    parts = [IMPACT_BY_CATEGORY.get(category, IMPACT_BY_CATEGORY["unknown failure"]) for category in categories]
    return " ".join(parts)


def _case_status(failing_runs: list[dict], success_runs: list[dict]) -> str:
    if failing_runs and success_runs:
        return "pipeline-divergence"
    if failing_runs:
        return "all-failed"
    return "no-failure"


def _case_summary(
    seed: str,
    failing_runs: list[dict],
    success_runs: list[dict],
    categories: list[str],
) -> str:
    return (
        f"{Path(seed).name}: {len(failing_runs)} failing runs, "
        f"{len(success_runs)} successful runs, categories: {', '.join(categories) or 'none'}."
    )


def _case_title(issue_id: str, seed: str, primary: dict | None) -> str:
    category = primary.get("category", "unknown") if primary else "unknown"
    return f"{issue_id} - {Path(seed).stem} ({category})"


def _issue_id(seed: str, source: str) -> str:
    if "issues/" in source:
        return "LLVM-" + source.rstrip("/").split("/")[-1]
    name = Path(seed).stem
    for part in name.split("_"):
        if part.isdigit():
            return "LLVM-" + part
    return name


def _reproduce_command(seed: str, pipeline: str) -> str:
    if pipeline:
        return f"{pipeline} {seed} -o -"
    return f"mlir-opt {seed} -o -"


def _artifact_url(path: Path, root: Path) -> str:
    if path and not path.is_absolute():
        path = root / path
    try:
        rel = path.relative_to(root)
    except ValueError:
        return ""
    return "/" + str(rel).replace("\\", "/")


def _read_json(path: Path) -> dict:
    if not path.exists():
        return {}
    return json.loads(path.read_text(encoding="utf-8"))
