from __future__ import annotations

import json
import shutil
from collections import Counter
from pathlib import Path
from xml.sax.saxutils import escape

try:
    from PIL import Image, ImageDraw, ImageFont
except ImportError:  # pragma: no cover - evidence JSON still works without PNG extras.
    Image = ImageDraw = ImageFont = None


ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "outputs" / "competition_evidence"
MATERIALS = ROOT / "outputs" / "materials"


REPORTS = [
    ("demo", "Demo"),
    ("latest", "Mock Baseline"),
    ("issues", "Issue Repros"),
    ("discovery", "Discovery"),
    ("discovery_mlir22", "Discovery MLIR22"),
    ("current_issues_mlir23", "Current MLIR23 Issue"),
    ("orig001_variants", "ORIG-CAND-001 Variants"),
    ("independent_fuzz_mlir23", "Independent Fuzz MLIR23"),
    ("original_search_mlir23", "Original Search MLIR23"),
]


def load_json(path: Path) -> dict:
    if not path.exists():
        return {}
    return json.loads(path.read_text(encoding="utf-8-sig"))


def summarize_report(key: str, label: str) -> dict:
    path = ROOT / "outputs" / key / "report.json"
    data = load_json(path)
    if not data:
        return {"key": key, "label": label, "exists": False}
    summary = data.get("summary", {})
    clusters = summary.get("failure_clusters", [])
    runs = data.get("runs", [])
    seeds = data.get("seeds", [])
    pipelines = data.get("pipelines", [])
    if not seeds and runs:
        seeds = sorted({str(run.get("seed", "")) for run in runs if isinstance(run, dict) and run.get("seed")})
    if not pipelines and runs:
        pipelines = sorted({str(run.get("pipeline", "")) for run in runs if isinstance(run, dict) and run.get("pipeline")})
    run_categories = summary.get("run_categories", {})
    if not run_categories and runs:
        cats = Counter(
            str(run.get("category", "unknown"))
            for run in runs
            if isinstance(run, dict)
        )
        run_categories = dict(cats)
    return {
        "key": key,
        "label": label,
        "exists": True,
        "seeds": len(seeds),
        "pipelines": len(pipelines),
        "runs": len(runs),
        "issues": len(data.get("issues", [])),
        "clusters": len(clusters),
        "ir_deltas": int(summary.get("output_delta_count", 0) or 0),
        "run_categories": run_categories,
        "issue_severities": summary.get("issue_severities", {}),
        "issue_kinds": summary.get("issue_kinds", {}),
    }


def seed_summary() -> dict:
    seeds = sorted((ROOT / "seeds").glob("**/*.mlir"))
    source_index = load_json(ROOT / "data" / "seed_sources.json")
    origins = Counter()
    groups = Counter()
    for seed in seeds:
        rel = seed.relative_to(ROOT)
        key = str(rel).replace("\\", "/")
        meta = source_index.get(key, {})
        origins[meta.get("origin", "unknown")] += 1
        parts = seed.relative_to(ROOT / "seeds").parts
        groups[parts[0] if parts else "root"] += 1
    return {
        "total": len(seeds),
        "indexed": len(source_index),
        "origins": dict(origins),
        "groups": dict(groups),
    }


def minimized_summary() -> list[dict]:
    rows = []
    for path in sorted((ROOT / "outputs" / "minimized").glob("*.mlir")):
        text = path.read_text(encoding="utf-8")
        rows.append(
            {
                "file": path.name,
                "lines": len([line for line in text.splitlines() if line.strip()]),
                "bytes": path.stat().st_size,
            }
        )
    return rows


def case_matrix() -> list[dict]:
    rows = []
    matrix = ROOT / "docs" / "重点案例版本状态矩阵.md"
    if matrix.exists():
        text = matrix.read_text(encoding="utf-8")
        for line in text.splitlines():
            if not line.startswith("| "):
                continue
            cells = [cell.strip() for cell in line.strip("|").split("|")]
            if len(cells) < 6 or cells[0] in {"案例", "---"} or set(cells[0]) == {"-"}:
                continue
            if cells[0].startswith("---"):
                continue
            if len(cells) >= 6:
                rows.append(
                    {
                        "case": cells[0],
                        "mlir15": cells[1],
                        "mlir22": cells[2],
                        "mlir23": cells[3],
                        "upstream": cells[4],
                        "position": cells[5],
                    }
                )
    return rows


