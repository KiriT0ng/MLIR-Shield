from __future__ import annotations

import html
import json
from pathlib import Path

from .model import RunRecord
from .model import SuiteResult
from .invariants import analyze_invariants
from .diffing import collect_output_deltas
from .signature import failure_signature, signature_excerpt


def _count(values: list[str]) -> dict[str, int]:
    counts: dict[str, int] = {}
    for value in values:
        counts[value] = counts.get(value, 0) + 1
    return dict(sorted(counts.items()))


def write_json_report(result: SuiteResult, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = result.to_dict()
    clusters = build_failure_clusters(result.runs)
    invariant_findings = analyze_invariants(result.runs)
    output_deltas = collect_output_deltas(result.runs)
    payload["summary"] = {
        "run_categories": _count([run.category for run in result.runs]),
        "issue_severities": _count([issue.severity for issue in result.issues]),
        "issue_kinds": _count([issue.kind for issue in result.issues]),
        "failure_clusters": clusters,
        "invariant_findings": [finding.to_dict() for finding in invariant_findings],
        "invariant_kinds": _count([finding.kind for finding in invariant_findings]),
        "output_deltas": output_deltas,
        "output_delta_count": len(output_deltas),
    }
    path.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")


def write_markdown_report(result: SuiteResult, path: Path) -> None:
    lines = [
        "# MLIR Differential Report",
        "",
        f"- Seeds: {len(result.seeds)}",
        f"- Pipelines: {len(result.pipelines)}",
        f"- Runs: {len(result.runs)}",
        f"- Issues: {len(result.issues)}",
        "",
        "## Issues",
        "",
    ]
    if not result.issues:
        lines.append("No issues found.")
    for issue in result.issues:
        lines.extend(
            [
                f"### [{issue.severity}] {issue.kind}",
                "",
                f"- Seed: `{issue.seed}`",
                f"- Summary: {issue.summary}",
                "",
                "```text",
                issue.details,
                "```",
                "",
            ]
        )

    lines.extend(["## Summary", ""])
    lines.append("### Run categories")
    lines.append("")

    invariant_findings = analyze_invariants(result.runs)
    lines.append("### Invariant findings")
    lines.append("")
    if invariant_findings:
        for finding in invariant_findings:
            lines.append(
                f"- [{finding.severity}] `{finding.kind}`: `{finding.seed}` / `{finding.pipeline}`"
            )
            lines.append(f"  - {finding.summary}")
    else:
        lines.append("- none: 0")
    lines.append("")
    for category, count in _count([run.category for run in result.runs]).items():
        lines.append(f"- {category}: {count}")
    lines.append("")
    lines.append("### Issue kinds")
    lines.append("")
    issue_kinds = _count([issue.kind for issue in result.issues])
    if issue_kinds:
        for kind, count in issue_kinds.items():
            lines.append(f"- {kind}: {count}")
    else:
        lines.append("- none: 0")
    lines.append("")

    lines.append("### Failure clusters")
    lines.append("")
    clusters = build_failure_clusters(result.runs)
    if clusters:
        for cluster in clusters:
            lines.append(
                f"- `{cluster['signature']}`: {cluster['count']} runs, "
                f"{cluster['seed_count']} seeds, category `{cluster['category']}`"
            )
    else:
        lines.append("- none: 0")
    lines.append("")

    lines.extend(["## Runs", "", "| Seed | Pipeline | Return | Category | Time |", "| --- | --- | --- | --- | --- |"])
    for run in result.runs:
        lines.append(
            f"| `{run.seed}` | `{run.pipeline}` | {run.return_code} | {run.category} | {run.elapsed_ms} ms |"
        )
    path.write_text("\n".join(lines), encoding="utf-8")


def write_html_report(result: SuiteResult, path: Path) -> None:
    issue_items = "\n".join(_issue_html(issue) for issue in result.issues)
    if not issue_items:
        issue_items = "<p>No issues found.</p>"
    severity_rows = "\n".join(
        f"<tr><td>{html.escape(severity)}</td><td>{count}</td></tr>"
        for severity, count in _count([issue.severity for issue in result.issues]).items()
    )
    if not severity_rows:
        severity_rows = "<tr><td>none</td><td>0</td></tr>"
    category_rows = "\n".join(
        f"<tr><td>{html.escape(category)}</td><td>{count}</td></tr>"
        for category, count in _count([run.category for run in result.runs]).items()
    )
    issue_kind_rows = "\n".join(
        f"<tr><td>{html.escape(kind)}</td><td>{count}</td></tr>"
        for kind, count in _count([issue.kind for issue in result.issues]).items()
    )
    if not issue_kind_rows:
        issue_kind_rows = "<tr><td>none</td><td>0</td></tr>"

    cluster_cards = "\n".join(_cluster_html(cluster) for cluster in build_failure_clusters(result.runs))
    if not cluster_cards:
        cluster_cards = "<p>No failure clusters.</p>"
    invariant_cards = "\n".join(_invariant_html(finding) for finding in analyze_invariants(result.runs))
    if not invariant_cards:
        invariant_cards = "<p>No invariant findings.</p>"

    run_rows = "\n".join(
        "<tr>"
        f"<td>{html.escape(run.seed)}</td>"
        f"<td>{html.escape(run.pipeline)}</td>"
        f"<td>{run.return_code}</td>"
        f"<td>{html.escape(run.category)}</td>"
        f"<td>{run.elapsed_ms} ms</td>"
        f"<td><code>{html.escape(run.stdout_path)}</code></td>"
        f"<td><code>{html.escape(run.stderr_path)}</code></td>"
        "</tr>"
        for run in result.runs
    )
    page = f"""<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>MLIR Differential Report</title>
  <style>
    body {{ font-family: Arial, "Microsoft YaHei", sans-serif; margin: 32px; color: #1f2933; }}
    h1, h2 {{ color: #102a43; }}
    .summary {{ display: flex; gap: 16px; margin: 20px 0; }}
    .metric {{ border: 1px solid #d9e2ec; border-radius: 6px; padding: 12px 16px; min-width: 120px; }}
    .metric strong {{ display: block; font-size: 24px; }}
    .issue {{ border-left: 4px solid #c2410c; background: #fff7ed; padding: 12px 16px; margin: 12px 0; }}
    .cluster {{ border: 1px solid #d9e2ec; border-left: 4px solid #475569; border-radius: 6px; padding: 12px 16px; margin: 12px 0; }}
    .cluster h3 {{ margin: 0 0 8px; font-size: 16px; }}
    .cluster .meta {{ color: #52606d; }}
    .tables {{ display: grid; grid-template-columns: repeat(2, minmax(240px, 1fr)); gap: 16px; margin-bottom: 20px; }}
    table {{ border-collapse: collapse; width: 100%; font-size: 14px; }}
    th, td {{ border: 1px solid #d9e2ec; padding: 8px; vertical-align: top; }}
    th {{ background: #f0f4f8; text-align: left; }}
    pre {{ white-space: pre-wrap; background: #111827; color: #f9fafb; padding: 12px; overflow: auto; }}
    code {{ font-size: 12px; }}
  </style>
</head>
<body>
  <h1>MLIR Differential Consistency and Safety Report</h1>
  <div class="summary">
    <div class="metric"><span>Seeds</span><strong>{len(result.seeds)}</strong></div>
    <div class="metric"><span>Pipelines</span><strong>{len(result.pipelines)}</strong></div>
    <div class="metric"><span>Runs</span><strong>{len(result.runs)}</strong></div>
    <div class="metric"><span>Issues</span><strong>{len(result.issues)}</strong></div>
  </div>
  <h2>Issues</h2>
  {issue_items}
  <h2>Summary</h2>
  <div class="tables">
    <table>
      <thead><tr><th>Issue severity</th><th>Count</th></tr></thead>
      <tbody>{severity_rows}</tbody>
    </table>
    <table>
      <thead><tr><th>Run category</th><th>Count</th></tr></thead>
      <tbody>{category_rows}</tbody>
    </table>
    <table>
      <thead><tr><th>Issue kind</th><th>Count</th></tr></thead>
      <tbody>{issue_kind_rows}</tbody>
    </table>
  </div>
  <h2>Failure Clusters</h2>
  {cluster_cards}
  <h2>Post-Lowering Invariants</h2>
  {invariant_cards}
  <h2>Runs</h2>
  <table>
    <thead><tr><th>Seed</th><th>Pipeline</th><th>Return</th><th>Category</th><th>Time</th><th>Stdout</th><th>Stderr</th></tr></thead>
    <tbody>{run_rows}</tbody>
  </table>
</body>
</html>
"""
    path.write_text(page, encoding="utf-8")


def _issue_html(issue) -> str:
    return (
        '<div class="issue">'
        f"<h3>[{html.escape(issue.severity)}] {html.escape(issue.kind)}</h3>"
        f"<p><strong>Seed:</strong> <code>{html.escape(issue.seed)}</code></p>"
        f"<p>{html.escape(issue.summary)}</p>"
        f"<pre>{html.escape(issue.details)}</pre>"
        "</div>"
    )


def build_failure_clusters(runs: list[RunRecord]) -> list[dict]:
    clusters: dict[str, dict] = {}
    for run in runs:
        if run.return_code == 0 and not run.timed_out:
            continue
        signature = failure_signature(run)
        cluster = clusters.setdefault(
            signature,
            {
                "signature": signature,
                "category": run.category,
                "count": 0,
                "seeds": set(),
                "pipelines": set(),
                "example": signature_excerpt(run),
            },
        )
        cluster["count"] += 1
        cluster["seeds"].add(run.seed)
        cluster["pipelines"].add(run.pipeline)

    normalized = []
    for cluster in clusters.values():
        normalized.append(
            {
                "signature": cluster["signature"],
                "category": cluster["category"],
                "count": cluster["count"],
                "seed_count": len(cluster["seeds"]),
                "pipeline_count": len(cluster["pipelines"]),
                "seeds": sorted(cluster["seeds"])[:8],
                "pipelines": sorted(cluster["pipelines"])[:8],
                "example": cluster["example"],
            }
        )
    return sorted(normalized, key=lambda item: (-item["count"], item["signature"]))


def _cluster_html(cluster: dict) -> str:
    seeds = ", ".join(html.escape(seed) for seed in cluster["seeds"])
    pipelines = ", ".join(html.escape(pipeline) for pipeline in cluster["pipelines"])
    return (
        '<div class="cluster">'
        f"<h3>{html.escape(cluster['signature'])}</h3>"
        f"<p class=\"meta\">{cluster['count']} runs, {cluster['seed_count']} seeds, "
        f"{cluster['pipeline_count']} pipelines, category {html.escape(cluster['category'])}</p>"
        f"<p><strong>Seeds:</strong> {seeds}</p>"
        f"<p><strong>Pipelines:</strong> {pipelines}</p>"
        f"<pre>{html.escape(cluster['example'])}</pre>"
        "</div>"
    )


def _invariant_html(finding) -> str:
    return (
        '<div class="cluster">'
        f"<h3>{html.escape(finding.kind)} / {html.escape(finding.severity)}</h3>"
        f"<p class=\"meta\">{html.escape(finding.seed)} / {html.escape(finding.pipeline)}</p>"
        f"<p>{html.escape(finding.summary)}</p>"
        f"<pre>{html.escape(finding.evidence)}</pre>"
        "</div>"
    )
