from __future__ import annotations

import json
import os
import re
import shlex
import shutil
import subprocess
import sys
import time
import uuid
from collections import Counter
from datetime import datetime, timezone
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from typing import Any
from urllib.parse import parse_qs, unquote, urlparse

ROOT = Path(__file__).resolve().parents[1]
WEB_ROOT = ROOT / "web"
USER_JOBS_ROOT = ROOT / "outputs" / "user_jobs"
USER_JOBS_FALLBACK_ROOT = ROOT / "docs" / "report_assets" / "user_jobs"
TOOLCHAIN_CONFIG_DIR = ROOT / "configs" / "toolchains"
MAX_USER_INPUT_BYTES = 512 * 1024
MAX_HISTORY_ITEMS = 20

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from mlirdiff.cases import build_issue_cases
from mlirdiff.config import Pipeline, load_pipelines
from mlirdiff.engine import RunOptions, run_suite
from mlirdiff.report import write_html_report, write_json_report, write_markdown_report


USER_PROFILES: dict[str, dict[str, Any]] = {
    "quick": {
        "id": "quick",
        "name": "快速检查",
        "description": "优先检查基础合法性与常见优化路径，适合首次提交。",
        "estimate": "约 10 秒",
        "pipeline_names": ["parse_verify", "canonicalize"],
    },
    "standard": {
        "id": "standard",
        "name": "标准检查",
        "description": "加入 CSE、符号清理和常见优化组合，适合日常开发。",
        "estimate": "约 30 秒",
        "pipeline_names": [
            "parse_verify",
            "canonicalize",
            "cse",
            "canonicalize_cse",
            "symbol_dce_canonicalize",
        ],
    },
    "deep": {
        "id": "deep",
        "name": "深度检查",
        "description": "覆盖更多 lowering 与组合路径，适合发布前或工具链升级前复核。",
        "estimate": "约 1 分钟",
        "pipeline_names": [
            "parse_verify",
            "canonicalize",
            "cse",
            "canonicalize_cse",
            "symbol_dce_canonicalize",
            "canonicalize_sccp_cse",
            "canonicalize_cse_sccp_canonicalize",
            "lower_affine",
            "convert_scf_to_cf",
        ],
    },
}

CATEGORY_LABELS = {
    "success": "正常完成",
    "parser": "语法或版本兼容问题",
    "verifier": "IR 约束未通过",
    "dialect registration": "Dialect 依赖未满足",
    "type legality": "类型合法性问题",
    "memory/assertion": "内部异常",
    "timeout": "执行超时",
    "unknown failure": "需要进一步判断",
}


def utc_now() -> str:
    return datetime.now(timezone.utc).astimezone().isoformat(timespec="seconds")