def pipeline_coverage() -> list[dict]:
    mapping = {
        "parse_verify": ("所有输入", "基础合法性与 verifier 边界", "quick/standard/deep"),
        "canonicalize": ("arith/memref/tensor/shape", "规范化路径稳定性", "quick/standard/deep"),
        "cse": ("通用 IR", "公共子表达式消除差分", "standard/deep"),
        "canonicalize_cse": ("通用 IR", "常见优化组合差分", "standard/deep"),
        "symbol_dce_canonicalize": ("func/symbol", "符号清理和内联前后边界", "standard/deep"),
        "canonicalize_sccp_cse": ("shape/arith/scf", "标量传播与折叠路径", "deep"),
        "lower_affine": ("affine", "affine lowering 兼容性", "deep"),
        "convert_scf_to_cf": ("scf/cf", "控制流 lowering 边界", "deep"),
        "canonicalize_cse_sccp": ("shape/memref/arith", "MIN-004 与 P0 差分重点路径", "discovery"),
        "symbol_dce_inliner_canonicalize": ("func-heavy", "跨函数清理与 inliner", "discovery"),
        "affine_lowering_stress": ("affine", "lower-affine stress", "discovery"),
        "scf_to_cf_stress": ("scf/cf", "SCF lowering stress", "discovery"),
        "vector_lowering_stress": ("vector/scf/llvm", "vector lowering stress", "discovery"),
        "bufferization_probe": ("tensor/linalg/memref", "bufferization 候选路径", "discovery"),
        "linalg_affine_probe": ("linalg/affine", "linalg to affine lowering", "discovery"),
        "gpu_parallel_probe": ("scf/gpu", "parallel loop to GPU lowering", "discovery"),
    }
    rows: list[dict] = []
    seen = set()
    for config in ["pipelines.json", "pipelines_discovery.json"]:
        data = load_json(ROOT / "configs" / config)
        for pipeline in data.get("pipelines", []):
            name = pipeline.get("name", "")
            if not name or name in seen:
                continue
            seen.add(name)
            target, risk, profile = mapping.get(name, ("通用 IR", pipeline.get("description", ""), config))
            rows.append(
                {
                    "name": name,
                    "target": target,
                    "risk": risk,
                    "profile": profile,
                    "args": " ".join(pipeline.get("args", [])) or "parse/verify only",
                }
            )
    return rows


def real_toolchain_summary() -> dict:
    version = load_json(ROOT / "outputs" / "version_diff" / "report.json")
    p0 = load_json(ROOT / "outputs" / "version_diff_p0" / "report.json")
    current = load_json(ROOT / "outputs" / "current_validation" / "min004_current_validation.json")

    def count_categories(results: list[dict]) -> dict[str, int]:
        counts = Counter(str(row.get("category", "unknown")) for row in results)
        return dict(counts)

    def count_status(summary: list[dict]) -> dict[str, int]:
        counts = Counter(str(row.get("status", "unknown")) for row in summary)
        return dict(counts)

    min004_rows = [
        row for row in version.get("results", [])
        if row.get("case_id") == "MIN-004"
    ]
    return {
        "local_runner": {
            "mlir_opt_on_path": bool(shutil.which("mlir-opt")),
            "note": "当前 Windows 工作区未发现可直接执行的 mlir-opt；真实结论来自已保存的 VM/MLIR 运行产物。",
        },
        "version_diff": {
            "tools": version.get("tools", []),
            "cases": len(version.get("cases", [])),
            "results": len(version.get("results", [])),
            "status_counts": count_status(version.get("summary", [])),
            "category_counts": count_categories(version.get("results", [])),
            "min004": min004_rows,
        },
        "p0_version_diff": {
            "tools": p0.get("tools", []),
            "cases": len(p0.get("cases", [])),
            "results": len(p0.get("results", [])),
            "status_counts": count_status(p0.get("summary", [])),
            "category_counts": count_categories(p0.get("results", [])),
        },
        "min004_mlir23_validation": current,
    }


