from __future__ import annotations

import json
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[1]
ASSET_DIR = ROOT / "docs" / "report_assets"
SIZE = (1800, 1080)

COLORS = {
    "bg": "#F6F7F9",
    "surface": "#FFFFFF",
    "subtle": "#F1F3F5",
    "border": "#D9DEE5",
    "text": "#111827",
    "muted": "#6B7280",
    "brand": "#123B5D",
    "accent": "#0F766E",
    "warning": "#B45309",
    "danger": "#B42318",
    "info": "#2563EB",
}


def load_json(rel: str) -> dict:
    path = ROOT / rel
    if not path.exists():
        return {}
    return json.loads(path.read_text(encoding="utf-8"))


def font(size: int, bold: bool = False) -> ImageFont.FreeTypeFont:
    candidates = [
        Path("C:/Windows/Fonts/msyhbd.ttc" if bold else "C:/Windows/Fonts/msyh.ttc"),
        Path("C:/Windows/Fonts/simhei.ttf"),
        Path("C:/Windows/Fonts/arial.ttf"),
    ]
    for path in candidates:
        if path.exists():
            return ImageFont.truetype(str(path), size)
    return ImageFont.load_default()


FONT_XL = font(44, True)
FONT_LG = font(30, True)
FONT_MD = font(24)
FONT_SM = font(20)
FONT_XS = font(16)


def draw_header(draw: ImageDraw.ImageDraw, title: str, subtitle: str) -> None:
    draw.text((72, 58), title, fill=COLORS["text"], font=FONT_XL)
    draw.text((72, 122), subtitle, fill=COLORS["muted"], font=FONT_SM)


def rounded(draw: ImageDraw.ImageDraw, box: tuple[int, int, int, int], fill: str = COLORS["surface"], outline: str = COLORS["border"]) -> None:
    draw.rounded_rectangle(box, radius=8, fill=fill, outline=outline, width=2)


def arrow(draw: ImageDraw.ImageDraw, start: tuple[int, int], end: tuple[int, int], color: str = COLORS["brand"]) -> None:
    draw.line((*start, *end), fill=color, width=4)
    x, y = end
    draw.polygon([(x, y), (x - 16, y - 8), (x - 16, y + 8)], fill=color)


def save(name: str, img: Image.Image) -> None:
    ASSET_DIR.mkdir(parents=True, exist_ok=True)
    img.save(ASSET_DIR / name)


def new_canvas() -> tuple[Image.Image, ImageDraw.ImageDraw]:
    img = Image.new("RGB", SIZE, COLORS["bg"])
    return img, ImageDraw.Draw(img)


def fig_architecture() -> None:
    img, draw = new_canvas()
    draw_header(draw, "异常输入到证据包的主流程", "强调普通诊断与高价值异常分流，最终形成可复核证据。")
    boxes = [
        ("输入与来源", "官方 seed / issue seed / 用户输入"),
        ("pipeline / 版本执行", "real runner 或固定历史产物"),
        ("分类与规范化", "parser / verifier / memory / timeout"),
        ("签名聚类", "稳定 signature 合并重复日志"),
        ("P0/P1/P2 分诊", "收敛人工复核队列"),
        ("最小化与版本差分", "复现命令、跨版本状态"),
        ("证据包 / 门户", "JSON / Markdown / HTML / 截图"),
    ]
    y = 250
    for idx, (title, note) in enumerate(boxes):
        x = 70 + idx * 245
        rounded(draw, (x, y, x + 205, y + 154))
        draw.text((x + 20, y + 28), title, fill=COLORS["brand"], font=FONT_MD)
        draw.text((x + 20, y + 78), note, fill=COLORS["muted"], font=FONT_XS)
        if idx < len(boxes) - 1:
            arrow(draw, (x + 210, y + 76), (x + 238, y + 76))
    rounded(draw, (230, 540, 780, 760), fill=COLORS["subtle"])
    draw.text((270, 580), "普通诊断保留但不直接升级为漏洞", fill=COLORS["warning"], font=FONT_LG)
    draw.text((270, 640), "parser / verifier / dialect registration", fill=COLORS["muted"], font=FONT_SM)
    rounded(draw, (990, 540, 1540, 760), fill="#FDECEC")
    draw.text((1030, 580), "高价值异常进入人工复核", fill=COLORS["danger"], font=FONT_LG)
    draw.text((1030, 640), "memory/assertion / timeout / pipeline divergence", fill=COLORS["muted"], font=FONT_SM)
    save("fig_architecture_evidence_flow.png", img)


