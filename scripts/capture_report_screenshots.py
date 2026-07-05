from __future__ import annotations

import argparse
import asyncio
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
OUT_DIR = ROOT / "reports" / "report_assets" / "ui"


async def capture(base_url: str) -> None:
    try:
        from playwright.async_api import async_playwright
    except ImportError as exc:
        raise SystemExit(
            "Playwright is not installed in this environment. Install it or use a machine "
            "with an available browser, then rerun this script to create real browser screenshots."
        ) from exc

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    async with async_playwright() as p:
        browser = await p.chromium.launch()
        page = await browser.new_page(viewport={"width": 1440, "height": 1100}, device_scale_factor=1)
        targets = [
            ("#overview", "ui_01_evidence_overview.png"),
            ("#analysis", "ui_02_new_analysis.png"),
            ("#case-min004", "ui_03_min004_case_detail.png"),
            ("#history", "ui_04_history_evidence.png"),
        ]
        for fragment, name in targets:
            await page.goto(f"{base_url}/{fragment}", wait_until="networkidle")
            await page.wait_for_function("document.body.dataset.ready === 'true'")
            await page.locator(fragment).scroll_into_view_if_needed()
            await page.wait_for_timeout(250)
            await page.screenshot(path=str(OUT_DIR / name), full_page=False)
        await browser.close()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base-url", default="http://127.0.0.1:8765")
    args = parser.parse_args()
    asyncio.run(capture(args.base_url.rstrip("/")))


if __name__ == "__main__":
    main()