def service_smoke_summary() -> dict:
    smoke = load_json(OUT / "user_portal_smoke.json")
    if not smoke:
        return {}
    overview = smoke.get("overview", {})
    jobs = []
    for key in ["ok_job", "bad_job"]:
        actual_key = key
        if actual_key not in smoke:
            actual_key = "ok" if key == "ok_job" else "bad"
        job = smoke.get(actual_key, {})
        summary = job.get("summary", {})
        jobs.append(
            {
                "case": key,
                "status": summary.get("status", ""),
                "risk": summary.get("risk", ""),
                "pipelines": job.get("pipeline_count", 0),
                "runs": job.get("run_count", 0),
                "elapsed_ms": summary.get("elapsed_ms", 0),
                "title": summary.get("title", ""),
            }
        )
    return {
        "runtime": overview.get("runtime", {}),
        "seed_count": overview.get("seed_count", 0),
        "public_seed_count": overview.get("public_seed_count", 0),
        "jobs": jobs,
        "history_items": len(smoke.get("history", {}).get("items", [])),
    }


def _font(size: int, bold: bool = False):
    if ImageFont is None:
        return None
    candidates = [
        "C:/Windows/Fonts/msyhbd.ttc" if bold else "C:/Windows/Fonts/msyh.ttc",
        "C:/Windows/Fonts/simhei.ttf",
        "C:/Windows/Fonts/simsun.ttc",
    ]
    for candidate in candidates:
        if candidate and Path(candidate).exists():
            return ImageFont.truetype(candidate, size)
    return ImageFont.load_default()


def _draw_text(draw, xy, text, font, fill="#172033"):
    draw.text(xy, str(text), font=font, fill=fill)


def _wrap(draw, text: str, font, width: int) -> list[str]:
    lines: list[str] = []
    current = ""
    for ch in str(text):
        candidate = current + ch
        bbox = draw.textbbox((0, 0), candidate, font=font)
        if bbox[2] - bbox[0] <= width or not current:
            current = candidate
        else:
            lines.append(current)
            current = ch
    if current:
        lines.append(current)
    return lines


def _draw_wrapped(draw, xy, text, font, width, fill="#172033", line_gap=8) -> int:
    x, y = xy
    for line in _wrap(draw, str(text), font, width):
        draw.text((x, y), line, font=font, fill=fill)
        y += font.size + line_gap
    return y


def _new_canvas(width=1500, height=900):
    image = Image.new("RGB", (width, height), "#F7FAFF")
    draw = ImageDraw.Draw(image)
    return image, draw


def write_real_version_png(path: Path, evidence: dict) -> None:
    if Image is None:
        return
    image, draw = _new_canvas(1500, 900)
    title_font, h_font, body_font, small_font = _font(42, True), _font(24, True), _font(21), _font(17)
    _draw_text(draw, (70, 55), "真实 MLIR 工具链历史复核证据", title_font)
    _draw_wrapped(draw, (70, 112), "读取 outputs/version_diff、outputs/version_diff_p0 与 current_validation 中保存的 VM/MLIR 真实运行产物；当前 Windows 工作区未发现可直接执行的 mlir-opt。", body_font, 1320, "#53657D")
    cards = [
        ("P0 版本差分", f"{evidence['p0_version_diff']['cases']} 个候选 / {evidence['p0_version_diff']['results']} 次运行", "mlir-opt-15 vs mlir-opt-22"),
        ("MIN-004 MLIR22", "return=-1 / memory/assertion / 1349 ms", "官方 memref seed 最小化案例"),
        ("MIN-004 MLIR23", "return=0 / 未复现 / 580.33 ms", "development snapshot 行为改变"),
    ]
    x = 70
    for idx, (head, value, desc) in enumerate(cards):
        draw.rounded_rectangle((x, 210, x + 410, 350), radius=24, fill="#FFFFFF", outline="#D8E2F0", width=2)
        _draw_text(draw, (x + 28, 238), head, h_font)
        _draw_text(draw, (x + 28, 280), value, body_font, "#315EFB" if idx != 1 else "#C2410C")
        _draw_wrapped(draw, (x + 28, 313), desc, small_font, 350, "#64748B")
        x += 450
    headers = ["证据项", "工具链", "结果", "说明"]
    rows = [
        ["P0 复核", "15 / 22", "8 resolved, 1 different-mode", "9 个 P0 候选经跨版本对照，区分历史问题和仍需复核项。"],
        ["MIN-004", "mlir-opt-22", "hard failure", "canonicalize+cse+sccp 路径触发 stack dump。"],
        ["MIN-004", "mlir-opt-23", "not reproduced", "输出被优化为 return %arg1，stderr 为空。"],
        ["当前本机", "Windows PATH", "mlir-opt missing", "报告中明确标注，不把 demo runner 结果当真实结论。"],
    ]
    y = 410
    col_x = [80, 380, 650, 895]
    widths = [260, 230, 210, 520]
    draw.rounded_rectangle((60, y - 28, 1440, y + 370), radius=24, fill="#FFFFFF", outline="#D8E2F0", width=2)
    for i, head in enumerate(headers):
        _draw_text(draw, (col_x[i], y), head, h_font, "#172033")
    y += 55
    for row in rows:
        draw.line((80, y - 13, 1400, y - 13), fill="#E5ECF7", width=2)
        max_y = y
        for i, cell in enumerate(row):
            max_y = max(max_y, _draw_wrapped(draw, (col_x[i], y), cell, body_font, widths[i], "#334155"))
        y = max_y + 18
    image.save(path)


