from __future__ import annotations

import html
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MATERIALS = ROOT / "outputs" / "materials"


def main() -> int:
    MATERIALS.mkdir(parents=True, exist_ok=True)
    write_system_architecture(MATERIALS / "system_architecture.svg")
    write_experiment_results(MATERIALS / "experiment_results.svg")
    print("visual materials exported")
    return 0


def write_system_architecture(path: Path) -> None:
    svg = f"""<svg xmlns="http://www.w3.org/2000/svg" width="1440" height="900" viewBox="0 0 1440 900">
  <defs>
    <style>
      .bg {{ fill: #f7f9fc; }}
      .title {{ font: 700 38px Arial, 'Microsoft YaHei', sans-serif; fill: #172033; }}
      .subtitle {{ font: 18px Arial, 'Microsoft YaHei', sans-serif; fill: #5b6678; }}
      .stage-title {{ font: 700 20px Arial, 'Microsoft YaHei', sans-serif; fill: #172033; }}
      .stage-copy {{ font: 15px Arial, 'Microsoft YaHei', sans-serif; fill: #4b5565; }}
      .small {{ font: 13px Arial, 'Microsoft YaHei', sans-serif; fill: #64748b; }}
      .box {{ fill: #ffffff; stroke: #cfd8e3; stroke-width: 2; rx: 8; }}
      .box-accent {{ fill: #e8f5f3; stroke: #0f766e; stroke-width: 2; rx: 8; }}
      .box-risk {{ fill: #fff4e5; stroke: #b45309; stroke-width: 2; rx: 8; }}
      .lane {{ fill: #eef3f8; stroke: #d7e0ea; stroke-width: 1.5; rx: 10; }}
      .arrow {{ stroke: #334155; stroke-width: 2.5; fill: none; marker-end: url(#arrow); }}
      .dash {{ stroke: #64748b; stroke-width: 2; stroke-dasharray: 7 6; fill: none; marker-end: url(#arrow-muted); }}
      .pill {{ fill: #0f766e; rx: 16; }}
      .pill-text {{ font: 700 13px Arial, 'Microsoft YaHei', sans-serif; fill: #ffffff; }}
    </style>
    <marker id="arrow" markerWidth="11" markerHeight="11" refX="9" refY="5.5" orient="auto">
      <path d="M0,0 L10,5.5 L0,11 Z" fill="#334155"/>
    </marker>
    <marker id="arrow-muted" markerWidth="11" markerHeight="11" refX="9" refY="5.5" orient="auto">
      <path d="M0,0 L10,5.5 L0,11 Z" fill="#64748b"/>
    </marker>
  </defs>
  <rect class="bg" width="1440" height="900"/>
  <text x="72" y="72" class="title">MLIR 差分一致性与安全验证系统架构</text>
  <text x="72" y="108" class="subtitle">从真实 seed 到多 pipeline 调度、失败分类、根因聚类和比赛演示报告的端到端链路</text>

  <rect x="72" y="150" width="1296" height="160" class="lane"/>
  <text x="96" y="185" class="stage-title">输入层：Seed Library</text>
  {box(100, 215, 210, 70, "Generated Seeds", "本地基础 / Demo 样例", "box")}
  {box(360, 215, 230, 70, "LLVM Official Tests", "109 个官方 MLIR seed", "box-accent")}
  {box(640, 215, 230, 70, "LLVM Issue Repros", "5 个真实 issue 复现", "box-risk")}
  {box(920, 215, 250, 70, "Source Manifest", "data/seed_sources.json", "box")}
  <path class="arrow" d="M310 250 H350"/>
  <path class="arrow" d="M590 250 H630"/>
  <path class="arrow" d="M870 250 H910"/>

  <rect x="72" y="350" width="1296" height="190" class="lane"/>
  <text x="96" y="385" class="stage-title">执行层：Pipeline Scheduler + Toolchain Runner</text>
  {box(100, 420, 230, 82, "Pipeline Configs", "baseline / demo / issue-specific", "box")}
  {box(395, 420, 245, 82, "Run Engine", "逐 seed × pipeline 调度执行", "box-accent")}
  {box(705, 420, 245, 82, "Windows Native", "mlir-opt.exe 当前缺失", "box")}
  {box(1015, 420, 245, 82, "VM Ubuntu Runner", "SSH → mlir-opt-15", "box-risk")}
  <path class="arrow" d="M330 461 H385"/>
  <path class="arrow" d="M640 461 H695"/>
  <path class="dash" d="M950 461 H1005"/>

  <rect x="72" y="580" width="1296" height="190" class="lane"/>
  <text x="96" y="615" class="stage-title">分析层：分类、差分与聚类</text>
  {box(100, 650, 220, 82, "Result Collector", "stdout / stderr / artifacts", "box")}
  {box(370, 650, 230, 82, "Safety Classifier", "parser / verifier / crash", "box-risk")}
  {box(650, 650, 230, 82, "Differential Analyzer", "divergence / mismatch", "box-accent")}
  {box(930, 650, 230, 82, "Failure Clustering", "signature 根因聚类", "box")}
  <path class="arrow" d="M320 691 H360"/>
  <path class="arrow" d="M600 691 H640"/>
  <path class="arrow" d="M880 691 H920"/>

  <text x="96" y="818" class="stage-title">输出层</text>
  {pill(210, 795, "JSON / Markdown / HTML 报告")}
  {pill(500, 795, "Web Dashboard")}
  {pill(720, 795, "Issue Case Library")}
  {pill(1010, 795, "比赛技术报告 / 答辩材料")}
  <path class="arrow" d="M1160 691 C1240 700 1270 760 1180 795"/>
</svg>
"""
    path.write_text(svg, encoding="utf-8")


