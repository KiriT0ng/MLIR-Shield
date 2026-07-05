from __future__ import annotations

import json
import os
import sys
import time
from pathlib import Path

import paramiko

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from mlirdiff.classifier import classify_run
from mlirdiff.model import RunRecord
from mlirdiff.signature import failure_signature, signature_excerpt


def main() -> int:
    config_path = Path(sys.argv[1]) if len(sys.argv) > 1 else ROOT / "configs" / "version_diff_cases.json"
    config = json.loads(config_path.read_text(encoding="utf-8"))
    host = os.environ.get("MLIR_SSH_HOST", "192.168.54.128")
    user = os.environ.get("MLIR_SSH_USER", "toby")
    password = os.environ.get("MLIR_SSH_PASSWORD")
    if not password:
        print("missing MLIR_SSH_PASSWORD", file=sys.stderr)
        return 2

    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(host, username=user, password=password, timeout=10)
    results = []
    for case in config["cases"]:
        seed_path = ROOT / case["seed"]
        source = seed_path.read_text(encoding="utf-8")
        for tool in config["tools"]:
            results.append(run_case(client, case, tool, source))
    client.close()

    report = {"tools": config["tools"], "cases": config["cases"], "results": results}
    report["summary"] = summarize(report)
    if "p0" in config_path.stem.lower():
        out_dir = ROOT / "outputs" / "version_diff_p0"
        doc_path = ROOT / "docs" / "P0版本差分实验.md"
    else:
        out_dir = ROOT / "outputs" / "version_diff"
        doc_path = ROOT / "docs" / "版本差分实验.md"
    out_dir.mkdir(parents=True, exist_ok=True)
    (out_dir / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    (out_dir / "report.md").write_text(render_markdown(report), encoding="utf-8")
    doc_path.write_text(render_markdown(report), encoding="utf-8")
    print(f"version diff cases: {len(config['cases'])}")
    print(f"results: {len(results)}")
    print(f"report: {out_dir / 'report.md'}")
    return 0


def run_case(client: paramiko.SSHClient, case: dict, tool: str, source: str) -> dict:
    command = " ".join([quote(tool), *[quote(arg) for arg in case["args"]]])
    start = time.perf_counter()
    stdin, stdout, stderr = client.exec_command(command, timeout=120)
    stdin.write(source)
    stdin.channel.shutdown_write()
    out = stdout.read().decode("utf-8", errors="replace")
    err = stderr.read().decode("utf-8", errors="replace")
    code = stdout.channel.recv_exit_status()
    elapsed_ms = int((time.perf_counter() - start) * 1000)
    record = RunRecord(
        seed=case["seed"],
        pipeline=case["id"],
        command=command,
        return_code=code,
        timed_out=False,
        elapsed_ms=elapsed_ms,
        stdout=out,
        stderr=err,
        stdout_path="",
        stderr_path="",
        category="",
    )
    record.category = classify_run(record)
    return {
        "case_id": case["id"],
        "tool": tool,
        "command": command,
        "return_code": code,
        "elapsed_ms": elapsed_ms,
        "category": record.category,
        "signature": failure_signature(record) if code != 0 else "",
        "excerpt": signature_excerpt(record, limit=500),
    }


def summarize(report: dict) -> list[dict]:
    rows = []
    for case in report["cases"]:
        results = [item for item in report["results"] if item["case_id"] == case["id"]]
        by_tool = {item["tool"]: item for item in results}
        old = by_tool.get("mlir-opt-15")
        new = by_tool.get("mlir-opt-22")
        status = "unknown"
        if old and new:
            old_fail = old["return_code"] != 0
            new_fail = new["return_code"] != 0
            if new_fail and is_pipeline_incompatible(new):
                status = "pipeline-incompatible-on-newer"
            elif old_fail and new_fail and not is_hard_failure(old) and is_hard_failure(new):
                status = "newer-version-hard-failure"
            elif old_fail and new_fail and is_hard_failure(old) and is_hard_failure(new):
                status = "confirmed-across-versions"
            elif old_fail and new_fail:
                status = "still-fails-different-mode"
            elif old_fail and not new_fail:
                status = "fixed-or-version-resolved"
            elif not old_fail and new_fail:
                status = "newer-version-regression"
            else:
                status = "no-failure"
        rows.append({"case_id": case["id"], "title": case["title"], "status": status})
    return rows


def is_pipeline_incompatible(result: dict) -> bool:
    text = result.get("excerpt", "").lower()
    markers = ["unknown command line argument", "unknown pass", "no such option"]
    return any(marker in text for marker in markers)


def is_hard_failure(result: dict) -> bool:
    return result.get("category") in {"memory/assertion", "timeout"}


def render_markdown(report: dict) -> str:
    lines = [
        "# 版本差分实验",
        "",
        f"- Tools: {', '.join(report['tools'])}",
        f"- Cases: {len(report['cases'])}",
        "",
        "## 判定摘要",
        "",
        "| Case | Status |",
        "| --- | --- |",
    ]
    for row in report["summary"]:
        lines.append(f"| {row['case_id']} {row['title']} | `{row['status']}` |")
    lines.extend(["", "## 详细结果", ""])
    for case in report["cases"]:
        lines.extend([f"### {case['id']} {case['title']}", "", f"- Seed: `{case['seed']}`", f"- Source: {case['source']}", ""])
        lines.extend(["| Tool | Return | Category | Signature | Time |", "| --- | ---: | --- | --- | ---: |"])
        for result in [item for item in report["results"] if item["case_id"] == case["id"]]:
            lines.append(
                f"| `{result['tool']}` | {result['return_code']} | `{result['category']}` | `{result['signature']}` | {result['elapsed_ms']} ms |"
            )
        lines.append("")
        for result in [item for item in report["results"] if item["case_id"] == case["id"]]:
            lines.extend([f"#### {result['tool']} excerpt", "", "```text", result["excerpt"], "```", ""])
    return "\n".join(lines)


def quote(value: str) -> str:
    if all(ch.isalnum() or ch in "-_./:=," for ch in value):
        return value
    return "'" + value.replace("'", "'\"'\"'") + "'"


if __name__ == "__main__":
    raise SystemExit(main())
