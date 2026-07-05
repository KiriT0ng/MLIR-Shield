const state = {
  inputMode: "file",
  profile: "quick",
  profiles: [],
  content: "",
  fileName: "untitled.mlir",
  overview: null,
  evidence: null,
  metrics: null,
  e2e: null,
  currentValidation: null,
  history: [],
};

const MAX_INPUT_BYTES = 512 * 1024;
const $ = (id) => document.getElementById(id);

const CATEGORY_LABELS = {
  success: "正常完成",
  parser: "parser 普通诊断",
  verifier: "verifier 普通诊断",
  "dialect registration": "dialect registration",
  "type legality": "type legality",
  "memory/assertion": "memory / assertion",
  timeout: "timeout",
  "unknown failure": "unknown failure",
  "parser/verifier": "parser / verifier",
};

function escapeHtml(value) {
  return String(value ?? "")
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

async function getJson(url) {
  const response = await fetch(url, { cache: "no-store" });
  if (!response.ok) throw new Error(`${url} 返回 ${response.status}`);
  return response.json();
}

async function getText(url) {
  const response = await fetch(url, { cache: "no-store" });
  if (!response.ok) throw new Error(`${url} 返回 ${response.status}`);
  return response.text();
}

function number(value) {
  if (!Number.isFinite(Number(value))) return "--";
  return new Intl.NumberFormat("zh-CN").format(Number(value));
}

function bytes(value) {
  const n = Number(value) || 0;
  if (n < 1024) return `${n} B`;
  if (n < 1024 * 1024) return `${(n / 1024).toFixed(1)} KB`;
  return `${(n / (1024 * 1024)).toFixed(1)} MB`;
}

function shortDate(value) {
  if (!value) return "--";
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return value;
  return new Intl.DateTimeFormat("zh-CN", {
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
  }).format(date);
}

function widthClass(value, total) {
  const percent = total > 0 ? Math.max(0, Math.min(100, Math.round((value / total) * 100))) : 0;
  return `w-${Math.round(percent / 5) * 5}`;
}

function categoryClass(category) {
  if (category === "success") return "is-success";
  if (category === "memory/assertion" || category === "timeout") return "is-attention";
  return "is-review";
}

function runnerClass(mode) {
  if (mode === "real") return "is-real";
  if (mode === "showcase" || mode === "demo") return "is-showcase";
  if (mode === "cached_evidence" || mode === "cached") return "is-cached";
  return "is-unavailable";
}

function runnerLabel(mode) {
  if (mode === "real") return "real";
  if (mode === "showcase" || mode === "demo") return "showcase";
  if (mode === "cached_evidence" || mode === "cached") return "cached_evidence";
  return "unavailable";
}

function statusClass(status) {
  if (status === "attention") return "is-p0";
  if (status === "review") return "is-p1";
  return "is-p2";
}

function showToast(message, type = "success") {
  const toast = $("toast");
  toast.textContent = message;
  toast.className = `toast is-visible is-${type}`;
  window.clearTimeout(showToast.timer);
  showToast.timer = window.setTimeout(() => {
    toast.className = "toast";
  }, 3200);
}

async function init() {
  bindInputs();
  bindHistoryFilters();

  const [
    overviewResult,
    evidenceResult,
    metricsResult,
    e2eResult,
    currentResult,
    minCodeResult,
  ] = await Promise.allSettled([
    getJson("/api/user/overview"),
    getJson("/outputs/competition_evidence/competition_evidence.json"),
    getJson("/outputs/competition_evidence/review_efficiency_metrics.json"),
    getJson("/outputs/competition_evidence/real_user_portal_e2e.json"),
    getJson("/outputs/current_validation/min004_current_validation.json"),
    getText("/outputs/minimized/mlir22_memref_canonicalize_current.chunk.min.mlir"),
  ]);

  state.overview = valueOrNull(overviewResult);
  state.evidence = valueOrNull(evidenceResult);
  state.metrics = valueOrNull(metricsResult);
  state.e2e = valueOrNull(e2eResult);
  state.currentValidation = valueOrNull(currentResult);

  renderRuntime(state.overview?.runtime || state.e2e?.runtime || {});
  renderProfiles(state.overview?.profiles || []);
  renderOverview();
  renderMin004(valueOrNull(minCodeResult));
  await loadHistory();
  document.body.dataset.ready = "true";
}

function valueOrNull(result) {
  return result.status === "fulfilled" ? result.value : null;
}

function reportByKey(key) {
  return (state.evidence?.reports || []).find((item) => item.key === key) || {};
}

function renderRuntime(runtime) {
  const mode = runtime.mode || (runtime.available ? "real" : "unavailable");
  const badge = $("runtimeBadge");
  badge.className = `status-chip ${runnerClass(mode)}`;
  badge.textContent = `runner: ${runnerLabel(mode)}`;

  const warning = $("runnerNotice");
  if (mode === "real") {
    warning.className = "notice";
    warning.textContent = `当前分析 runner 来源为 real：${runtime.display_name || runtime.configured || "mlir-opt"}`;
  } else if (mode === "showcase" || mode === "demo") {
    warning.className = "notice is-warning";
    warning.textContent = "当前结果仅用于展示交互流程，不构成真实工具链验证结论。";
  } else if (mode === "cached_evidence" || mode === "cached") {
    warning.className = "notice";
    warning.textContent = "当前页面正在浏览历史证据快照，不构成本轮新的真实工具链验证结论。";
  } else {
    warning.className = "notice is-warning";
    warning.textContent = "当前工具链不可用，无法执行新的真实分析；可查看仓库内已有 evidence 快照。";
  }
  updateAnalyzeButton();
}

function renderOverview() {
  const discovery22 = reportByKey("discovery_mlir22");
  const metrics = state.metrics || {};
  const categories = discovery22.run_categories || {};
  const nonSuccess = Object.entries(categories)
    .filter(([key]) => key !== "success")
    .reduce((sum, [, value]) => sum + Number(value || 0), 0);

  $("snapshotTime").textContent = state.evidence
    ? "固定快照未记录 generated_at；数据来自 outputs/competition_evidence/competition_evidence.json"
    : "未能读取固定快照";
  $("metricRuns").textContent = number(discovery22.runs || metrics.discovery_runs);
  $("metricNonSuccess").textContent = number(nonSuccess);
  $("metricClusters").textContent = number(discovery22.clusters || metrics.triage_signatures);
  $("metricP0").textContent = number(metrics.p0_candidates);

  renderReduction(discovery22, nonSuccess);
  renderCategoryChart(categories);
  renderCandidates(discovery22);
}

function renderReduction(discovery22, nonSuccess) {
  const metrics = state.metrics || {};
  const steps = [
    {
      label: "总运行",
      value: discovery22.runs || metrics.discovery_runs,
      note: "Discovery MLIR22 固定快照",
    },
    {
      label: "非成功运行",
      value: nonSuccess,
      note: "剔除 success 后进入分类解释",
    },
    {
      label: "签名候选簇",
      value: discovery22.clusters || metrics.triage_signatures,
      note: "稳定 signature 归并重复异常",
    },
    {
      label: "P0 候选",
      value: metrics.p0_candidates,
      note: "优先人工复核队列",
    },
    {
      label: "重点案例",
      value: 1,
      note: "MIN-004 完成最小化与版本复核",
    },
  ];
  $("reductionSteps").innerHTML = steps.map((step) => `
    <li>
      <span>${escapeHtml(step.label)}</span>
      <strong>${number(step.value)}</strong>
      <small>${escapeHtml(step.note)}</small>
    </li>
  `).join("");
}

function renderCategoryChart(categories) {
  const entries = Object.entries(categories || {}).sort((a, b) => Number(b[1]) - Number(a[1]));
  const max = Math.max(...entries.map(([, value]) => Number(value)), 1);
  $("categoryChart").innerHTML = entries.map(([key, value]) => `
    <div class="bar-row">
      <span class="bar-label">${escapeHtml(CATEGORY_LABELS[key] || key)}</span>
      <span class="bar-track" aria-hidden="true">
        <span class="bar-fill ${categoryClass(key)} ${widthClass(Number(value), max)}"></span>
      </span>
      <span class="bar-value">${number(value)}</span>
    </div>
  `).join("");
}

function renderCandidates(discovery22) {
  const e2e = state.e2e || {};
  const primary = e2e.primary_job || {};
  const current = reportByKey("current_issues_mlir23");
  const issues = reportByKey("issues");
  const rows = [
    {
      id: "MIN-004",
      source: "LLVM official memref canonicalize seed",
      risk: "P0",
      category: "memory/assertion; version differential",
      pipeline: "canonicalize / cse / sccp combinations",
      version: "MLIR 22.1.8; MLIR 23 dev 未复现",
      status: primary.memory_assertion_runs ? `${primary.memory_assertion_runs}/${primary.run_count} real E2E hard failure` : "已有最小复现与当前验证",
      link: "#case-min004",
      linkText: "查看案例",
    },
    {
      id: "DISC-MLIR22",
      source: "outputs/discovery_mlir22/report.json",
      risk: "P0/P1",
      category: `${number(discovery22.clusters)} clusters; ${number(discovery22.ir_deltas)} IR deltas`,
      pipeline: "9 discovery pipelines",
      version: "MLIR 22 historical evidence",
      status: `${number(discovery22.issues)} issues in fixed snapshot`,
      link: "/outputs/discovery_mlir22/report.md",
      linkText: "report.md",
    },
    {
      id: "ISSUE-REPROS",
      source: "真实 LLVM issue seed",
      risk: "P1",
      category: `${number(issues.issues)} issues; ${number(issues.clusters)} clusters`,
      pipeline: "10 issue repro pipelines",
      version: "project issue repro suite",
      status: "历史 issue 复核集合",
      link: "/outputs/issues/report.md",
      linkText: "report.md",
    },
    {
      id: "MLIR23-CURRENT",
      source: "outputs/current_issues_mlir23/report.json",
      risk: "P0",
      category: current.run_categories ? "memory/assertion + success divergence" : "current validation",
      pipeline: `${number(current.pipelines)} current pipelines`,
      version: "MLIR 23 development snapshot",
      status: `${number(current.issues)} current issue candidate`,
      link: "/outputs/current_issues_mlir23/report.md",
      linkText: "report.md",
    },
  ];

  $("candidateRows").innerHTML = rows.map((row) => `
    <tr>
      <td><strong>${escapeHtml(row.id)}</strong></td>
      <td>${escapeHtml(row.source)}</td>
      <td><span class="status-chip ${row.risk === "P0" ? "is-p0" : "is-p1"}">${escapeHtml(row.risk)}</span></td>
      <td>${escapeHtml(row.category)}</td>
      <td>${escapeHtml(row.pipeline)}</td>
      <td>${escapeHtml(row.version)}</td>
      <td>${escapeHtml(row.status)}</td>
      <td><a class="text-link" href="${escapeHtml(row.link)}">${escapeHtml(row.linkText)}</a></td>
    </tr>
  `).join("");
}

function renderProfiles(profiles) {
  state.profiles = profiles;
  if (!profiles.some((profile) => profile.id === state.profile)) {
    state.profile = profiles[0]?.id || "quick";
  }
  $("profileList").innerHTML = profiles.map((profile) => {
    const selected = profile.id === state.profile;
    return `
      <button class="profile-option ${selected ? "is-selected" : ""}" type="button" role="radio" aria-checked="${selected}" data-profile="${escapeHtml(profile.id)}">
        <span>
          <strong>${escapeHtml(profile.name)}</strong>
          <small>${escapeHtml(profile.description)}</small>
        </span>
        <span>${escapeHtml(profile.estimate)}</span>
      </button>
    `;
  }).join("");
  document.querySelectorAll("[data-profile]").forEach((button) => {
    button.addEventListener("click", () => {
      state.profile = button.dataset.profile;
      renderProfiles(state.profiles);
    });
  });
}

function bindInputs() {
  $("fileTab").addEventListener("click", () => setInputMode("file"));
  $("pasteTab").addEventListener("click", () => setInputMode("paste"));
  $("fileInput").addEventListener("change", (event) => loadFile(event.target.files?.[0]));
  $("codeInput").addEventListener("input", (event) => {
    setContent(event.target.value, state.fileName, false);
  });
  $("clearInputButton").addEventListener("click", clearContent);
  $("loadExampleButton").addEventListener("click", () => {
    const example = state.overview?.example || {};
    setContent(example.content || "module {\n  func.func @main() {\n    return\n  }\n}\n", example.filename || "basic_example.mlir");
    setInputMode("paste");
  });
  $("analyzeButton").addEventListener("click", submitAnalysis);

  const dropzone = $("dropzone");
  dropzone.addEventListener("dragover", (event) => {
    event.preventDefault();
    dropzone.classList.add("is-dragging");
  });
  dropzone.addEventListener("dragleave", () => dropzone.classList.remove("is-dragging"));
  dropzone.addEventListener("drop", (event) => {
    event.preventDefault();
    dropzone.classList.remove("is-dragging");
    loadFile(event.dataTransfer.files?.[0]);
  });
}

function setInputMode(mode) {
  state.inputMode = mode;
  const fileMode = mode === "file";
  $("fileTab").classList.toggle("is-active", fileMode);
  $("pasteTab").classList.toggle("is-active", !fileMode);
  $("fileTab").setAttribute("aria-selected", String(fileMode));
  $("pasteTab").setAttribute("aria-selected", String(!fileMode));
  $("filePane").classList.toggle("is-hidden", !fileMode);
  $("pastePane").classList.toggle("is-hidden", fileMode);
}

async function loadFile(file) {
  if (!file) return;
  if (file.size > MAX_INPUT_BYTES) {
    showToast("单个输入文件不能超过 512 KB。", "error");
    return;
  }
  const lower = file.name.toLowerCase();
  if (!lower.endsWith(".mlir") && file.type && !file.type.startsWith("text/")) {
    showToast("请上传 .mlir 文件或纯文本文件。", "error");
    return;
  }
  setContent(await file.text(), file.name);
  showToast("文件已载入。");
}

function setContent(content, fileName = "untitled.mlir", syncTextarea = true) {
  state.content = String(content || "");
  state.fileName = fileName || "untitled.mlir";
  $("inputSize").textContent = bytes(new Blob([state.content]).size);
  $("fileInfo").textContent = state.content ? `${state.fileName} · ${$("inputSize").textContent}` : "尚未选择文件";
  if (syncTextarea) $("codeInput").value = state.content;
  updateAnalyzeButton();
}

function clearContent() {
  state.content = "";
  state.fileName = "untitled.mlir";
  $("codeInput").value = "";
  $("fileInput").value = "";
  $("inputSize").textContent = "0 B";
  $("fileInfo").textContent = "尚未选择文件";
  updateAnalyzeButton();
}

function updateAnalyzeButton() {
  const runtime = state.overview?.runtime || {};
  const canRun = Boolean(runtime.available) && state.content.trim().length > 0;
  $("analyzeButton").disabled = !canRun;
}

function setStages(activeIndex) {
  [...$("jobStages").children].forEach((item, index) => {
    item.classList.toggle("is-done", index < activeIndex);
    item.classList.toggle("is-active", index === activeIndex);
  });
}

async function submitAnalysis() {
  if (!state.content.trim()) return;
  const runtime = state.overview?.runtime || {};
  $("analyzeButton").disabled = true;
  $("analyzeButton").textContent = "正在分析";
  setStages(1);
  try {
    const response = await fetch("/api/user/analyze", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        content: state.content,
        filename: state.fileName,
        profile: state.profile,
      }),
    });
    const payload = await response.json();
    if (!response.ok || payload.ok === false) {
      throw new Error(payload.error || "分析失败");
    }
    setStages(4);
    renderAnalysisResult(payload, runtime);
    await loadHistory();
    showToast("分析完成，已生成历史记录。");
  } catch (error) {
    setStages(0);
    showToast(error.message || "分析失败", "error");
  } finally {
    $("analyzeButton").textContent = "开始分析";
    updateAnalyzeButton();
  }
}