def write_experiment_results(path: Path) -> None:
    reports = [
        ("Demo", load_report("demo")),
        ("Mock Baseline", load_report("latest")),
        ("Issue Repros", load_report("issues")),
    ]
    seed_total = seed_count()
    max_runs = max(len(report.get("runs", [])) for _, report in reports) or 1
    max_issues = max(len(report.get("issues", [])) for _, report in reports) or 1
    max_clusters = max(len(report.get("summary", {}).get("failure_clusters", [])) for _, report in reports) or 1

    rows = []
    bars = []
    y = 235
    for label, report in reports:
        runs = len(report.get("runs", []))
        issues = len(report.get("issues", []))
        clusters = len(report.get("summary", {}).get("failure_clusters", []))
        rows.append(result_row(830, y - 24, label, len(report.get("seeds", [])), runs, issues, clusters))
        bars.append(bar_group(125, y, label, runs, issues, clusters, max_runs, max_issues, max_clusters))
        y += 150

    svg = f"""<svg xmlns="http://www.w3.org/2000/svg" width="1440" height="900" viewBox="0 0 1440 900">
  <defs>
    <style>
      .bg {{ fill: #f7f9fc; }}
      .title {{ font: 700 38px Arial, 'Microsoft YaHei', sans-serif; fill: #172033; }}
      .subtitle {{ font: 18px Arial, 'Microsoft YaHei', sans-serif; fill: #5b6678; }}
      .label {{ font: 700 17px Arial, 'Microsoft YaHei', sans-serif; fill: #172033; }}
      .small {{ font: 14px Arial, 'Microsoft YaHei', sans-serif; fill: #64748b; }}
      .axis {{ stroke: #cbd5e1; stroke-width: 2; }}
      .card {{ fill: #ffffff; stroke: #d8e0ea; stroke-width: 2; rx: 8; }}
      .runs {{ fill: #0f766e; }}
      .issues {{ fill: #b42318; }}
      .clusters {{ fill: #475569; }}
      .metric {{ font: 700 30px Arial, 'Microsoft YaHei', sans-serif; fill: #172033; }}
      .metric-label {{ font: 14px Arial, 'Microsoft YaHei', sans-serif; fill: #64748b; }}
      .table-head {{ font: 700 15px Arial, 'Microsoft YaHei', sans-serif; fill: #334155; }}
      .table-cell {{ font: 15px Arial, 'Microsoft YaHei', sans-serif; fill: #334155; }}
    </style>
  </defs>
  <rect class="bg" width="1440" height="900"/>
  <text x="72" y="72" class="title">实验结果总览</text>
  <text x="72" y="108" class="subtitle">当前报告覆盖 {seed_total} 个 MLIR seed，重点展示真实 issue 复现、基线稳定性和失败聚类能力</text>

  <rect x="72" y="145" width="610" height="585" class="card"/>
  <text x="105" y="188" class="label">Runs / Issues / Failure Clusters</text>
  <line x1="125" y1="660" x2="620" y2="660" class="axis"/>
  <g transform="translate(420 176)">
    <rect x="0" y="0" width="16" height="16" class="runs"/><text x="24" y="14" class="small">Runs</text>
    <rect x="85" y="0" width="16" height="16" class="issues"/><text x="109" y="14" class="small">Issues</text>
    <rect x="185" y="0" width="16" height="16" class="clusters"/><text x="209" y="14" class="small">Clusters</text>
  </g>
  {"".join(bars)}

  <rect x="735" y="145" width="633" height="585" class="card"/>
  <text x="770" y="188" class="label">Report Table</text>
  <text x="830" y="235" class="table-head">Report</text>
  <text x="1030" y="235" class="table-head">Seeds</text>
  <text x="1110" y="235" class="table-head">Runs</text>
  <text x="1190" y="235" class="table-head">Issues</text>
  <text x="1280" y="235" class="table-head">Clusters</text>
  <line x1="790" y1="255" x2="1328" y2="255" class="axis"/>
  {"".join(rows)}

  <rect x="72" y="770" width="1296" height="82" class="card"/>
  <text x="105" y="805" class="label">结论</text>
  <text x="105" y="835" class="small">Mock Baseline 验证框架链路稳定，Issue Repros 展示 8 个真实问题和 4 个失败簇，支持比赛现场从统计总览下钻到案例复现。</text>
</svg>
"""
    path.write_text(svg, encoding="utf-8")


