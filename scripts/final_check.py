from __future__ import annotations

import argparse
import json
import os
import socket
import sys
import urllib.error
import urllib.request
from urllib.parse import quote
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
EXPECTED_REPORTS = ["demo", "latest", "issues", "discovery", "discovery_mlir22"]
REQUIRED_DOCS = [
    "docs/作品包装说明.md",
    "docs/MIN-004案例报告.md",
    "docs/答辩讲稿.md",
    "docs/演示脚本.md",
    "docs/源码检查说明.md",
    "docs/应用前景与安全价值.md",
    "docs/提交包说明.md",
    "docs/MLIR23最新版本问题搜索.md",
    "docs/MLIR23当前开放问题复核.md",
    "docs/原创问题搜索记录.md",
    "docs/原创漏洞候选_ORIG-001.md",
    "docs/ORIG-CAND-001变体验证.md",
    "docs/原创性证明材料.md",
    "docs/ORIG-CAND-001上游沟通草稿.md",
    "docs/ORIG-CAND-001_github_comment.md",
    "docs/独立原创漏洞搜索_20260601.md",
    "docs/评委快速入口.md",
    "docs/重点案例版本状态矩阵.md",
    "docs/最终清理建议.md",
]
REQUIRED_FILES = [
    "README.md",
    "run.py",
    "web/server.py",
    "web/index.html",
    "web/app.js",
    "web/styles.css",
    "final_demo.ps1",
    "outputs/minimized/mlir22_memref_canonicalize_current.chunk.min.mlir",
    "outputs/current_validation/min004_current_validation.md",
    "outputs/current_issues_mlir23/llvm_197158_current_validation.md",
    "outputs/original_candidates_mlir23/report.json",
    "outputs/orig001_variants/report.json",
    "outputs/independent_fuzz_mlir23/report.json",
    "outputs/aggressive_mlir23_function_full_240_539/report.json",
    "outputs/materials/system_architecture.svg",
    "outputs/materials/experiment_results.svg",
]
# Keep these patterns assembled at runtime so the checker does not store or
# match its own literal scan targets.
FORBIDDEN_PATTERNS = [
    "MLIR_SSH_" + "PASSWORD=",
]


def ok(message: str) -> tuple[bool, str]:
    return True, message


def fail(message: str) -> tuple[bool, str]:
    return False, message


def load_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8-sig"))


def check_required_files() -> list[tuple[bool, str]]:
    results = []
    for rel in [*REQUIRED_FILES, *REQUIRED_DOCS]:
        path = ROOT / rel
        results.append(ok(f"exists: {rel}") if path.exists() else fail(f"missing: {rel}"))
    return results


def check_seed_library() -> list[tuple[bool, str]]:
    seeds = sorted((ROOT / "seeds").glob("**/*.mlir"))
    source_index_path = ROOT / "data" / "seed_sources.json"
    source_index = load_json(source_index_path) if source_index_path.exists() else {}
    origins: dict[str, int] = {}
    for seed in seeds:
        key = str(seed.relative_to(ROOT)).replace("\\", "/")
        origin = source_index.get(key, {}).get("origin", "unknown")
        origins[origin] = origins.get(origin, 0) + 1
    results = [
        ok(f"seed count: {len(seeds)}") if len(seeds) >= 120 else fail(f"seed count too low: {len(seeds)}"),
        ok(f"official seeds: {origins.get('official', 0)}")
        if origins.get("official", 0) >= 100
        else fail(f"official seeds too low: {origins.get('official', 0)}"),
        ok(f"issue seeds: {origins.get('issue', 0)}")
        if origins.get("issue", 0) >= 9
        else fail(f"issue seeds too low: {origins.get('issue', 0)}"),
        ok(f"current issue seeds: {origins.get('issue-current', 0)}")
        if origins.get("issue-current", 0) >= 1
        else fail(f"current issue seeds too low: {origins.get('issue-current', 0)}"),
    ]
    current_issue = ROOT / "outputs" / "current_issues_mlir23" / "report.json"
    if current_issue.exists():
        data = load_json(current_issue)
        categories = data.get("summary", {}).get("run_categories", {})
        if categories.get("memory/assertion", 0) >= 1:
            results.append(ok("current MLIR23 issue: reproduced memory/assertion"))
        else:
            results.append(fail("current MLIR23 issue: missing memory/assertion evidence"))
    else:
        results.append(fail("missing report: current_issues_mlir23"))
    return results


def check_reports() -> list[tuple[bool, str]]:
    results = []
    for name in EXPECTED_REPORTS:
        path = ROOT / "outputs" / name / "report.json"
        if not path.exists():
            results.append(fail(f"missing report: {name}"))
            continue
        data = load_json(path)
        seeds = len(data.get("seeds", []))
        runs = len(data.get("runs", []))
        issues = len(data.get("issues", []))
        if seeds and runs:
            results.append(ok(f"{name}: {seeds} seeds / {runs} runs / {issues} issues"))
        else:
            results.append(fail(f"{name}: empty report"))
    return results