class DashboardHandler(SimpleHTTPRequestHandler):
    """Serve the simplified user portal and retain the original lab dashboard."""

    def do_GET(self) -> None:
        parsed = urlparse(self.path)
        if parsed.path == "/":
            self._send_file(WEB_ROOT / "index.html", "text/html; charset=utf-8")
            return
        if parsed.path == "/lab":
            self._send_file(WEB_ROOT / "lab.html", "text/html; charset=utf-8")
            return

        # User-facing API: intentionally small and clear.
        if parsed.path == "/api/user/overview":
            self._send_json(user_overview())
            return
        if parsed.path == "/api/user/history":
            self._send_json(user_history())
            return
        if parsed.path == "/api/user/job":
            job_id = parse_qs(parsed.query).get("id", [""])[0]
            self._send_json(load_user_job(job_id))
            return

        # Legacy research/lab endpoints remain available only from /lab.
        if parsed.path == "/api/status":
            self._send_json(project_status())
            return
        if parsed.path == "/api/report":
            name = parse_qs(parsed.query).get("name", ["demo"])[0]
            self._send_json(load_report(name))
            return
        if parsed.path == "/api/toolchain":
            self._send_json(toolchain_status())
            return
        if parsed.path == "/api/seeds":
            self._send_json(seed_catalog())
            return
        if parsed.path == "/api/environments":
            self._send_json(environment_status())
            return
        if parsed.path == "/api/cases":
            self._send_json(issue_case_status())
            return
        if parsed.path == "/api/minimized":
            self._send_json(minimized_repros())
            return
        if parsed.path == "/api/mojo":
            self._send_json(load_mojo_bridge())
            return

        if parsed.path.startswith("/outputs/"):
            self._send_file(ROOT / unquote(parsed.path).lstrip("/"), _content_type(parsed.path))
            return
        if parsed.path.startswith("/apps/"):
            self._send_file(ROOT / unquote(parsed.path).lstrip("/"), _content_type(parsed.path))
            return
        if parsed.path.startswith("/docs/"):
            self._send_file(ROOT / unquote(parsed.path).lstrip("/"), _content_type(parsed.path))
            return
        if parsed.path.startswith("/materials/"):
            self._send_file(ROOT / "outputs" / unquote(parsed.path).lstrip("/"), _content_type(parsed.path))
            return
        if parsed.path.startswith("/web/"):
            self._send_file(ROOT / unquote(parsed.path).lstrip("/"), _content_type(parsed.path))
            return
        self.send_error(404, "Not found")

    def do_POST(self) -> None:
        parsed = urlparse(self.path)
        if parsed.path not in {"/api/run", "/api/user/analyze"}:
            self.send_error(404, "Not found")
            return

        try:
            payload = self._read_json_body()
            if parsed.path == "/api/user/analyze":
                result = analyze_user_input(payload)
                self._send_json({"ok": True, **result})
                return

            mode = payload.get("mode", "demo")
            report = run_mode(mode, payload)
            self._send_json({"ok": True, "mode": mode, "report": report})
        except ValueError as exc:
            self._send_json({"ok": False, "error": str(exc)}, status=400)
        except Exception as exc:  # pragma: no cover - surfaced to UI.
            self._send_json({"ok": False, "error": str(exc)}, status=500)

    def log_message(self, format: str, *args) -> None:
        # Keep the student-facing terminal clean; API errors are returned as JSON.
        return

    def _read_json_body(self) -> dict[str, Any]:
        raw_length = self.headers.get("Content-Length", "0")
        try:
            length = int(raw_length)
        except ValueError as exc:
            raise ValueError("请求长度不合法。") from exc
        if length <= 0:
            return {}
        if length > MAX_USER_INPUT_BYTES + 16 * 1024:
            raise ValueError("请求内容过大，单次检查最多支持 512 KB 的 MLIR 输入。")
        raw = self.rfile.read(length)
        try:
            payload = json.loads(raw.decode("utf-8"))
        except (UnicodeDecodeError, json.JSONDecodeError) as exc:
            raise ValueError("请求格式不正确，请重新提交。") from exc
        if not isinstance(payload, dict):
            raise ValueError("请求内容必须为对象。")
        return payload

    def _send_json(self, payload: dict, status: int = 200) -> None:
        data = json.dumps(payload, ensure_ascii=False).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(data)))
        self.send_header("Cache-Control", "no-store")
        self.end_headers()
        self.wfile.write(data)

    def _send_file(self, path: Path, content_type: str) -> None:
        try:
            resolved = path.resolve()
            root = ROOT.resolve()
            if root not in resolved.parents and resolved != root:
                self.send_error(403, "Forbidden")
                return
        except OSError:
            self.send_error(404, "Not found")
            return
        if not path.exists() or not path.is_file():
            self.send_error(404, "Not found")
            return
        data = path.read_bytes()
        self.send_response(200)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)


# ---------------------------------------------------------------------------
# User portal APIs
# ---------------------------------------------------------------------------

def user_overview() -> dict:
    status = toolchain_status()
    seed_count = len(list((ROOT / "seeds").glob("**/*.mlir")))
    public_seed_count = _public_seed_count()
    return {
        "seed_count": seed_count,
        "public_seed_count": public_seed_count or seed_count,
        "runtime": {
            "available": bool(status.get("available")),
            "configured": status.get("configured", "mlir-opt"),
            "display_name": _display_runtime_name(status),
            "detail": status.get("version") or status.get("error", ""),
            "mode": status.get("mode", "missing"),
            "warning": status.get("warning", ""),
        },
        "profiles": [
            {
                "id": profile["id"],
                "name": profile["name"],
                "description": profile["description"],
                "estimate": profile["estimate"],
            }
            for profile in USER_PROFILES.values()
        ],
        "example": {
            "filename": "basic_example.mlir",
            "content": (
                "module {\n"
                "  func.func @main() {\n"
                "    return\n"
                "  }\n"
                "}\n"
            ),
        },
    }


def analyze_user_input(payload: dict[str, Any]) -> dict:
    """Run a small, safe, user-selected set of preset pipelines on one input."""
    content = payload.get("content", "")
    filename = _safe_filename(payload.get("filename", "untitled.mlir"))
    profile_id = str(payload.get("profile", "quick"))

    if profile_id not in USER_PROFILES:
        raise ValueError("未识别的检查深度，请刷新页面后重试。")
    if not isinstance(content, str) or not content.strip():
        raise ValueError("请先上传 .mlir 文件或粘贴 MLIR 代码。")
    if "\x00" in content:
        raise ValueError("输入不能包含空字符。")
    if len(content.encode("utf-8")) > MAX_USER_INPUT_BYTES:
        raise ValueError("输入内容超过 512 KB，请拆分后再检查。")

    runtime = toolchain_status()
    if not runtime.get("available"):
        raise ValueError(
            "当前环境未找到 mlir-opt，无法进行真实检查。请先安装 LLVM/MLIR，"
            "或设置 MLIR_OPT 后重新启动展示台。"
        )

    job_id = _new_job_id()
    jobs_root = _writable_user_jobs_root()
    job_root = jobs_root / job_id
    input_dir = job_root / "input"
    output_dir = job_root / "result"
    input_dir.mkdir(parents=True, exist_ok=True)
    seed_path = input_dir / filename
    seed_path.write_text(content, encoding="utf-8")

    profile = USER_PROFILES[profile_id]
    pipelines = _profile_pipelines(profile)
    start = time.perf_counter()
    result = run_suite(
        pipelines,
        RunOptions(
            seed_dir=input_dir,
            out_dir=output_dir,
            mlir_opt=str(runtime.get("configured") or "mlir-opt"),
            timeout_seconds=20.0,
            mock=False,
        ),
    )
    elapsed_ms = int((time.perf_counter() - start) * 1000)
    write_json_report(result, output_dir / "report.json")
    write_markdown_report(result, output_dir / "report.md")
    write_html_report(result, output_dir / "report.html")

    summary = _summarize_user_result(result, elapsed_ms)
    response = _user_job_payload(job_id, filename, profile, result, summary, output_dir)
    metadata = {
        "id": job_id,
        "created_at": utc_now(),
        "filename": filename,
        "profile": profile_id,
        "profile_name": profile["name"],
        "runtime": _runtime_payload(runtime),
        "summary": summary,
        "pipeline_count": len(pipelines),
        "run_count": len(result.runs),
        "report_url": response["report_url"],
    }
    (job_root / "meta.json").write_text(json.dumps(metadata, ensure_ascii=False, indent=2), encoding="utf-8")
    return response


