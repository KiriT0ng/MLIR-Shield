from __future__ import annotations

import json
import shutil
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / "config" / "report_figure_crops.json"


def load_config() -> dict:
    return json.loads(CONFIG.read_text(encoding="utf-8"))


def project_path(value: str) -> Path:
    path = Path(value)
    return path if path.is_absolute() else ROOT / path


def fit_text(draw: ImageDraw.ImageDraw, text: str, font: ImageFont.ImageFont, width: int) -> list[str]:
    words = text.split()
    lines: list[str] = []
    current = ""
    for word in words:
      candidate = f"{current} {word}".strip()
      if draw.textbbox((0, 0), candidate, font=font)[2] <= width:
          current = candidate
      else:
          if current:
              lines.append(current)
          current = word
    if current:
        lines.append(current)
    return lines[:3]


def make_contact_sheet(items: list[dict], contact_path: Path) -> None:
    thumb_w, thumb_h = 480, 316
    label_h = 92
    cols = 2
    rows = (len(items) + cols - 1) // cols
    sheet = Image.new("RGB", (cols * thumb_w, rows * (thumb_h + label_h)), "white")
    draw = ImageDraw.Draw(sheet)
    font = ImageFont.load_default()
    for index, item in enumerate(items):
        image = Image.open(item["output_path"]).convert("RGB")
        image.thumbnail((thumb_w - 24, thumb_h - 24))
        col = index % cols
        row = index // cols
        x = col * thumb_w
        y = row * (thumb_h + label_h)
        sheet.paste(image, (x + 12, y + 12))
        label = f'{item["id"]} | {item["rq"]} | {item["output"]}'
        metric = item["metric"]
        draw.text((x + 12, y + thumb_h + 8), label, fill=(23, 32, 51), font=font)
        for line_no, line in enumerate(fit_text(draw, metric, font, thumb_w - 24)):
            draw.text((x + 12, y + thumb_h + 28 + line_no * 18), line, fill=(95, 107, 122), font=font)
    contact_path.parent.mkdir(parents=True, exist_ok=True)
    sheet.save(contact_path)


def main() -> None:
    config = load_config()
    source_root = project_path(config["source_root"])
    raw_root = project_path(config["raw_root"])
    processed_root = project_path(config["processed_root"])
    raw_root.mkdir(parents=True, exist_ok=True)
    processed_root.mkdir(parents=True, exist_ok=True)

    outputs: list[dict] = []
    for figure in config["figures"]:
        source = source_root / figure["source"]
        raw = raw_root / figure["source"]
        output = processed_root / figure["output"]
        if not source.exists():
            raise FileNotFoundError(source)
        shutil.copy2(source, raw)
        with Image.open(source) as image:
            crop = tuple(figure["crop"])
            image.crop(crop).save(output)
        outputs.append({**figure, "output_path": output})

    make_contact_sheet(outputs, project_path(config["contact_sheet"]))


if __name__ == "__main__":
    main()
