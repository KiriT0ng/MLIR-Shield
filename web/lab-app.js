const state = {
  activeReport: "issues",
};

const $ = (id) => document.getElementById(id);

async function getJson(url, options) {
  const response = await fetch(url, options);
  const payload = await response.json();
  if (!response.ok || payload.ok === false) {
    throw new Error(payload.error || `Request failed: ${response.status}`);
  }
  return payload;
}

function rowsFromMap(map, emptyLabel) {
  const entries = Object.entries(map || {});
  if (!entries.length) {
    return `<tr><td>${emptyLabel}</td><td>0</td></tr>`;
  }
  return entries.map(([name, count]) => `<tr><td>${escapeHtml(name)}</td><td>${count}</td></tr>`).join("");
}

function escapeHtml(value) {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

async function refreshStatus() {
  const status = await getJson("/api/status");
  const toolchain = await getJson("/api/toolchain");
  const catalog = await getJson("/api/seeds");
  const environments = await getJson("/api/environments");
  const cases = await getJson("/api/cases");
  const minimized = await getJson("/api/minimized");

  $("seedCount").textContent = status.seed_count;
  const realSeeds = (status.seed_origins.official || 0) + (status.seed_origins.issue || 0);
  $("realSeedCount").textContent = realSeeds;
  $("seedGroups").innerHTML = Object.entries(status.seed_groups)
    .map(([name, count]) => `<span class="tag">${escapeHtml(name)} <strong>${count}</strong></span>`)
    .join("");
  $("configRows").innerHTML = status.configs
    .map((item) => `<tr><td>${escapeHtml(item.name)}</td><td>${item.pipelines}</td></tr>`)
    .join("");
  $("originRows").innerHTML = rowsFromMap(status.seed_origins, "unknown");
  renderToolchain(toolchain);
  renderEnvironments(environments.environments || []);
  renderSeedCatalog(catalog.seeds || []);
  renderCases(cases.cases || []);
  renderMinimized(minimized.repros || []);
}

function renderToolchain(toolchain) {
  $("toolchainBadge").textContent = toolchain.available ? "Available" : "Missing";
  $("toolchainRows").innerHTML = `
    <tr><th>Configured</th><td>${escapeHtml(toolchain.configured)}</td></tr>
    <tr><th>Resolved</th><td>${escapeHtml(toolchain.resolved || "not found")}</td></tr>
    <tr><th>Version / Error</th><td><pre class="inline-pre">${escapeHtml(toolchain.version || toolchain.error || "none")}</pre></td></tr>
  `;
}

function renderEnvironments(environments) {
  $("environmentRows").innerHTML = environments.map((env) => `
    <tr>
      <td>${escapeHtml(env.name)}</td>
      <td><code>${escapeHtml(env.tool)}</code></td>
      <td>${escapeHtml(env.status)}</td>
      <td>${escapeHtml(env.detail)}</td>
    </tr>
  `).join("");
}

async function loadReport(name) {
  const report = await getJson(`/api/report?name=${encodeURIComponent(name)}`);
  state.activeReport = name;
  $("activeReport").textContent = name;
  setReportButtons(name);
  if (!report.exists) {
    $("runCount").textContent = "0";
    $("issueCount").textContent = "0";
    $("htmlReport").removeAttribute("href");
    $("issues").innerHTML = `<p class="empty">No ${escapeHtml(name)} report has been generated yet.</p>`;
    $("severityRows").innerHTML = rowsFromMap({}, "none");
    $("issueKindRows").innerHTML = rowsFromMap({}, "none");
    $("categoryRows").innerHTML = rowsFromMap({}, "none");
    renderClusters([]);
    renderInvariants([]);
    $("reportNote").textContent = reportNote(name, null);
    return;
  }

  $("runCount").textContent = report.runs;
  $("issueCount").textContent = report.issues.length;
  $("htmlReport").href = report.html_url;
  $("severityRows").innerHTML = rowsFromMap(report.summary.issue_severities, "none");
  $("issueKindRows").innerHTML = rowsFromMap(report.summary.issue_kinds, "none");
  $("categoryRows").innerHTML = rowsFromMap(report.summary.run_categories, "none");
  $("issues").innerHTML = renderIssues(report.issues);
  renderClusters(report.summary.failure_clusters || []);
  renderInvariants(report.summary.invariant_findings || []);
  $("reportNote").textContent = reportNote(name, report);
}

function renderIssues(issues) {
  if (!issues.length) {
    return `<p class="empty">This report was generated successfully, and it has 0 findings. Open the full HTML report to inspect all runs and artifacts.</p>`;
  }
  return issues.map((issue) => `
    <article class="issue ${escapeHtml(issue.severity)}">
      <div>
        <strong>[${escapeHtml(issue.severity)}] ${escapeHtml(issue.kind)}</strong>
        <span>${escapeHtml(issue.origin || "unknown")} / ${escapeHtml(issue.seed)}</span>
      </div>
      <p>${escapeHtml(issue.summary)}</p>
      ${issue.source ? `<p><a href="${escapeHtml(issue.source)}" target="_blank" rel="noreferrer">Source</a></p>` : ""}
      <pre>${escapeHtml(issue.details)}</pre>
    </article>
  `).join("");
}

function renderClusters(clusters) {
  $("clusterCount").textContent = `${clusters.length} clusters`;
  if (!clusters.length) {
    $("clusters").innerHTML = `<p class="empty">No failure clusters in this report.</p>`;
    return;
  }
  $("clusters").innerHTML = clusters.map((cluster) => `
    <article class="cluster">
      <div>
        <strong>${escapeHtml(cluster.signature)}</strong>
        <span>${cluster.count} runs / ${cluster.seed_count} seeds / ${cluster.pipeline_count} pipelines</span>
      </div>
      <p>${escapeHtml(cluster.category)}</p>
      <p class="muted-line">${escapeHtml((cluster.seeds || []).join(", "))}</p>
      <pre>${escapeHtml(cluster.example || "")}</pre>
    </article>
  `).join("");
}

function renderInvariants(findings) {
  if (!$("invariants")) {
    return;
  }
  $("invariantCount").textContent = `${findings.length} checks`;
  if (!findings.length) {
    $("invariants").innerHTML = `<p class="empty">No post-lowering invariant findings in this report.</p>`;
    return;
  }
  $("invariants").innerHTML = findings.slice(0, 20).map((finding) => `
    <article class="cluster">
      <div>
        <strong>${escapeHtml(finding.kind)}</strong>
        <span>${escapeHtml(finding.severity)} / ${escapeHtml(finding.pipeline)}</span>
      </div>
      <p>${escapeHtml(finding.summary)}</p>
      <p class="muted-line">${escapeHtml(finding.seed)}</p>
      <pre>${escapeHtml(finding.evidence || "")}</pre>
    </article>
  `).join("");
}

function renderCases(cases) {
  $("caseCount").textContent = `${cases.length} cases`;
  if (!cases.length) {
    $("cases").innerHTML = `<p class="empty">No issue cases have been generated yet.</p>`;
    return;
  }
  $("cases").innerHTML = cases.map((item) => `
    <details class="case-card" ${item.status === "pipeline-divergence" ? "open" : ""}>
      <summary>
        <strong>${escapeHtml(item.title)}</strong>
        <span>${escapeHtml(item.status)} / ${escapeHtml((item.categories || []).join(", ") || "none")}</span>
      </summary>
      <p>${escapeHtml(item.summary)}</p>
      <p class="muted-line">${escapeHtml(item.impact)}</p>
      <div class="case-links">
        ${item.source ? `<a href="${escapeHtml(item.source)}" target="_blank" rel="noreferrer">LLVM Issue</a>` : ""}
        <button type="button" class="copy-command" data-command="${escapeHtml(item.reproduce_command || "")}">Copy Repro Command</button>
      </div>
      <pre>${escapeHtml(item.reproduce_command || "")}</pre>
      <div class="table-wrap compact">
        <table>
          <thead><tr><th>Pipeline</th><th>Category</th><th>Return</th><th>Time</th><th>Artifacts</th></tr></thead>
          <tbody>
            ${(item.runs || []).map((run) => `
              <tr>
                <td>${escapeHtml(run.pipeline)}</td>
                <td>${escapeHtml(run.category)}</td>
                <td>${escapeHtml(run.return_code)}</td>
                <td>${escapeHtml(run.elapsed_ms)} ms</td>
                <td>
                  ${run.stdout_url ? `<a href="${escapeHtml(run.stdout_url)}" target="_blank" rel="noreferrer">stdout</a>` : ""}
                  ${run.stderr_url ? `<a href="${escapeHtml(run.stderr_url)}" target="_blank" rel="noreferrer">stderr</a>` : ""}
                </td>
              </tr>
            `).join("")}
          </tbody>
        </table>
      </div>
    </details>
  `).join("");
  for (const button of document.querySelectorAll(".copy-command")) {
    button.addEventListener("click", async () => {
      await navigator.clipboard.writeText(button.dataset.command || "");
      button.textContent = "Copied";
      window.setTimeout(() => {
        button.textContent = "Copy Repro Command";
      }, 1200);
    });
  }
}

function renderSeedCatalog(seeds) {
  $("seedCatalogCount").textContent = `${seeds.length} seeds`;
  $("seedCatalogRows").innerHTML = seeds.slice(0, 80).map((seed) => {
    const source = seed.source
      ? `<a href="${escapeHtml(seed.source)}" target="_blank" rel="noreferrer">${escapeHtml(sourceLabel(seed.source))}</a>`
      : "local";
    return `<tr>
      <td><code>${escapeHtml(seed.path)}</code></td>
      <td>${escapeHtml(seed.origin)}</td>
      <td>${escapeHtml(seed.group)}</td>
      <td>${source}</td>
    </tr>`;
  }).join("");
}

function renderMinimized(repros) {
  if (!$("minimized")) {
    return;
  }
  $("minimizedCount").textContent = `${repros.length} repros`;
  if (!repros.length) {
    $("minimized").innerHTML = `<p class="empty">No minimized repros have been generated yet.</p>`;
    return;
  }
  $("minimized").innerHTML = repros.map((item) => `
    <article class="cluster ${item.is_key ? "key-repro" : ""}">
      <div>
        <strong>${escapeHtml(item.id ? `${item.id} - ${item.title}` : item.name)}</strong>
        <span>${item.lines} lines / ${item.size} bytes${item.is_key ? " / key finding" : ""}</span>
      </div>
      <p>${escapeHtml(item.source || "local minimized repro")}</p>
      <p class="case-links">
        <a href="${escapeHtml(item.url)}" target="_blank" rel="noreferrer">Open minimized MLIR</a>
        ${item.id === "MIN-004" ? `<a href="/outputs/current_validation/min004_current_validation.md" target="_blank" rel="noreferrer">Open MIN-004 validation</a>` : ""}
      </p>
      ${item.command ? `<pre>${escapeHtml(item.command)}</pre>` : ""}
      <pre>${escapeHtml(item.preview || "")}</pre>
    </article>
  `).join("");
}

function sourceLabel(source) {
  try {
    const url = new URL(source);
    return `${url.hostname}${url.pathname}`;
  } catch {
    return source;
  }
}

function reportNote(name, report) {
  const labels = {
    demo: "Demo uses mocked failures to show the full detection and reporting flow.",
    latest: "Mock Baseline runs every seed through baseline pipelines; 0 findings means the baseline report was generated successfully.",
    issues: "Issue Repros focuses on curated LLVM bug reproducers and runs them through issue-specific pipelines.",
    discovery: "Discovery runs broader stress pipelines against all seeds to surface new candidate failures beyond the curated issue set.",
    discovery_mlir22: "Discovery MLIR22 runs the same stress suite against the newer LLVM/MLIR 22 toolchain.",
  };
  if (!report) {
    return labels[name] || "";
  }
  const deltas = report.summary && report.summary.output_delta_count
    ? ` ${report.summary.output_delta_count} IR deltas are tracked separately.`
    : "";
  return `${labels[name] || ""} Current report: ${report.seeds} seeds, ${report.runs} runs, ${report.issues.length} issues.${deltas}`;
}

function setReportButtons(name) {
  const map = { demo: "showDemo", latest: "showLatest", issues: "showIssues", discovery: "showDiscovery", discovery_mlir22: "showDiscovery22" };
  for (const [report, id] of Object.entries(map)) {
    $(id).classList.toggle("active", report === name);
  }
}

async function runMode(mode) {
  const payloadBody = { mode };
  if (mode === "issues" || mode === "discovery") {
    payloadBody.vm_password = $("vmPassword").value;
  }
  $("statusText").textContent = `Running ${mode}...`;
  setButtonsDisabled(true);
  try {
    const payload = await getJson("/api/run", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payloadBody),
    });
    const reportName = mode === "demo" ? "demo" : "latest";
    const selectedReport = mode === "issues" || mode === "discovery" ? mode : reportName;
    await refreshStatus();
    await loadReport(selectedReport);
    const note = payload.report.issues.length
      ? `${mode} complete: ${payload.report.issues.length} issues`
      : `${mode} complete: report generated with 0 findings`;
    $("statusText").textContent = note;
  } catch (error) {
    $("statusText").textContent = error.message;
  } finally {
    setButtonsDisabled(false);
  }
}