def user_history() -> dict:
    known_real_jobs = _known_real_user_job_ids()
    items = []
    for root in _user_job_roots():
        if not root.exists():
            continue
        for meta_path in root.glob("*/meta.json"):
            item = _history_item_from_meta(meta_path, known_real_jobs)
            if item:
                items.append(item)
    items.sort(key=lambda item: item.get("created_at", ""), reverse=True)
    return {"items": items[:MAX_HISTORY_ITEMS]}


def _history_item_from_meta(meta_path: Path, known_real_jobs: dict[str, dict[str, Any]]) -> dict[str, Any] | None:
    try:
        meta = json.loads(meta_path.read_text(encoding="utf-8"))
        summary = meta.get("summary", {})
        runtime = meta.get("runtime") if isinstance(meta.get("runtime"), dict) else {}
        job_id = meta.get("id", meta_path.parent.name)
        if not runtime and job_id in known_real_jobs:
            runtime = known_real_jobs[job_id]
        return {
            "id": job_id,
            "created_at": meta.get("created_at", ""),
            "filename": meta.get("filename", "untitled.mlir"),
            "profile": meta.get("profile", "quick"),
            "profile_name": meta.get("profile_name", "快速检查"),
            "status": summary.get("status", "review"),
            "risk": summary.get("risk", "medium"),
            "title": summary.get("title", "查看结果"),
            "runtime_mode": runtime.get("mode", "unavailable"),
            "runtime_detail": runtime.get("display_name") or runtime.get("configured") or "历史元数据未保存 runner 来源",
            "report_url": meta.get("report_url", ""),
        }
    except (OSError, json.JSONDecodeError):
        return None


def _user_job_roots() -> list[Path]:
    return [USER_JOBS_ROOT, USER_JOBS_FALLBACK_ROOT]


def _writable_user_jobs_root() -> Path:
    """Prefer the historical outputs path, fall back when sandbox ACLs block writes."""
    for root in _user_job_roots():
        try:
            probe = root / ".write_probe"
            probe.mkdir(parents=True, exist_ok=True)
            probe.rmdir()
            return root
        except OSError:
            continue
    raise ValueError("当前环境无法写入用户任务目录，不能生成新的分析记录。")


def _known_real_user_job_ids() -> dict[str, dict[str, Any]]:
    """Load cached E2E evidence for old user jobs whose meta lacks runtime fields."""
    path = ROOT / "outputs" / "competition_evidence" / "real_user_portal_e2e.json"
    if not path.exists():
        return {}
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError):
        return {}
    runtime = data.get("runtime", {})
    if runtime.get("mode") != "real":
        return {}
    jobs: dict[str, dict[str, Any]] = {}
    primary = data.get("primary_job", {})
    if primary.get("id"):
        jobs[str(primary["id"])] = runtime
    for item in data.get("repeated_exception_jobs", []):
        if item.get("id"):
            jobs[str(item["id"])] = runtime
    return jobs


def load_user_job(job_id: str) -> dict:
    if not re.fullmatch(r"[a-z0-9-]{8,48}", job_id or ""):
        raise ValueError("检测记录标识不合法。")
    root = None
    for candidate_root in _user_job_roots():
        candidate = candidate_root / job_id
        if (candidate / "meta.json").exists():
            root = candidate
            break
    if root is None:
        root = USER_JOBS_ROOT / job_id
    meta_path = root / "meta.json"
    report_path = root / "result" / "report.json"
    if not meta_path.exists() or not report_path.exists():
        raise ValueError("找不到该检测记录，可能已被清理。")
    meta = json.loads(meta_path.read_text(encoding="utf-8"))
    report = json.loads(report_path.read_text(encoding="utf-8"))
    profile = USER_PROFILES.get(meta.get("profile"), USER_PROFILES["quick"])
    result = _result_from_report(report)
    summary = meta.get("summary") or _summarize_user_result(result, 0)
    return _user_job_payload(
        job_id,
        str(meta.get("filename", "untitled.mlir")),
        profile,
        result,
        summary,
        root / "result",
    )


