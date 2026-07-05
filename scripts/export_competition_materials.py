from __future__ import annotations

import json
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DOCS = ROOT / "docs"
MATERIALS = ROOT / "outputs" / "materials"
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from mlirdiff.cases import build_issue_cases


def main() -> int:
    DOCS.mkdir(parents=True, exist_ok=True)
    MATERIALS.mkdir(parents=True, exist_ok=True)
    status = project_status()
    reports = {name: load_report(name) for name in ["demo", "latest", "issues", "discovery", "discovery_mlir22"]}
    version_diff = read_json(ROOT / "outputs" / "version_diff" / "report.json")
    cases = build_issue_cases(ROOT / "outputs" / "issues" / "report.json", ROOT / "data" / "seed_sources.json", ROOT)
    minimized = minimized_repros()

    write("比赛技术报告.md", technical_report(status, reports, cases, minimized, version_diff))
    write("典型案例库.md", case_library(cases))
    write("威胁模型.md", threat_model())
    write("演示脚本.md", demo_script(status, reports, cases, minimized))
    write("答辩PPT大纲.md", ppt_outline(status, reports, cases, minimized))
    (MATERIALS / "答辩材料索引.md").write_text(material_index(), encoding="utf-8")
    print("competition materials exported")
    return 0


def project_status() -> dict:
    seeds = list((ROOT / "seeds").glob("**/*.mlir"))
    source_index = read_json(ROOT / "data" / "seed_sources.json")
    origins: dict[str, int] = {}
    groups: dict[str, int] = {}
    for seed in seeds:
        rel = seed.relative_to(ROOT / "seeds")
        key = str(Path("seeds") / rel).replace("\\", "/")
        origin = source_index.get(key, {}).get("origin", "unknown")
        origins[origin] = origins.get(origin, 0) + 1
        group = rel.parts[0] if len(rel.parts) > 1 else "root"
        groups[group] = groups.get(group, 0) + 1
    return {"seed_count": len(seeds), "seed_origins": dict(sorted(origins.items())), "seed_groups": dict(sorted(groups.items()))}


def load_report(name: str) -> dict:
    path = ROOT / "outputs" / name / "report.json"
    return read_json(path) if path.exists() else {"seeds": [], "pipelines": [], "runs": [], "issues": [], "summary": {}}


def minimized_repros() -> list[dict]:
    root = ROOT / "outputs" / "minimized"
    rows = []
    for path in sorted(root.glob("*.mlir")) if root.exists() else []:
        text = path.read_text(encoding="utf-8")
        rows.append({"name": path.name, "lines": len(text.splitlines()), "size": path.stat().st_size})
    return rows