function renderAnalysisResult(data, runtime) {
  const mode = data.runtime?.mode || runtime.mode || "unavailable";
  $("resultEmpty").classList.add("is-hidden");
  $("resultContent").classList.remove("is-hidden");
  $("resultRunner").className = `status-chip ${runnerClass(mode)}`;
  $("resultRunner").textContent = `runner: ${runnerLabel(mode)}`;
  $("resultKicker").textContent = data.summary?.kicker || "分析完成";
  $("resultHeadline").textContent = data.summary?.title || "已生成检测结论";
  $("resultMeta").innerHTML = `
    <span class="category-chip is-profile">profile: ${escapeHtml(data.profile_name || data.profile || "unknown")}</span>
    <span class="category-chip is-profile">${number(data.run_count || data.runs?.length || 0)} 条 pipeline</span>
  `;
  $("resultDescription").textContent = data.summary?.description || "";
  $("resultReportLink").href = data.report_url || "#";
  $("resultCategories").innerHTML = (data.summary?.categories || []).map((item) => `
    <span class="category-chip ${item.key === "attention" ? "is-attention" : item.key === "success" ? "is-success" : "is-review"}">
      ${escapeHtml(item.label)} · ${number(item.count)}
    </span>
  `).join("");
  $("resultRunRows").innerHTML = (data.runs || []).map((run) => `
    <tr>
      <td>${escapeHtml(run.pipeline)}</td>
      <td><span class="category-chip ${run.category_key === "attention" ? "is-attention" : run.category_key === "success" ? "is-success" : "is-review"}">${escapeHtml(run.category_label || run.category)}</span></td>
      <td>${escapeHtml(run.elapsed_ms)} ms</td>
      <td>${escapeHtml(run.short_message || "")}</td>
    </tr>
  `).join("");
}

