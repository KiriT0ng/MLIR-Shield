from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from mlirdiff.classifier import classify_run
from mlirdiff.diffing import analyze_runs
from mlirdiff.model import RunRecord, SuiteResult
from mlirdiff.report import write_html_report, write_json_report, write_markdown_report


def main() -> int:
    if len(sys.argv) != 2:
        print("usage: python scripts/rebuild_report.py outputs/<name>/report.json", file=sys.stderr)
        return 2
    report_path = Path(sys.argv[1])
    data = json.loads(report_path.read_text(encoding="utf-8"))
    runs = [RunRecord(**run) for run in data.get("runs", [])]
    for run in runs:
        run.category = classify_run(run)
    result = SuiteResult(
        seeds=list(data.get("seeds", [])),
        pipelines=list(data.get("pipelines", [])),
        runs=runs,
        issues=analyze_runs(runs),
    )
    out_dir = report_path.parent
    write_json_report(result, out_dir / "report.json")
    write_markdown_report(result, out_dir / "report.md")
    write_html_report(result, out_dir / "report.html")
    print(f"rebuilt: {report_path}")
    print(f"issues: {len(result.issues)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
