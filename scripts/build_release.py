from __future__ import annotations

import argparse
import shutil
from datetime import datetime
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PACKAGE_NAME = "AI编译基础设施安全缺陷发现系统_展示包"
INCLUDE_DIRS = [
    "configs",
    "data",
    "docs",
    "mlirdiff",
    "scripts",
    "seeds",
    "web",
]
INCLUDE_FILES = [
    ".gitignore",
    "README.md",
    "run.py",
    "final_demo.ps1",
]
OUTPUT_SUBDIRS = [
    "demo",
    "latest",
    "issues",
    "discovery",
    "discovery_mlir22",
    "materials",
    "minimized",
    "current_validation",
    "current_issues_mlir23",
    "original_search_mlir23",
    "generic_fuzz_mlir23",
    "frontier_fuzz_mlir23",
    "independent_fuzz_mlir23",
    "aggressive_mlir23_mainseed",
    "aggressive_mlir23_function_focus60_timeout",
    "aggressive_mlir23_function_focus_060_119",
    "aggressive_mlir23_function_focus_120_179",
    "aggressive_mlir23_function_focus_180_239",
    "aggressive_mlir23_function_full_240_539",
    "original_candidates_mlir23",
    "orig001_variants",
    "version_diff",
    "version_diff_p0",
]
EXCLUDE_NAMES = {
    ".git",
    "__pycache__",
    ".pytest_cache",
    "release",
}
EXCLUDE_SUFFIXES = {
    ".pyc",
    ".pyo",
    ".log",
    ".tmp",
}


def should_ignore(path: Path) -> bool:
    rel_parts = path.relative_to(ROOT).parts if path.is_absolute() and path.is_relative_to(ROOT) else path.parts
    if any(part in EXCLUDE_NAMES for part in rel_parts):
        return True
    if path.name.startswith("~$"):
        return True
    return path.suffix.lower() in EXCLUDE_SUFFIXES


def copy_tree(src: Path, dst: Path) -> None:
    def ignore(directory: str, names: list[str]) -> set[str]:
        ignored = set()
        base = Path(directory)
        for name in names:
            candidate = base / name
            if name in EXCLUDE_NAMES or name.startswith("~$") or candidate.suffix.lower() in EXCLUDE_SUFFIXES:
                ignored.add(name)
        return ignored

    shutil.copytree(src, dst, ignore=ignore)


def copy_outputs(dst_root: Path) -> None:
    outputs_dst = dst_root / "outputs"
    outputs_dst.mkdir(parents=True, exist_ok=True)
    for name in OUTPUT_SUBDIRS:
        src = ROOT / "outputs" / name
        if src.exists():
            copy_tree(src, outputs_dst / name)


def write_release_readme(dst_root: Path) -> None:
    text = """# AI 编译基础设施安全缺陷发现系统展示包

## 快速启动

在 PowerShell 中进入本目录后执行：

```powershell
.\\启动展示台.ps1
```

然后打开：

```text
http://127.0.0.1:8765/
```

## 自检

```powershell
python scripts\\final_check.py --web http://127.0.0.1:8765
```

如果本机没有 `python`，可使用 Codex 或系统中已有的 Python 运行。

## 主要入口

- Web 展示台：`web/server.py`
- 项目说明：`README.md`
- 答辩演示：`docs/演示脚本.md`
- 源码检查：`docs/源码检查说明.md`
- 应用前景：`docs/应用前景与安全价值.md`
- 核心案例：`docs/MIN-004案例报告.md`

## 说明

本展示包不包含需要参赛队员手写或签名的 `作品报告.docx` 与 `作品原创性声明.docx`。正式提交时请将填写后的 PDF 报告和原创性声明按竞赛要求单独放入提交材料。
"""
    (dst_root / "展示包说明.md").write_text(text, encoding="utf-8")


def build_package(zip_file: bool) -> Path:
    release_root = ROOT / "release"
    release_root.mkdir(exist_ok=True)
    timestamp = datetime.now().strftime("%Y%m%d_%H%M")
    dst_root = release_root / f"{PACKAGE_NAME}_{timestamp}"
    if dst_root.exists():
        shutil.rmtree(dst_root)
    dst_root.mkdir(parents=True)

    for rel in INCLUDE_DIRS:
        src = ROOT / rel
        if src.exists():
            copy_tree(src, dst_root / rel)
    for rel in INCLUDE_FILES:
        src = ROOT / rel
        if src.exists():
            shutil.copy2(src, dst_root / rel)
    copy_outputs(dst_root)
    shutil.copy2(ROOT / "启动展示台.ps1", dst_root / "启动展示台.ps1")
    write_release_readme(dst_root)

    if zip_file:
        archive_base = release_root / dst_root.name
        shutil.make_archive(str(archive_base), "zip", dst_root)
    return dst_root


def main() -> int:
    parser = argparse.ArgumentParser(description="Build a competition demo release package.")
    parser.add_argument("--zip", action="store_true", help="Also create a zip archive.")
    args = parser.parse_args()
    dst = build_package(args.zip)
    print(f"release package: {dst}")
    if args.zip:
        print(f"zip archive: {dst}.zip")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