function setButtonsDisabled(disabled) {
  for (const id of ["demoMode", "runDemo", "runMock", "runIssues", "runDiscovery", "runReal", "vmPassword", "showDemo", "showLatest", "showIssues", "showDiscovery", "showDiscovery22"]) {
    $(id).disabled = disabled;
  }
}

async function startDemoMode() {
  await loadReport("discovery_mlir22");
  const firstTarget = document.getElementById("overview");
  if (firstTarget) {
    firstTarget.scrollIntoView({ behavior: "smooth", block: "start" });
  }
  $("statusText").textContent = "Demo mode: follow the numbered path from overview to MIN-004.";
}

function bindScrollSteps() {
  for (const button of document.querySelectorAll("[data-scroll-target]")) {
    button.addEventListener("click", () => {
      const target = document.getElementById(button.dataset.scrollTarget || "");
      if (target) {
        target.scrollIntoView({ behavior: "smooth", block: "start" });
      }
    });
  }
}

async function init() {
  $("demoMode").addEventListener("click", () => startDemoMode());
  $("runDemo").addEventListener("click", () => runMode("demo"));
  $("runMock").addEventListener("click", () => runMode("mock"));
  $("runIssues").addEventListener("click", () => runMode("issues"));
  $("runDiscovery").addEventListener("click", () => runMode("discovery"));
  $("runReal").addEventListener("click", () => runMode("real"));
  $("showDemo").addEventListener("click", () => loadReport("demo"));
  $("showLatest").addEventListener("click", () => loadReport("latest"));
  $("showIssues").addEventListener("click", () => loadReport("issues"));
  $("showDiscovery").addEventListener("click", () => loadReport("discovery"));
  $("showDiscovery22").addEventListener("click", () => loadReport("discovery_mlir22"));
  bindScrollSteps();
  await refreshStatus();
  await loadReport("issues");
}

init().catch((error) => {
  $("statusText").textContent = error.message;
});