def _result_from_report(report: dict[str, Any]):
    """A small adapter that supplies the attributes used by the user result formatter."""

    class ReportResult:
        def __init__(self, data: dict[str, Any]):
            self.runs = data.get("runs", [])
            self.issues = data.get("issues", [])
            self.pipelines = data.get("pipelines", [])

    return ReportResult(report)


def _user_job_payload(
    job_id: str,
    filename: str,
    profile: dict[str, Any],
    result: Any,
    summary: dict[str, Any],
    output_dir: Path,
) -> dict:
    runs = []
    raw_runs = result.runs
    for run in raw_runs:
        data = run.to_dict() if hasattr(run, "to_dict") else dict(run)
        category = str(data.get("category", "unknown failure"))
        runs.append(
            {
                "pipeline": data.get("pipeline", "unknown"),
                "category": category,
                "category_label": CATEGORY_LABELS.get(category, category),
                "category_key": _category_key(category),
                "elapsed_ms": data.get("elapsed_ms", 0),
                "short_message": _short_run_message(category, str(data.get("stderr", ""))),
            }
        )
    return {
        "id": job_id,
        "filename": filename,
        "profile": profile["id"],
        "profile_name": profile["name"],
        "runtime": _runtime_payload(toolchain_status()),
        "pipeline_count": len(result.pipelines),
        "run_count": len(raw_runs),
        "summary": summary,
        "runs": runs,
        "report_url": _public_path(output_dir / "report.html"),
    }


def _public_path(path: Path) -> str:
    try:
        rel = path.resolve().relative_to(ROOT.resolve())
    except ValueError:
        return ""
    return "/" + rel.as_posix()


def _summarize_user_result(result: Any, elapsed_ms: int) -> dict[str, Any]:
    raw_runs = result.runs
    categories = Counter()
    for run in raw_runs:
        categories[str(run.category if hasattr(run, "category") else run.get("category", "unknown failure"))] += 1

    hard_count = categories["memory/assertion"] + categories["timeout"]
    input_count = categories["parser"] + categories["verifier"] + categories["dialect registration"] + categories["type legality"]
    unknown_count = categories["unknown failure"]
    issue_count = len(result.issues)

    if hard_count:
        status = "attention"
        risk = "high"
        title = "发现需要项目成员复核的内部异常"
        description = "至少一条预设检查路径没有以正常诊断方式结束。建议先保存本次结果，再由项目成员查看技术详情、最小化输入并进行版本复核。"
        recommendations = [
            "不要把该结论直接理解为已确认漏洞；它表示存在值得进一步核查的稳定性风险候选。",
            "保留本次检测记录，并向项目成员提供“完整技术报告”链接。",
            "项目成员应优先检查触发 pipeline、错误摘要和输入是否可被进一步最小化。",
        ]
        category_explanation = "系统观察到内部异常或超时。此类情况不会直接等同于安全漏洞，但比普通语法错误更值得进入后续复核流程。"
        kicker = "需要进一步复核"
    elif input_count:
        status = "review"
        risk = "medium"
        title = "输入未通过全部基础检查"
        description = "系统发现语法、IR 约束、Dialect 依赖或类型合法性问题。多数情况下需要先修改输入或补齐环境，而不是编译器内部故障。"
        recommendations = [
            "先根据结果确认 MLIR 语法、operation 约束和所需 dialect 是否匹配当前工具链版本。",
            "若你本来预期该输入可以通过，请尝试使用与生成该 IR 相同版本的 MLIR 工具链。",
            "修改后先使用“快速检查”验证，再按需要执行更深的检查。",
        ]
        category_explanation = "系统将普通输入诊断与内部异常分开呈现。本次结果更接近输入或环境兼容性问题，不应直接按安全事件处理。"
        kicker = "建议先修正输入或环境"
    elif unknown_count or issue_count:
        status = "review"
        risk = "medium"
        title = "检查结果需要进一步判断"
        description = "本次运行未出现明确的内部异常，但存在暂未完全分类的结果或 pipeline 间行为差异。建议由项目成员查看技术详情。"
        recommendations = [
            "先查看每条检查路径的状态，确认是否为预期的 dialect 或版本差异。",
            "如该输入来自实际模型或第三方组件，建议保留输入来源和生成工具链信息。",
            "必要时将本次结果与项目已有案例进行对照。",
        ]
        category_explanation = "这类结果不一定表示风险，但提示不同检查路径对同一输入的处理方式不完全一致，需要结合上下文判断。"
        kicker = "存在待判断项"
    else:
        status = "passed"
        risk = "low"
        title = "未发现内部异常"
        description = "本次预设检查路径均正常完成。该结果表示输入在当前工具链与当前检查范围内表现稳定，不代表对所有版本和所有 pass 组合的绝对保证。"
        recommendations = [
            "可以将该输入作为当前版本下的通过记录保存。",
            "在发布前、切换工具链或引入新的 dialect 后，建议再次执行“深度检查”。",
            "对于生产服务，仍建议配合资源限制、隔离 worker 和持续回归测试。",
        ]
        category_explanation = "当前预设检查路径均已完成，系统没有观察到内部断言、异常退出或超时。"
        kicker = "检查通过"

    category_items = []
    for category, count in sorted(categories.items(), key=lambda item: (-item[1], item[0])):
        category_items.append(
            {
                "label": CATEGORY_LABELS.get(category, category),
                "count": count,
                "key": _category_key(category),
            }
        )

    return {
        "status": status,
        "risk": risk,
        "kicker": kicker,
        "title": title,
        "description": description,
        "recommendations": recommendations,
        "categories": category_items,
        "category_explanation": category_explanation,
        "technical_hint": "技术详情列出了每条预设 pipeline 的状态。原始日志和完整运行记录可在“完整技术报告”中查看。",
        "elapsed_ms": elapsed_ms,
    }