function renderMin004(minCode) {
  const current = state.currentValidation || {};
  const e2e = state.e2e || {};
  const primary = e2e.primary_job || {};
  const metrics = state.metrics || {};

  $("mlir23Status").textContent = current.classification
    ? `${current.classification}; return code ${current.return_code}`
    : "outputs/current_validation 当前验证未读取";
  $("min004E2E").textContent = primary.memory_assertion_runs
    ? `${primary.memory_assertion_runs}/${primary.run_count} pipelines 为 memory/assertion，runner=${e2e.runtime?.mode || "unknown"}`
    : "未读取 real_user_portal_e2e.json";
  $("lineReduction").textContent = metrics.min004_line_reduction
    ? `行数缩减 ${metrics.min004_line_reduction}%：从 ${metrics.min004_original_lines} 行到 ${metrics.min004_minimized_lines} 行。`
    : "行数缩减来自固定 evidence 快照：约 1236 行到 8 行。";
  $("min004Code").textContent = minCode || "未能读取最小复现文件。";

  renderVersionMatrix();
  renderEvidenceRows(primary);
}

function renderVersionMatrix() {
  const rows = [
    ["版本 / 状态", "parse / compatibility", "canonicalize chain", "证据定位"],
    ["MLIR 15", "parser / attribute incompatibility", "未进入同一路径", "版本兼容性边界"],
    ["MLIR 22", "parse_verify success", "memory/assertion hard failure", "历史版本差分重点案例"],
    ["MLIR 23 dev", "return code 0", "resolved-or-not-reproduced", "当前验证产物"],
  ];
  $("versionMatrix").innerHTML = rows.map((row, rowIndex) => `
    <div class="matrix-row">
      ${row.map((cell) => {
        const klass = rowIndex === 0
          ? "is-header"
          : cell.includes("memory/assertion")
            ? "is-attention"
            : cell.includes("parser") || cell.includes("未进入")
              ? "is-review"
              : cell.includes("return code") || cell.includes("success") || cell.includes("resolved")
                ? "is-success"
                : "";
        return `<span class="matrix-cell ${klass}">${escapeHtml(cell)}</span>`;
      }).join("")}
    </div>
  `).join("");
}