def technical_report(status: dict, reports: dict[str, dict], cases: list[dict], minimized: list[dict], version_diff: dict) -> str:
    issues = reports["issues"]
    discovery = reports["discovery"]
    return f"""# 面向 MLIR 编译基础设施的差分一致性与安全验证系统

## 摘要

本项目构建了一个面向 MLIR pass pipeline 的自动化安全验证框架。系统以真实 MLIR seed 为输入，批量调度多条 pass pipeline，采集 stdout、stderr、return code、耗时和运行产物，并对 parser、verifier、dialect registration、type legality、assertion/crash、timeout、pipeline divergence 和 output mismatch 等现象进行分类、聚类与可视化展示。

项目当前已经从“复现和归类”推进到“发现、复核、最小化新问题候选”：通过 Discovery 模式对全量 seed 执行 stress pipeline，生成 P0/P1/P2 候选；对 P0 crash 候选执行 delta debugging 最小化，沉淀可用于上游报告和比赛答辩的最小复现。

## 数据集

- Seed 总数：{status["seed_count"]}
- LLVM 官方 seed：{status["seed_origins"].get("official", 0)}
- 真实 LLVM issue seed：{status["seed_origins"].get("issue", 0)}
- 本地 generated/demo seed：{status["seed_origins"].get("generated", 0)}

真实样例来源记录在 `data/seed_sources.json`，主要来自 LLVM 官方 `mlir/test` 和 LLVM GitHub issue。

## 系统架构

```text
Seed Library
  -> Pipeline Scheduler
  -> Native/VM mlir-opt Runner
  -> Result Classifier
  -> Differential Analyzer
  -> Failure Clustering
  -> Discovery Triage
  -> Seed Minimizer
  -> Reports / Web UI
```

## 实验结果

| 报告 | Seeds | Pipelines | Runs | Issues | Failure clusters |
| --- | ---: | ---: | ---: | ---: | ---: |
| Demo | {count(reports["demo"], "seeds")} | {count(reports["demo"], "pipelines")} | {count(reports["demo"], "runs")} | {count(reports["demo"], "issues")} | {cluster_count(reports["demo"])} |
| Mock Baseline | {count(reports["latest"], "seeds")} | {count(reports["latest"], "pipelines")} | {count(reports["latest"], "runs")} | {count(reports["latest"], "issues")} | {cluster_count(reports["latest"])} |
| Issue Repros | {count(issues, "seeds")} | {count(issues, "pipelines")} | {count(issues, "runs")} | {count(issues, "issues")} | {cluster_count(issues)} |
| Discovery | {count(discovery, "seeds")} | {count(discovery, "pipelines")} | {count(discovery, "runs")} | {count(discovery, "issues")} | {cluster_count(discovery)} |
| Discovery MLIR22 | {count(reports["discovery_mlir22"], "seeds")} | {count(reports["discovery_mlir22"], "pipelines")} | {count(reports["discovery_mlir22"], "runs")} | {count(reports["discovery_mlir22"], "issues")} | {cluster_count(reports["discovery_mlir22"])} |

Issue Repros 当前包含 {len(cases)} 个真实 LLVM issue 案例；Discovery 生成的新问题候选见 `docs/新问题候选.md`，P0 复核见 `docs/P0候选复核报告.md`。

## 最小化复现成果

| 文件 | 行数 | 大小 |
| --- | ---: | ---: |
{table_rows(minimized, ["name", "lines", "size"])}

这些文件位于 `outputs/minimized/`，用于展示“发现 -> 复核 -> 最小化 -> 影响分析”的完整闭环。

其中 `mlir22_memref_canonicalize_current.chunk.min.mlir` 是当前最关键成果：它由 MLIR 22 Discovery 发现，已从官方 memref canonicalize seed 最小化到 8 行，并在 `mlir-opt-22 --canonicalize --cse --sccp --canonicalize` 下稳定触发 hard failure。

## 版本差分实验

当前已在 VM 中安装 `mlir-opt-15` 与 `mlir-opt-22`，并对 3 个最小化复现进行版本差分。

| Case | Status |
| --- | --- |
{version_rows(version_diff)}

## 创新点

1. 将 MLIR pass pipeline 作为安全验证对象，而不是只做语法检查。
2. 结合 LLVM 官方测试、真实 GitHub issue 和本地 discovery stress pipeline，减少人工构造样例偏差。
3. 用多 pipeline 差分检测发现同一 seed 下的成功/失败分歧、崩溃和输出不一致。
4. 用 failure signature 聚类减少重复日志，提高根因分析效率。
5. 加入 P0/P1/P2 候选复核和 seed minimizer，使系统具备发现新问题后的证据沉淀能力。
6. 提供 Web 展示台，把运行环境、seed 来源、failure clusters、case library 和 minimized repros 串成完整答辩叙事。

## 局限与下一步

- 当前真实运行主要依赖 VMware Ubuntu 中的 `mlir-opt-15`。
- 需要继续安装 LLVM/MLIR 新版本，做 MLIR 15 与新版本之间的版本差分。
- Discovery 中的 P1/P2 候选需要进一步过滤版本兼容、无效 IR 和测试文件语法噪声。
- 后续可加入结构化 IR 等价判断，减少正常优化转换造成的 output mismatch 噪声。
"""


def case_library(cases: list[dict]) -> str:
    lines = ["# 真实 Issue 典型案例库", ""]
    for item in cases:
        lines.extend([
            f"## {item['title']}",
            "",
            f"- 来源：{item['source']}",
            f"- Seed：`{item['seed']}`",
            f"- 状态：`{item['status']}`",
            f"- 类别：{', '.join(item['categories']) or 'none'}",
            f"- Signature：`{item['signature']}`",
            "",
            "### 安全影响",
            "",
            item["impact"],
            "",
            "### 复现命令",
            "",
            "```powershell",
            item["reproduce_command"],
            "```",
            "",
        ])
    return "\n".join(lines)


def threat_model() -> str:
    return """# 威胁模型

## 保护对象

- MLIR/LLVM 编译工具链稳定性。
- AI 编译、GPU 编译和异构计算构建流程可用性。
- pass pipeline 输出 IR 的一致性和可信度。
- CI/CD、模型编译服务和供应链构建任务。

## 攻击面

- 恶意或异常 MLIR 输入触发 parser/verifier/pass pipeline 异常。
- 上游依赖或第三方模型编译流程引入异常 IR。
- 不同 pipeline 对同一输入处理不一致，导致验证绕过或错误 lowering。
- 复杂输入触发 pass 高复杂度行为，形成拒绝服务。

## 风险类型

| 风险 | 检测信号 | 影响 |
| --- | --- | --- |
| 编译器崩溃 | assertion、stack dump、LLVM ERROR | 构建/编译服务拒绝服务 |
| 验证绕过 | pipeline divergence | 某些路径接受异常 IR |
| 错误转换 | output mismatch | 后续代码生成语义风险 |
| 方言注册问题 | unknown dialect、unregistered | 动态方言和 pass 前置条件不一致 |
| 类型合法性失败 | illegal type、failed to legalize | lowering 链路稳定性风险 |
| 超时 | timeout | 复杂度攻击或非终止风险 |
"""