def _category_key(category: str) -> str:
    if category == "success":
        return "success"
    if category in {"memory/assertion", "timeout"}:
        return "attention"
    return "review"


def _short_run_message(category: str, stderr: str) -> str:
    if category == "success":
        return "该路径正常完成。"
    if category == "parser":
        return "输入语法或版本兼容性未满足。"
    if category == "verifier":
        return "IR operation 约束未通过验证。"
    if category == "dialect registration":
        return "当前环境未注册所需 dialect。"
    if category == "type legality":
        return "类型转换或 lowering 合法性未满足。"
    if category == "memory/assertion":
        return "出现内部断言或异常退出，需要人工复核。"
    if category == "timeout":
        return "超过当前检查的时间预算。"
    first_line = next((line.strip() for line in stderr.splitlines() if line.strip()), "")
    return first_line[:120] if first_line else "该结果需要结合原始日志判断。"


def _profile_pipelines(profile: dict[str, Any]) -> list[Pipeline]:
    all_pipelines = load_pipelines(ROOT / "configs" / "pipelines.json")
    wanted = set(profile["pipeline_names"])
    selected = [pipeline for pipeline in all_pipelines if pipeline.name in wanted]
    if not selected:
        raise ValueError("当前检查配置不可用，请确认 configs/pipelines.json 完整存在。")
    return selected


def _safe_filename(name: Any) -> str:
    raw = Path(str(name or "untitled.mlir")).name
    raw = re.sub(r"[^A-Za-z0-9_.\-]+", "_", raw).strip("._") or "untitled"
    if not raw.lower().endswith(".mlir"):
        raw += ".mlir"
    return raw[:120]


def _new_job_id() -> str:
    return f"job-{datetime.now().strftime('%Y%m%d-%H%M%S')}-{uuid.uuid4().hex[:8]}"


def _public_seed_count() -> int:
    """Prefer the concise curated set when seed metadata is available."""
    source_index = load_source_index()
    if not source_index:
        return 0
    count = sum(
        1
        for value in source_index.values()
        if isinstance(value, dict) and value.get("origin") in {"official", "issue", "generated"}
    )
    return count


def _display_runtime_name(status: dict[str, Any]) -> str:
    version = str(status.get("version", "")).splitlines()
    if version:
        return version[0][:96]
    return str(status.get("configured", "mlir-opt"))


def _runtime_payload(status: dict[str, Any]) -> dict[str, str | bool]:
    return {
        "available": bool(status.get("available")),
        "configured": str(status.get("configured", "mlir-opt")),
        "display_name": _display_runtime_name(status),
        "mode": str(status.get("mode", "missing")),
        "warning": str(status.get("warning", "")),
    }


# ---------------------------------------------------------------------------
# Existing research/lab APIs kept for backwards compatibility.
# ---------------------------------------------------------------------------

def project_status() -> dict:
    seeds = sorted((ROOT / "seeds").glob("**/*.mlir"))
    source_index = load_source_index()
    by_group: dict[str, int] = {}
    by_origin: dict[str, int] = {}
    for seed in seeds:
        rel = seed.relative_to(ROOT / "seeds")
        group = rel.parts[0] if len(rel.parts) > 1 else "root"
        by_group[group] = by_group.get(group, 0) + 1
        key = str(Path("seeds") / rel).replace("\\", "/")
        origin = source_index.get(key, {}).get("origin", "unknown")
        by_origin[origin] = by_origin.get(origin, 0) + 1

    configs = []
    for config in sorted((ROOT / "configs").glob("*.json")):
        try:
            count = len(load_pipelines(config))
        except Exception:
            count = 0
        configs.append({"name": config.name, "pipelines": count})

    return {
        "seed_count": len(seeds),
        "seed_groups": by_group,
        "seed_origins": by_origin,
        "configs": configs,
        "reports": {
            "demo": (ROOT / "outputs" / "demo" / "report.json").exists(),
            "latest": (ROOT / "outputs" / "latest" / "report.json").exists(),
            "issues": (ROOT / "outputs" / "issues" / "report.json").exists(),
            "discovery": (ROOT / "outputs" / "discovery" / "report.json").exists(),
            "discovery_mlir22": (ROOT / "outputs" / "discovery_mlir22" / "report.json").exists(),
            "mojo_core_profile": (ROOT / "outputs" / "mojo_core_profile" / "report.json").exists(),
        },
    }