function renderEvidenceRows(primary) {
  const rows = [
    ["最小复现", "outputs/minimized/mlir22_memref_canonicalize_current.chunk.min.mlir", "8 行 MLIR 复现文件", "/outputs/minimized/mlir22_memref_canonicalize_current.chunk.min.mlir"],
    ["当前版本验证", "outputs/current_validation/min004_current_validation.md", "MLIR 23 development snapshot 未复现 hard failure", "/outputs/current_validation/min004_current_validation.md"],
    ["项目说明", "docs/project_overview.md", "框架目标、运行入口和模块概览", "/docs/project_overview.md"],
    ["真实门户 E2E", "outputs/competition_evidence/real_user_portal_e2e.json", "deep profile 下 9 条 pipeline 中 5 次 memory/assertion", "/outputs/competition_evidence/real_user_portal_e2e.json"],
  ];
  if (primary.report_url) {
    rows.push(["HTML 报告", primary.id, "真实用户门户 job 的完整技术报告", primary.report_url]);
  }
  $("evidenceRows").innerHTML = rows.map((row) => `
    <tr>
      <td><strong>${escapeHtml(row[0])}</strong></td>
      <td>${escapeHtml(row[1])}</td>
      <td>${escapeHtml(row[2])}</td>
      <td><a class="text-link" href="${escapeHtml(row[3])}" target="_blank" rel="noreferrer">打开</a></td>
    </tr>
  `).join("");
}