def write_triage_funnel_png(path: Path) -> None:
    if Image is None:
        return
    image, draw = _new_canvas(1500, 760)
    title_font, h_font, body_font = _font(42, True), _font(24, True), _font(20)
    _draw_text(draw, (70, 56), "Discovery 分诊漏斗", title_font)
    steps = [
        ("1170", "真实批量运行", "#315EFB"),
        ("99", "issue 记录", "#0EA5A7"),
        ("92", "候选签名", "#F59E0B"),
        ("9", "P0 优先复核", "#C2410C"),
        ("1", "MIN-004 主案例", "#12835F"),
    ]
    x = 78
    y = 205
    for idx, (num, label, color) in enumerate(steps):
        width = 220 if idx == len(steps) - 1 else 220 - idx * 12
        box_top = y + idx * 14
        box_bottom = box_top + 170
        draw.rounded_rectangle((x, box_top, x + width, box_bottom), radius=22, fill=color)
        _draw_text(draw, (x + 34, box_top + 45), num, _font(48, True), "#FFFFFF")
        _draw_wrapped(draw, (x + 34, box_top + 102), label, h_font, width - 60, "#FFFFFF")
        if idx < len(steps) - 1:
            draw.polygon([(x + width + 24, box_top + 72), (x + width + 62, box_top + 102), (x + width + 24, box_top + 132)], fill="#94A3B8")
        x += width + 85
    _draw_wrapped(draw, (90, 565), "分诊机制把日志级输出压缩为候选级证据。评委不需要阅读 1170 条运行日志，而是先看 9 个 P0，再聚焦 MIN-004 的最小复现与版本矩阵。", body_font, 1320, "#53657D")
    image.save(path)


def write_service_smoke_png(path: Path, smoke: dict) -> None:
    if Image is None:
        return
    image, draw = _new_canvas(1500, 820)
    title_font, h_font, body_font, small_font = _font(42, True), _font(25, True), _font(21), _font(17)
    _draw_text(draw, (70, 56), "用户门户与服务隔离 Smoke", title_font)
    runtime = smoke.get("runtime", {})
    _draw_wrapped(draw, (70, 112), f"运行时：{runtime.get('display_name') or runtime.get('configured', 'unknown')}。该 smoke 验证上传、分析、异常分类、历史记录和服务存活；若为 demo runner，仅作为流程证据。", body_font, 1320, "#53657D")
    y = 220
    jobs = smoke.get("jobs", [])
    for idx, job in enumerate(jobs):
        x = 90 + idx * 670
        color = "#12835F" if job.get("risk") == "low" else "#C2410C"
        draw.rounded_rectangle((x, y, x + 610, y + 210), radius=28, fill="#FFFFFF", outline="#D8E2F0", width=2)
        _draw_text(draw, (x + 30, y + 34), "正常样例" if job.get("case") == "ok_job" else "异常样例", h_font)
        _draw_text(draw, (x + 30, y + 78), f"status={job.get('status')} / risk={job.get('risk')}", body_font, color)
        _draw_text(draw, (x + 30, y + 116), f"{job.get('pipelines')} pipelines / {job.get('runs')} runs / {job.get('elapsed_ms')} ms", body_font)
        _draw_wrapped(draw, (x + 30, y + 154), job.get("title", ""), small_font, 540, "#64748B")
    draw.rounded_rectangle((90, 500, 1410, 682), radius=28, fill="#EEF6FF", outline="#B9CCFF", width=2)
    _draw_text(draw, (125, 535), "服务级结论", h_font)
    _draw_wrapped(draw, (125, 580), f"异常任务后仍能读取历史记录（history items={smoke.get('history_items', 0)}），说明 Web 控制面没有被单个异常任务中断。后续真实提交环境应替换为容器内 mlir-opt，并加入 CPU/内存/时间限制。", body_font, 1210, "#334155")
    image.save(path)