def box(x: int, y: int, w: int, h: int, title: str, copy: str, cls: str) -> str:
    return f"""<g>
    <rect x="{x}" y="{y}" width="{w}" height="{h}" class="{cls}"/>
    <text x="{x + 18}" y="{y + 30}" class="stage-title">{esc(title)}</text>
    <text x="{x + 18}" y="{y + 55}" class="stage-copy">{esc(copy)}</text>
  </g>"""


def pill(x: int, y: int, text: str) -> str:
    width = max(190, len(text) * 13)
    return f"""<g>
    <rect x="{x}" y="{y}" width="{width}" height="36" class="pill"/>
    <text x="{x + 18}" y="{y + 24}" class="pill-text">{esc(text)}</text>
  </g>"""


def bar_group(
    x: int,
    y: int,
    label: str,
    runs: int,
    issues: int,
    clusters: int,
    max_runs: int,
    max_issues: int,
    max_clusters: int,
) -> str:
    run_w = int(390 * runs / max_runs)
    issue_w = int(170 * issues / max_issues) if issues else 0
    cluster_w = int(170 * clusters / max_clusters) if clusters else 0
    return f"""<g>
    <text x="{x}" y="{y - 26}" class="label">{esc(label)}</text>
    <rect x="{x}" y="{y}" width="{run_w}" height="24" class="runs" rx="4"/>
    <text x="{x + run_w + 10}" y="{y + 18}" class="small">{runs} runs</text>
    <rect x="{x}" y="{y + 38}" width="{issue_w}" height="20" class="issues" rx="4"/>
    <text x="{x + issue_w + 10}" y="{y + 54}" class="small">{issues} issues</text>
    <rect x="{x}" y="{y + 70}" width="{cluster_w}" height="20" class="clusters" rx="4"/>
    <text x="{x + cluster_w + 10}" y="{y + 86}" class="small">{clusters} clusters</text>
  </g>"""


def result_row(x: int, y: int, label: str, seeds: int, runs: int, issues: int, clusters: int) -> str:
    return f"""<g>
    <text x="{x}" y="{y + 72}" class="table-cell">{esc(label)}</text>
    <text x="{x + 210}" y="{y + 72}" class="table-cell">{seeds}</text>
    <text x="{x + 290}" y="{y + 72}" class="table-cell">{runs}</text>
    <text x="{x + 380}" y="{y + 72}" class="table-cell">{issues}</text>
    <text x="{x + 480}" y="{y + 72}" class="table-cell">{clusters}</text>
    <line x1="{x - 40}" y1="{y + 94}" x2="{x + 498}" y2="{y + 94}" class="axis"/>
  </g>"""


def load_report(name: str) -> dict:
    path = ROOT / "outputs" / name / "report.json"
    if not path.exists():
        return {"seeds": [], "runs": [], "issues": [], "summary": {}}
    return json.loads(path.read_text(encoding="utf-8"))


def seed_count() -> int:
    return len(list((ROOT / "seeds").glob("**/*.mlir")))


def esc(text: str) -> str:
    return html.escape(str(text), quote=True)


if __name__ == "__main__":
    raise SystemExit(main())