function bindHistoryFilters() {
  $("runnerFilter").addEventListener("change", renderHistory);
  $("statusFilter").addEventListener("change", renderHistory);
  $("refreshHistoryButton").addEventListener("click", loadHistory);
}

async function loadHistory() {
  try {
    const payload = await getJson("/api/user/history");
    state.history = (payload.items || []).map(augmentHistoryItem);
  } catch {
    state.history = [];
  }
  renderHistory();
}

function augmentHistoryItem(item) {
  const e2eIds = new Map();
  if (state.e2e?.primary_job?.id) e2eIds.set(state.e2e.primary_job.id, state.e2e.primary_job);
  (state.e2e?.repeated_exception_jobs || []).forEach((job) => e2eIds.set(job.id, job));
  const e2eJob = e2eIds.get(item.id);
  const inferredMode = item.runtime_mode || (e2eJob ? "real" : "cached_evidence");
  const detail = item.runtime_detail || (e2eJob
    ? state.e2e.runtime?.display_name || "real runner cached E2E"
    : "历史元数据未保存 runner 来源");
  return {
    ...item,
    runtime_mode: inferredMode,
    runtime_detail: detail,
    report_url: item.report_url || e2eJob?.report_url || `/api/user/job?id=${encodeURIComponent(item.id)}`,
  };
}