def fig_classification() -> None:
    img, draw = new_canvas()
    draw_header(draw, "分类与风险分层", "类别标签同时给出文字说明，避免只靠颜色表达状态。")
    rows = [
        ("普通输入诊断", "parser / verifier / dialect registration / type legality", "保留上下文，通常不直接计为安全漏洞", COLORS["warning"]),
        ("待解释差异", "unknown failure / pipeline divergence", "进入项目成员判断，结合版本和 pipeline 复核", COLORS["brand"]),
        ("高优先级异常", "memory/assertion / timeout", "进入 P0/P1 队列，优先最小化和版本差分", COLORS["danger"]),
    ]
    y = 240
    for title, cats, note, color in rows:
        rounded(draw, (130, y, 1670, y + 185))
        draw.rectangle((130, y, 146, y + 185), fill=color)
        draw.text((185, y + 32), title, fill=color, font=FONT_LG)
        draw.text((185, y + 82), cats, fill=COLORS["text"], font=FONT_MD)
        draw.text((185, y + 124), note, fill=COLORS["muted"], font=FONT_SM)
        y += 230
    save("fig_classification_triage.png", img)


def fig_triage() -> None:
    evidence = load_json("outputs/competition_evidence/competition_evidence.json")
    metrics = load_json("outputs/competition_evidence/review_efficiency_metrics.json")
    discovery = next((r for r in evidence.get("reports", []) if r.get("key") == "discovery_mlir22"), {})
    cats = discovery.get("run_categories", {})
    non_success = sum(v for k, v in cats.items() if k != "success")
    steps = [
        ("总运行记录", discovery.get("runs", metrics.get("discovery_runs", 0))),
        ("非成功运行", non_success),
        ("签名候选簇", discovery.get("clusters", metrics.get("triage_signatures", 0))),
        ("P0 候选", metrics.get("p0_candidates", 0)),
        ("MIN-004 重点案例", 1),
    ]
    img, draw = new_canvas()
    draw_header(draw, "分诊降噪效果", "固定快照展示从运行记录到重点人工复核案例的收敛。")
    max_value = max(value for _, value in steps) or 1
    y = 250
    for label, value in steps:
        rounded(draw, (220, y, 1580, y + 110))
        bar_w = int(920 * value / max_value)
        draw.rounded_rectangle((500, y + 36, 500 + bar_w, y + 74), radius=6, fill=COLORS["brand"])
        draw.text((250, y + 34), label, fill=COLORS["text"], font=FONT_MD)
        draw.text((1460, y + 34), f"{value:,}", fill=COLORS["brand"], font=FONT_LG)
        y += 135
    draw.text((220, 950), "结论：稳定签名聚类与 P0 分诊将重复异常收敛为有限候选，使人工复核优先聚焦 MIN-004 等证据闭环案例。", fill=COLORS["muted"], font=FONT_SM)
    save("fig_triage_reduction.png", img)