def seed_catalog() -> dict:
    source_index = load_source_index()
    rows = []
    for seed in sorted((ROOT / "seeds").glob("**/*.mlir")):
        rel = seed.relative_to(ROOT)
        key = str(rel).replace("\\", "/")
        meta = source_index.get(key, {})
        parts = seed.relative_to(ROOT / "seeds").parts
        rows.append(
            {
                "path": key,
                "group": parts[0] if parts else "root",
                "origin": meta.get("origin", "unknown"),
                "source": meta.get("source", ""),
                "pipeline": meta.get("pipeline", ""),
                "size": seed.stat().st_size,
            }
        )
    return {"seeds": rows}


def environment_status() -> dict:
    status = toolchain_status()
    native = status.get("resolved") or shutil.which("mlir-opt")
    runner = ROOT / "scripts" / "ssh_mlir_opt.py"
    ssh_host = os.environ.get("MLIR_SSH_HOST", "")
    ssh_enabled = _env_truthy("MLIRSHIELD_USE_SSH") or bool(ssh_host)
    return {
        "environments": [
            {
                "name": "windows-native",
                "tool": "mlir-opt",
                "available": bool(status.get("available")),
                "status": "available" if status.get("available") else "missing",
                "detail": native or "Set MLIR_OPT, MLIRSHIELD_MLIR_OPT, or put mlir-opt on PATH.",
            },
            {
                "name": "ssh-mlir15-optional",
                "tool": os.environ.get("REMOTE_MLIR_OPT", "mlir-opt-15"),
                "available": runner.exists() and ssh_enabled,
                "status": "optional-enabled" if runner.exists() and ssh_enabled else "optional-disabled",
                "detail": (
                    f"SSH runner {runner.name}, host {ssh_host or 'not configured'}. "
                    "Enable with MLIRSHIELD_USE_SSH=1 when a remote MLIR machine is needed."
                ),
            },
            {
                "name": "ssh-mlir22-evidence",
                "tool": "mlir-opt-22",
                "available": runner.exists() and ssh_enabled,
                "status": "historical-evidence",
                "detail": "Used for existing Discovery MLIR22 and MIN-004 reports.",
            },
            {
                "name": "ssh-mlir23-optional",
                "tool": "mlir-opt-23",
                "available": runner.exists() and ssh_enabled,
                "status": "optional-enabled" if runner.exists() and ssh_enabled else "optional-disabled",
                "detail": "LLVM/MLIR development snapshot used for current validation.",
            },
        ]
    }


def issue_case_status() -> dict:
    cases = build_issue_cases(
        ROOT / "outputs" / "issues" / "report.json",
        ROOT / "data" / "seed_sources.json",
        ROOT,
    )
    return {"cases": cases}


def minimized_repros() -> dict:
    root = ROOT / "outputs" / "minimized"
    case_meta = {}
    version_cases = ROOT / "configs" / "version_diff_cases.json"
    if version_cases.exists():
        data = json.loads(version_cases.read_text(encoding="utf-8"))
        for case in data.get("cases", []):
            case_meta[str(case.get("seed", "")).replace("\\", "/")] = case
    rows = []
    for path in sorted(root.glob("*.mlir")) if root.exists() else []:
        text = path.read_text(encoding="utf-8")
        rel = str(path.relative_to(ROOT)).replace("\\", "/")
        meta = case_meta.get(rel, {})
        tool = "mlir-opt-22" if meta.get("id") == "MIN-004" else "mlir-opt"
        rows.append(
            {
                "id": meta.get("id", ""),
                "title": meta.get("title", path.name),
                "name": path.name,
                "path": rel,
                "url": "/" + rel,
                "source": meta.get("source", ""),
                "command": " ".join([tool, *meta.get("args", [])]) if meta.get("args") else "",
                "is_key": meta.get("id") == "MIN-004",
                "lines": len(text.splitlines()),
                "size": path.stat().st_size,
                "preview": "\n".join(text.splitlines()[:10]),
            }
        )
    return {"repros": rows}