def demo_script(status: dict, reports: dict[str, dict], cases: list[dict], minimized: list[dict]) -> str:
    return f"""# 比赛现场演示脚本

1. 打开 Web 展示台：`http://127.0.0.1:8765/`
2. 说明 seed 库：总数 {status['seed_count']}，其中官方 {status['seed_origins'].get('official', 0)}，真实 issue {status['seed_origins'].get('issue', 0)}。
3. 展示 `Issue Repros`：{count(reports['issues'], 'runs')} 次真实 VM 运行，{count(reports['issues'], 'issues')} 个 issue。
4. 展示 `Discovery`：{count(reports['discovery'], 'runs')} 次真实 VM 运行，{count(reports['discovery'], 'issues')} 个候选问题。
5. 打开 `Failure Clusters`，说明 signature 如何合并同类失败。
6. 打开 `Issue Case Library`，展示真实 LLVM issue 的来源、pipeline、stderr artifact 和影响分析。
7. 打开 `Minimized Repros`，展示 {len(minimized)} 个最小化复现文件。
8. 打开 `P0候选复核报告.md`，说明下一步如何确认新问题、排除版本兼容噪声。
"""


def ppt_outline(status: dict, reports: dict[str, dict], cases: list[dict], minimized: list[dict]) -> str:
    return f"""# 答辩 PPT 大纲

## 1. 题目
面向 MLIR Pass / Dialect 的差分一致性与安全验证系统

## 2. 背景
- MLIR 广泛用于 AI 编译、GPU 编译和异构计算。
- pass crash、验证不一致和错误 lowering 会影响构建稳定性和供应链安全。

## 3. 核心思路
Seed Library -> Pipeline Scheduler -> VM Runner -> Classifier -> Differential Analyzer -> Failure Clustering -> Discovery Triage -> Minimizer -> Web UI

## 4. 数据集
- Seed 总数：{status['seed_count']}
- LLVM 官方：{status['seed_origins'].get('official', 0)}
- 真实 issue：{status['seed_origins'].get('issue', 0)}

## 5. 实验结果
- Issue Repros：{count(reports['issues'], 'runs')} runs，{count(reports['issues'], 'issues')} issues。
- Discovery：{count(reports['discovery'], 'runs')} runs，{count(reports['discovery'], 'issues')} issues。
- 最小化复现：{len(minimized)} 个。

## 6. 典型案例
{chr(10).join(f'- {case["title"]}' for case in cases[:4])}

## 7. 深度功能
- failure signature 聚类
- 结构化 IR diff
- P0/P1/P2 discovery triage
- seed minimization
- VM toolchain runner

## 8. 创新与价值
- 从复现已知问题扩展到发现新候选。
- 从日志归类扩展到最小化复现和证据沉淀。
- 面向真实编译基础设施，而不是玩具输入。

## 9. 后续计划
- 增加 LLVM 新版本，做版本差分。
- 扩展 mlir-runner 和语义执行检测。
- 将 confirmed P0 候选整理为上游 issue 报告。
"""


def material_index() -> str:
    return """# 答辩材料索引

- `docs/比赛技术报告.md`
- `docs/典型案例库.md`
- `docs/威胁模型.md`
- `docs/演示脚本.md`
- `docs/答辩PPT大纲.md`
- `docs/新问题候选.md`
- `docs/P0候选复核报告.md`
- `docs/项目发现清单.md`
- `docs/版本差分实验.md`
- `docs/P0版本差分实验.md`
- `outputs/materials/system_architecture.svg`
- `outputs/materials/experiment_results.svg`

Web 入口：`http://127.0.0.1:8765/`
"""


def table_rows(rows: list[dict], keys: list[str]) -> str:
    if not rows:
        return "| none | 0 | 0 |"
    return "\n".join("| " + " | ".join(str(row.get(key, "")) for key in keys) + " |" for row in rows)


def version_rows(report: dict) -> str:
    rows = report.get("summary", [])
    if not rows:
        return "| none | none |"
    return "\n".join(f"| {row.get('case_id')} {row.get('title')} | `{row.get('status')}` |" for row in rows)


def count(report: dict, key: str) -> int:
    return len(report.get(key, []))


def cluster_count(report: dict) -> int:
    return len(report.get("summary", {}).get("failure_clusters", []))


def write(name: str, content: str) -> None:
    (DOCS / name).write_text(content, encoding="utf-8")


def read_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8")) if path.exists() else {}


if __name__ == "__main__":
    raise SystemExit(main())