def fig_min004_chain() -> None:
    img, draw = new_canvas()
    draw_header(draw, "MIN-004 证据闭环", "官方来源、最小化、版本差分与证据包共同构成可复核链路。")
    nodes = [
        ("官方 seed", "memref canonicalize\n约 1236 行"),
        ("发现", "MLIR 22 discovery\nmemory/assertion"),
        ("最小化", "61 行 -> 8 行\n保留触发条件"),
        ("版本差分", "MLIR 23 dev\n未复现"),
        ("证据包", "命令 / 日志 / JSON\n门户入口"),
    ]
    y = 360
    for idx, (title, note) in enumerate(nodes):
        x = 120 + idx * 330
        rounded(draw, (x, y, x + 250, y + 170))
        draw.text((x + 28, y + 32), title, fill=COLORS["brand"], font=FONT_LG)
        draw.multiline_text((x + 28, y + 88), note, fill=COLORS["muted"], font=FONT_SM, spacing=8)
        if idx < len(nodes) - 1:
            arrow(draw, (x + 256, y + 85), (x + 312, y + 85))
    rounded(draw, (420, 680, 1380, 790), fill="#FDECEC")
    draw.text((470, 716), "边界：MIN-004 是 MLIR 22 版本差分重点案例，不表述为最新版本仍未修复漏洞。", fill=COLORS["danger"], font=FONT_SM)
    save("fig_min004_evidence_chain.png", img)


def fig_matrix() -> None:
    img, draw = new_canvas()
    draw_header(draw, "版本 × pipeline 差异矩阵", "矩阵表达不同版本与 pass 组合下的类别差异，状态同时配文字。")
    cols = ["版本", "parse / compatibility", "canonicalize chain", "证据定位"]
    rows = [
        ("MLIR 15", "parser / attribute incompatibility", "未进入同一路径", "兼容性边界"),
        ("MLIR 22", "parse_verify success", "memory/assertion", "历史版本差分案例"),
        ("MLIR 23 dev", "return code 0", "resolved-or-not-reproduced", "当前验证产物"),
    ]
    x0, y0 = 150, 250
    widths = [240, 440, 440, 420]
    height = 120
    x = x0
    for col, w in zip(cols, widths):
        rounded(draw, (x, y0, x + w, y0 + height), fill=COLORS["subtle"])
        draw.text((x + 22, y0 + 42), col, fill=COLORS["muted"], font=FONT_SM)
        x += w
    for r, row in enumerate(rows):
        y = y0 + height + r * height
        x = x0
        for cell, w in zip(row, widths):
            fill = COLORS["surface"]
            if "memory/assertion" in cell:
                fill = "#FDECEC"
            elif "parser" in cell or "未进入" in cell:
                fill = "#FFF4E5"
            elif "success" in cell or "resolved" in cell or "return code" in cell:
                fill = "#E7F5F0"
            rounded(draw, (x, y, x + w, y + height), fill=fill)
            draw.text((x + 22, y + 42), cell, fill=COLORS["text"], font=FONT_SM)
            x += w
    save("fig_version_pipeline_matrix.png", img)


def fig_minimization() -> None:
    metrics = load_json("outputs/competition_evidence/review_efficiency_metrics.json")
    original = int(metrics.get("min004_original_lines", 1236))
    minimized = int(metrics.get("min004_minimized_lines", 8))
    middle = 61
    img, draw = new_canvas()
    draw_header(draw, "最小化效果", "MIN-004 从官方大 seed 收敛为 8 行可复核复现。")
    data = [("原始官方 seed", original, COLORS["brand"]), ("初步最小化", middle, COLORS["warning"]), ("最小复现", minimized, COLORS["accent"])]
    max_value = max(v for _, v, _ in data)
    x = 260
    for label, value, color in data:
        h = max(24, int(560 * value / max_value))
        draw.rounded_rectangle((x, 830 - h, x + 260, 830), radius=8, fill=color)
        draw.text((x, 855), label, fill=COLORS["text"], font=FONT_SM)
        draw.text((x, 790 - h), f"{value} 行", fill=color, font=FONT_LG)
        x += 430
    reduction = metrics.get("min004_line_reduction", 99.35)
    draw.text((260, 960), f"结论：最小化将人工复核对象从 {original} 行压缩到 {minimized} 行，缩减约 {reduction}%。", fill=COLORS["muted"], font=FONT_SM)
    save("fig_minimization_effect.png", img)


def main() -> int:
    fig_architecture()
    fig_classification()
    fig_triage()
    fig_min004_chain()
    fig_matrix()
    fig_minimization()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