def check_min004() -> list[tuple[bool, str]]:
    path = ROOT / "outputs" / "minimized" / "mlir22_memref_canonicalize_current.chunk.min.mlir"
    if not path.exists():
        return [fail("MIN-004 file missing")]
    text = path.read_text(encoding="utf-8")
    lines = [line for line in text.splitlines() if line.strip()]
    checks = [
        ok(f"MIN-004 lines: {len(lines)}") if len(lines) <= 10 else fail(f"MIN-004 not minimal enough: {len(lines)} lines"),
        ok("MIN-004 contains memref.subview") if "memref.subview" in text else fail("MIN-004 missing memref.subview"),
        ok("MIN-004 contains memref.dim") if "memref.dim" in text else fail("MIN-004 missing memref.dim"),
    ]
    cases_path = ROOT / "configs" / "version_diff_cases.json"
    if cases_path.exists():
        cases = load_json(cases_path).get("cases", [])
        found = any(case.get("id") == "MIN-004" for case in cases)
        checks.append(ok("MIN-004 listed in version diff cases") if found else fail("MIN-004 not in version diff cases"))
    return checks


def check_secret_scan() -> list[tuple[bool, str]]:
    scanned = 0
    hits: list[str] = []
    skip_dirs = {".git", "__pycache__", "release", ".pytest_cache"}
    for path in ROOT.rglob("*"):
        if not path.is_file():
            continue
        if any(part in skip_dirs for part in path.relative_to(ROOT).parts):
            continue
        if path.suffix.lower() in {".png", ".jpg", ".jpeg", ".pdf", ".doc", ".docx", ".pyc", ".zip"}:
            continue
        try:
            text = path.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue
        scanned += 1
        for pattern in FORBIDDEN_PATTERNS:
            if pattern in text:
                hits.append(f"{path.relative_to(ROOT)} contains {pattern}")
    if hits:
        return [fail("secret scan hit: " + hit) for hit in hits]
    return [ok(f"secret scan passed: {scanned} text files")]


def is_port_open(host: str, port: int) -> bool:
    try:
        with socket.create_connection((host, port), timeout=1.0):
            return True
    except OSError:
        return False


def check_web(base_url: str | None) -> list[tuple[bool, str]]:
    if not base_url:
        return []
    endpoints = [
        "/",
        "/api/status",
        "/api/minimized",
        "/api/report?name=discovery_mlir22",
        "/docs/MIN-004案例报告.md",
        "/outputs/current_validation/min004_current_validation.md",
        "/outputs/current_issues_mlir23/llvm_197158_current_validation.md",
        "/docs/MLIR23当前开放问题复核.md",
        "/docs/ORIG-CAND-001变体验证.md",
        "/docs/原创性证明材料.md",
        "/docs/ORIG-CAND-001上游沟通草稿.md",
        "/docs/ORIG-CAND-001_github_comment.md",
        "/docs/独立原创漏洞搜索_20260601.md",
        "/docs/评委快速入口.md",
        "/docs/重点案例版本状态矩阵.md",
        "/docs/最终清理建议.md",
        "/docs/源码检查说明.md",
        "/docs/应用前景与安全价值.md",
        "/materials/system_architecture.svg",
        "/materials/experiment_results.svg",
    ]
    results = []
    for endpoint in endpoints:
        path, sep, query = endpoint.partition("?")
        encoded_endpoint = quote(path, safe="/") + (sep + query if sep else "")
        url = base_url.rstrip("/") + encoded_endpoint
        try:
            with urllib.request.urlopen(url, timeout=5) as response:
                status = response.status
                body = response.read(512)
            if status == 200 and body:
                results.append(ok(f"web ok: {endpoint}"))
            else:
                results.append(fail(f"web bad response: {endpoint} status={status} bytes={len(body)}"))
        except (urllib.error.URLError, TimeoutError) as exc:
            results.append(fail(f"web failed: {endpoint} ({exc})"))
    return results


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Final competition self-check for the MLIR safety project.")
    parser.add_argument("--web", default="", help="Optional dashboard base URL, for example http://127.0.0.1:8765")
    parser.add_argument(
        "--skip-secret-scan",
        action="store_true",
        help="Skip the full text-file secret scan for quick report/build verification.",
    )
    args = parser.parse_args(argv)

    results: list[tuple[bool, str]] = []
    results.extend(check_required_files())
    results.extend(check_seed_library())
    results.extend(check_reports())
    results.extend(check_min004())
    if args.skip_secret_scan:
        results.append(ok("secret scan skipped by --skip-secret-scan"))
    else:
        results.extend(check_secret_scan())
    if args.web:
        host_port = args.web.replace("http://", "").replace("https://", "").split("/")[0]
        host, _, port_text = host_port.partition(":")
        if port_text and not is_port_open(host, int(port_text)):
            results.append(fail(f"web port not listening: {host}:{port_text}"))
        results.extend(check_web(args.web))

    failed = [message for passed, message in results if not passed]
    for passed, message in results:
        prefix = "OK" if passed else "FAIL"
        print(f"[{prefix}] {message}")
    print()
    if failed:
        print(f"Final check failed: {len(failed)} issue(s).")
        return 1
    print("Final check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