function renderHistory() {
  const runnerFilter = $("runnerFilter").value;
  const statusFilter = $("statusFilter").value;
  const rows = state.history.filter((item) => {
    const mode = runnerLabel(item.runtime_mode);
    const statusOk = statusFilter === "all" || item.status === statusFilter;
    const runnerOk = runnerFilter === "all" || mode === runnerFilter;
    return statusOk && runnerOk;
  });
  $("historyCount").textContent = `${rows.length} 条`;
  $("historyEmpty").classList.toggle("is-hidden", rows.length > 0);
  $("historyRows").innerHTML = rows.map((item) => {
    const mode = runnerLabel(item.runtime_mode);
    const evidenceLink = item.report_url?.startsWith("/outputs/")
      ? item.report_url
      : `/api/user/job?id=${encodeURIComponent(item.id)}`;
    return `
      <tr>
        <td>${escapeHtml(shortDate(item.created_at))}</td>
        <td><strong>${escapeHtml(item.id)}</strong></td>
        <td>${escapeHtml(item.filename)}</td>
        <td>${escapeHtml(item.profile_name || item.profile)}</td>
        <td><span class="status-chip ${runnerClass(mode)}">${mode}</span></td>
        <td><span class="status-chip ${statusClass(item.status)}">${escapeHtml(item.status || "review")}</span><br><small>${escapeHtml(item.title || "")}</small></td>
        <td>${escapeHtml(item.runtime_detail || "")}</td>
        <td><a class="text-link" href="${escapeHtml(evidenceLink)}" target="_blank" rel="noreferrer">查看证据</a></td>
      </tr>
    `;
  }).join("");
}

window.addEventListener("DOMContentLoaded", () => {
  init().catch((error) => {
    showToast(error.message || "页面初始化失败", "error");
    document.body.dataset.ready = "error";
  });
});