def run_mode(mode: str, payload: dict | None = None) -> dict:
    payload = payload or {}
    runtime = toolchain_status()
    mlir_opt = str(runtime.get("configured") or os.environ.get("MLIR_OPT") or "mlir-opt")
    timeout = 15.0
    extra_env: dict[str, str] = {}
    if mode == "demo":
        pipeline_file = ROOT / "configs" / "pipelines_demo.json"
        out_dir = ROOT / "outputs" / "demo"
        mock = True
    elif mode == "mock":
        pipeline_file = ROOT / "configs" / "pipelines.json"
        out_dir = ROOT / "outputs" / "latest"
        mock = True
    elif mode == "real":
        pipeline_file = ROOT / "configs" / "pipelines.json"
        out_dir = ROOT / "outputs" / "latest"
        seed_dir = ROOT / "seeds"
        mock = False
    elif mode == "issues":
        pipeline_file = ROOT / "configs" / "pipelines_issue_repros.json"
        out_dir = ROOT / "outputs" / "issues"
        seed_dir = ROOT / "seeds" / "issue_repros"
        mock = False
        if runtime.get("mode") == "real" and runtime.get("available"):
            pass
        elif _ssh_requested(payload):
            extra_env = _ssh_env(payload, "mlir-opt-15")
            mlir_opt = f"{sys.executable} {ROOT / 'scripts' / 'ssh_mlir_opt.py'}"
        else:
            raise ValueError(
                "Issue repros need a real local mlir-opt. Set MLIR_OPT/MLIRSHIELD_MLIR_OPT, "
                "or explicitly enable the optional SSH runner with MLIRSHIELD_USE_SSH=1."
            )
        timeout = 45.0
    elif mode == "discovery":
        pipeline_file = ROOT / "configs" / "pipelines_discovery.json"
        out_dir = ROOT / "outputs" / "discovery"
        seed_dir = ROOT / "seeds"
        mock = False
        if runtime.get("mode") == "real" and runtime.get("available"):
            pass
        elif _ssh_requested(payload):
            extra_env = _ssh_env(payload, "mlir-opt-15")
            mlir_opt = f"{sys.executable} {ROOT / 'scripts' / 'ssh_mlir_opt.py'}"
        else:
            raise ValueError(
                "Discovery mode needs a real local mlir-opt. Set MLIR_OPT/MLIRSHIELD_MLIR_OPT, "
                "or explicitly enable the optional SSH runner with MLIRSHIELD_USE_SSH=1."
            )
        timeout = 45.0
    else:
        raise ValueError(f"Unsupported mode: {mode}")

    if mode in {"demo", "mock"}:
        seed_dir = ROOT / "seeds"

    pipelines = load_pipelines(pipeline_file)
    result = run_suite(
        pipelines,
        RunOptions(
            seed_dir=seed_dir,
            out_dir=out_dir,
            mlir_opt=mlir_opt,
            timeout_seconds=timeout,
            mock=mock,
            env=extra_env,
        ),
    )
    write_json_report(result, out_dir / "report.json")
    write_markdown_report(result, out_dir / "report.md")
    write_html_report(result, out_dir / "report.html")
    if mode == "demo":
        return load_report("demo")
    if mode == "issues":
        return load_report("issues")
    if mode == "discovery":
        return load_report("discovery")
    return load_report("latest")


def _env_truthy(name: str) -> bool:
    return str(os.environ.get(name, "")).strip().lower() in {"1", "true", "yes", "on"}


def _ssh_requested(payload: dict[str, Any]) -> bool:
    requested = payload.get("use_ssh") or payload.get("runner") == "ssh"
    return bool(requested) or _env_truthy("MLIRSHIELD_USE_SSH")


def _ssh_env(payload: dict[str, Any], default_remote: str) -> dict[str, str]:
    vm_password = str(payload.get("vm_password") or os.environ.get("MLIR_SSH_PASSWORD") or "")
    if not vm_password:
        raise ValueError("Optional SSH runner is enabled, but MLIR_SSH_PASSWORD was not provided.")
    return {
        "MLIR_SSH_HOST": os.environ.get("MLIR_SSH_HOST", "192.168.54.128"),
        "MLIR_SSH_USER": os.environ.get("MLIR_SSH_USER", "toby"),
        "MLIR_SSH_PASSWORD": vm_password,
        "REMOTE_MLIR_OPT": os.environ.get("REMOTE_MLIR_OPT", default_remote),
    }


def load_report(name: str) -> dict:
    if name not in {"demo", "latest", "issues", "discovery", "discovery_mlir22"}:
        raise ValueError("Report name must be demo, latest, issues, discovery, or discovery_mlir22.")
    path = ROOT / "outputs" / name / "report.json"
    if not path.exists():
        return {"exists": False, "name": name}
    data = json.loads(path.read_text(encoding="utf-8"))
    source_index = load_source_index()
    issues = data.get("issues", [])
    for issue in issues:
        source = source_index.get(str(issue.get("seed", "")).replace("\\", "/"), {})
        issue["source"] = source.get("source", "")
        issue["origin"] = source.get("origin", "")
    return {
        "exists": True,
        "name": name,
        "html_url": f"/outputs/{name}/report.html",
        "json_url": f"/outputs/{name}/report.json",
        "markdown_url": f"/outputs/{name}/report.md",
        "seeds": len(data.get("seeds", [])),
        "pipelines": len(data.get("pipelines", [])),
        "runs": len(data.get("runs", [])),
        "issues": issues,
        "summary": data.get("summary", {}),
    }