def write_pipeline_coverage_png(path: Path, rows: list[dict]) -> None:
    if Image is None:
        return
    image, draw = _new_canvas(1500, 980)
    title_font, h_font, body_font, small_font = _font(42, True), _font(21, True), _font(18), _font(16)
    _draw_text(draw, (70, 55), "Pipeline 覆盖矩阵", title_font)
    _draw_wrapped(draw, (70, 110), "quick/standard/deep 面向用户入口，discovery 面向项目成员复核。每条 pipeline 都绑定目标 dialect 与风险类型，避免“为什么跑这些 pass”解释不清。", body_font, 1320, "#53657D")
    headers = ["Pipeline", "目标", "风险/目的", "入口"]
    col_x = [70, 455, 690, 1190]
    widths = [345, 195, 455, 220]
    y = 185
    draw.rounded_rectangle((50, 158, 1450, 925), radius=24, fill="#FFFFFF", outline="#D8E2F0", width=2)
    for i, header in enumerate(headers):
        _draw_text(draw, (col_x[i], y), header, h_font)
    y += 45
    for row in rows[:14]:
        draw.line((70, y - 12, 1420, y - 12), fill="#E5ECF7", width=2)
        max_y = y
        values = [row["name"], row["target"], row["risk"], row["profile"]]
        for i, value in enumerate(values):
            max_y = max(max_y, _draw_wrapped(draw, (col_x[i], y), value, small_font if i == 0 else body_font, widths[i], "#334155"))
        y = max_y + 14
    image.save(path)


def write_svg_bar(path: Path, title: str, rows: list[dict], value_key: str, color: str) -> None:
    width, height = 1200, 620
    margin_left, margin_top = 255, 90
    chart_width, row_height = 840, 48
    max_value = max([int(row.get(value_key, 0) or 0) for row in rows] + [1])
    svg = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="1200" height="620" rx="24" fill="#F7FAFF"/>',
        f'<text x="54" y="56" font-family="Segoe UI, Microsoft YaHei, Arial" font-size="30" font-weight="800" fill="#102033">{escape(title)}</text>',
        '<text x="54" y="86" font-family="Segoe UI, Microsoft YaHei, Arial" font-size="15" fill="#64748B">Generated from outputs/*/report.json</text>',
    ]
    for idx, row in enumerate(rows):
        y = margin_top + idx * row_height
        value = int(row.get(value_key, 0) or 0)
        bar_w = int(chart_width * value / max_value)
        label = row["label"]
        svg.extend(
            [
                f'<text x="54" y="{y + 28}" font-family="Segoe UI, Microsoft YaHei, Arial" font-size="16" font-weight="700" fill="#334155">{escape(label)}</text>',
                f'<rect x="{margin_left}" y="{y + 8}" width="{chart_width}" height="24" rx="12" fill="#E5ECF7"/>',
                f'<rect x="{margin_left}" y="{y + 8}" width="{bar_w}" height="24" rx="12" fill="{color}"/>',
                f'<text x="{margin_left + chart_width + 18}" y="{y + 28}" font-family="Segoe UI, Microsoft YaHei, Arial" font-size="16" font-weight="800" fill="#102033">{value}</text>',
            ]
        )
    svg.append("</svg>")
    path.write_text("\n".join(svg), encoding="utf-8")