def load_mojo_bridge() -> dict:
    manifest_path = ROOT / "apps" / "mojo" / "mojo_manifest.json"
    report_path = ROOT / "outputs" / "mojo_core_profile" / "report.json"
    manifest = {}
    if manifest_path.exists():
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    report = {}
    if report_path.exists():
        data = json.loads(report_path.read_text(encoding="utf-8"))
        report = {
            "exists": True,
            "seeds": len(data.get("seeds", [])),
            "pipelines": len(data.get("pipelines", [])),
            "runs": len(data.get("runs", [])),
            "issues": len(data.get("issues", [])),
            "html_url": "/outputs/mojo_core_profile/report.html",
            "summary": data.get("summary", {}),
        }
    return {
        "manifest_exists": bool(manifest),
        "manifest_url": "/apps/mojo/mojo_manifest.json",
        "readme_url": "/apps/mojo/README.md",
        "scope": manifest.get("scope", "Mojo application bridge"),
        "environment": manifest.get("environment", {}),
        "records": manifest.get("records", []),
        "core_profile": report or {"exists": False},
    }


def load_source_index() -> dict:
    path = ROOT / "data" / "seed_sources.json"
    if not path.exists():
        return {}
    return json.loads(path.read_text(encoding="utf-8"))


def toolchain_status() -> dict:
    configured = os.environ.get("MLIR_OPT") or _discover_mlir_opt() or "mlir-opt"
    command = _split_command(configured)
    exe = command[0] if command else "mlir-opt"
    resolved = str(Path(exe)) if Path(exe).exists() else shutil.which(exe)
    result = {
        "configured": configured,
        "resolved": resolved or "",
        "available": bool(resolved),
        "version": "",
        "error": "",
        "mode": "missing",
        "warning": "",
    }
    if not resolved:
        result["error"] = "mlir-opt not found. Set MLIR_OPT or install LLVM/MLIR first."
        return result
    try:
        completed = subprocess.run(
            [*command, "--version"],
            capture_output=True,
            text=True,
            timeout=10,
            check=False,
        )
        result["available"] = completed.returncode == 0
        result["version"] = (completed.stdout or completed.stderr).strip()
        if completed.returncode != 0:
            result["error"] = completed.stderr.strip() or completed.stdout.strip()
        version_text = result["version"].lower()
        configured_text = configured.lower()
        if "demo runner" in version_text or "user_demo_mlir_opt" in configured_text:
            result["mode"] = "showcase"
            result["warning"] = "当前运行时仅用于用户流程演示，不代表真实 LLVM/MLIR 工具链结论。"
        elif result["available"]:
            result["mode"] = "real"
    except Exception as exc:
        result["available"] = False
        result["error"] = str(exc)
    return result


def _split_command(command: str) -> list[str]:
    if Path(command).exists():
        return [command]
    if " " in command:
        return [part.strip('"') for part in shlex.split(command, posix=False)]
    return [command]


def _discover_mlir_opt() -> str:
    configured = _configured_toolchain_path()
    if configured:
        return configured
    candidates = [
        ROOT / "clang+llvm-22.1.8-x86_64" / "bin" / "mlir-opt.exe",
        ROOT / "third_party" / "msys64" / "mingw64" / "bin" / "mlir-opt.exe",
    ]
    for candidate in candidates:
        if candidate.exists():
            return str(candidate)
    resolved = shutil.which("mlir-opt")
    return resolved or ""


def _configured_toolchain_path() -> str:
    explicit = os.environ.get("MLIRSHIELD_MLIR_OPT")
    if explicit:
        return explicit
    msys2_root = os.environ.get("MLIRSHIELD_MSYS2_ROOT")
    if msys2_root:
        return str(Path(msys2_root) / "mingw64" / "bin" / "mlir-opt.exe")
    for name in ("msys2_mingw64.local.json", "msys2_mingw64.example.json"):
        path = TOOLCHAIN_CONFIG_DIR / name
        if not path.exists():
            continue
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError):
            continue
        mlir_opt = data.get("mlir_opt")
        if mlir_opt and not _looks_like_placeholder_path(str(mlir_opt)):
            return str(mlir_opt)
        root = data.get("msys2_root")
        if root and not _looks_like_placeholder_path(str(root)):
            return str(Path(root) / "mingw64" / "bin" / "mlir-opt.exe")
    return ""


def _looks_like_placeholder_path(value: str) -> bool:
    upper = value.upper()
    return any(marker in upper for marker in ("<SET_", "EDIT_THIS_PATH", "PATH_TO_", "CHANGE_ME"))


def _content_type(path: str) -> str:
    if path.endswith(".html"):
        return "text/html; charset=utf-8"
    if path.endswith(".css"):
        return "text/css; charset=utf-8"
    if path.endswith(".js"):
        return "application/javascript; charset=utf-8"
    if path.endswith(".json"):
        return "application/json; charset=utf-8"
    if path.endswith(".svg"):
        return "image/svg+xml; charset=utf-8"
    if path.endswith(".png"):
        return "image/png"
    if path.endswith(".md") or path.endswith(".txt") or path.endswith(".mlir") or path.endswith(".mojo") or path.endswith(".ll"):
        return "text/plain; charset=utf-8"
    return "application/octet-stream"


def main() -> int:
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8765
    server = ThreadingHTTPServer(("127.0.0.1", port), DashboardHandler)
    print(f"MLIR user portal: http://127.0.0.1:{port}", flush=True)
    print(f"MLIR lab console: http://127.0.0.1:{port}/lab", flush=True)
    server.serve_forever()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