def write_svg_architecture(path: Path) -> None:
    svg = """<svg xmlns="http://www.w3.org/2000/svg" width="1500" height="880" viewBox="0 0 1500 880">
  <defs>
    <linearGradient id="g" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="#315EFB"/><stop offset="1" stop-color="#10B981"/>
    </linearGradient>
    <style>
      .title{font:800 38px 'Segoe UI','Microsoft YaHei',Arial;fill:#102033}.sub{font:500 17px 'Segoe UI','Microsoft YaHei',Arial;fill:#64748B}.box{fill:#fff;stroke:#D8E2F0;stroke-width:2;rx:18}.accent{fill:#F1F7FF;stroke:#9CB8FF}.risk{fill:#FFF7ED;stroke:#FDBA74}.ok{fill:#ECFDF5;stroke:#6EE7B7}.h{font:800 20px 'Segoe UI','Microsoft YaHei',Arial;fill:#172033}.p{font:500 14px 'Segoe UI','Microsoft YaHei',Arial;fill:#53657D}.tag{font:800 13px 'Segoe UI','Microsoft YaHei',Arial;fill:#fff}.arrow{stroke:#334155;stroke-width:3;fill:none;marker-end:url(#a)}
    </style>
    <marker id="a" markerWidth="12" markerHeight="12" refX="10" refY="6" orient="auto"><path d="M0,0 L12,6 L0,12z" fill="#334155"/></marker>
  </defs>
  <rect width="1500" height="880" fill="#F7FAFF"/>
  <text x="64" y="70" class="title">MLIRShield 系统架构与证据链</text>
  <text x="64" y="104" class="sub">输入治理、pipeline 调度、失败分诊、最小化复现、版本差分和用户门户构成闭环</text>
  <g transform="translate(64 154)">
    <rect class="box accent" width="250" height="118"/><text x="24" y="42" class="h">Seed Library</text><text x="24" y="72" class="p">官方测试 / 公开 issue / 原创搜索</text><text x="24" y="96" class="p">来源索引与匿名提交输入</text>
  </g>
  <g transform="translate(374 154)">
    <rect class="box" width="250" height="118"/><text x="24" y="42" class="h">Pipeline Scheduler</text><text x="24" y="72" class="p">parse / canonicalize / CSE</text><text x="24" y="96" class="p">stress / issue-specific configs</text>
  </g>
  <g transform="translate(684 154)">
    <rect class="box risk" width="250" height="118"/><text x="24" y="42" class="h">Toolchain Runner</text><text x="24" y="72" class="p">mock / local / SSH VM</text><text x="24" y="96" class="p">MLIR 15 / 22 / 23 snapshot</text>
  </g>
  <g transform="translate(994 154)">
    <rect class="box" width="250" height="118"/><text x="24" y="42" class="h">Result Collector</text><text x="24" y="72" class="p">stdout / stderr / return code</text><text x="24" y="96" class="p">耗时、命令与产物路径</text>
  </g>
  <path class="arrow" d="M315 213H365"/><path class="arrow" d="M625 213H675"/><path class="arrow" d="M935 213H985"/>
  <g transform="translate(220 378)">
    <rect class="box ok" width="270" height="126"/><text x="24" y="44" class="h">Classifier + Signature</text><text x="24" y="75" class="p">parser / verifier / dialect</text><text x="24" y="99" class="p">memory/assertion / timeout</text>
  </g>
  <g transform="translate(615 378)">
    <rect class="box accent" width="270" height="126"/><text x="24" y="44" class="h">P0/P1/P2 Triage</text><text x="24" y="75" class="p">按安全价值排序候选</text><text x="24" y="99" class="p">去重、降噪、人工复核入口</text>
  </g>
  <g transform="translate(1010 378)">
    <rect class="box risk" width="270" height="126"/><text x="24" y="44" class="h">Minimizer + Diff</text><text x="24" y="75" class="p">1236 行 -> 61 行 -> 8 行</text><text x="24" y="99" class="p">跨版本与控制组验证</text>
  </g>
  <path class="arrow" d="M355 272C355 320 355 340 355 370"/><path class="arrow" d="M490 441H605"/><path class="arrow" d="M885 441H1000"/>
  <g transform="translate(172 646)">
    <rect class="box" width="310" height="112"/><text x="24" y="42" class="h">User Portal</text><text x="24" y="72" class="p">上传/粘贴 MLIR，用户可读结论</text><text x="24" y="96" class="p">历史记录与完整技术报告链接</text>
  </g>
  <g transform="translate(595 646)">
    <rect class="box ok" width="310" height="112"/><text x="24" y="42" class="h">Lab Console</text><text x="24" y="72" class="p">报告、案例库、最小复现</text><text x="24" y="96" class="p">面向答辩和源码检查</text>
  </g>
  <g transform="translate(1018 646)">
    <rect class="box accent" width="310" height="112"/><text x="24" y="42" class="h">Competition Evidence</text><text x="24" y="72" class="p">图表、截图、数据表、报告</text><text x="24" y="96" class="p">可复核、可提交、可追溯</text>
  </g>
  <path class="arrow" d="M1145 504C1145 575 1170 595 1170 636"/><path class="arrow" d="M750 504V636"/><path class="arrow" d="M355 504C355 575 327 595 327 636"/>
  <rect x="64" y="794" width="1372" height="44" rx="22" fill="url(#g)"/>
  <text x="92" y="823" class="tag">核心竞争力：不是堆崩溃数量，而是将编译基础设施异常输入风险沉淀为来源、命令、版本、最小复现和边界说明完整的证据链。</text>
</svg>"""
    path.write_text(svg, encoding="utf-8")


def main() -> int:
    OUT.mkdir(parents=True, exist_ok=True)
    MATERIALS.mkdir(parents=True, exist_ok=True)

    reports = [summarize_report(key, label) for key, label in REPORTS]
    existing_reports = [row for row in reports if row.get("exists")]
    pipelines = pipeline_coverage()
    real_summary = real_toolchain_summary()
    service_summary = service_smoke_summary()
    evidence = {
        "generated_from": str(ROOT),
        "seed_summary": seed_summary(),
        "reports": reports,
        "minimized": minimized_summary(),
        "case_matrix": case_matrix(),
        "pipeline_coverage": pipelines,
        "real_toolchain_summary": real_summary,
        "service_smoke_summary": service_summary,
    }
    (OUT / "competition_evidence.json").write_text(
        json.dumps(evidence, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )

    write_svg_bar(MATERIALS / "competition_runs.svg", "运行规模对比", existing_reports, "runs", "#315EFB")
    write_svg_bar(MATERIALS / "competition_issues.svg", "候选与异常记录对比", existing_reports, "issues", "#C2410C")
    write_svg_architecture(MATERIALS / "competition_architecture.svg")
    write_real_version_png(MATERIALS / "real_version_evidence.png", real_summary)
    write_triage_funnel_png(MATERIALS / "triage_funnel.png")
    write_service_smoke_png(MATERIALS / "service_isolation_smoke.png", service_summary)
    write_pipeline_coverage_png(MATERIALS / "pipeline_coverage.png", pipelines)

    table_lines = [
        "| Report | Seeds | Pipelines | Runs | Issues | Clusters | IR Deltas |",
        "| --- | ---: | ---: | ---: | ---: | ---: | ---: |",
    ]
    for row in existing_reports:
        table_lines.append(
            f"| {row['label']} | {row['seeds']} | {row['pipelines']} | {row['runs']} | "
            f"{row['issues']} | {row['clusters']} | {row['ir_deltas']} |"
        )
    (OUT / "report_table.md").write_text("\n".join(table_lines) + "\n", encoding="utf-8")

    print(f"wrote: {OUT / 'competition_evidence.json'}")
    print(f"wrote: {OUT / 'report_table.md'}")
    print(f"wrote: {MATERIALS / 'competition_runs.svg'}")
    print(f"wrote: {MATERIALS / 'competition_issues.svg'}")
    print(f"wrote: {MATERIALS / 'competition_architecture.svg'}")
    print(f"wrote: {MATERIALS / 'real_version_evidence.png'}")
    print(f"wrote: {MATERIALS / 'triage_funnel.png'}")
    print(f"wrote: {MATERIALS / 'service_isolation_smoke.png'}")
    print(f"wrote: {MATERIALS / 'pipeline_coverage.png'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
