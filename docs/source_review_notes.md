# 源码检查说明

## 1. 项目定位

本项目是一个面向 MLIR/LLVM 编译基础设施的差分测试与安全缺陷发现系统。源码重点不在单个历史漏洞复现，而在完整的自动化发现流程：真实 seed 导入、多 pass pipeline 执行、失败分类、差分分析、failure clustering、P0/P1/P2 triage、最小化复现、版本差分和 Web 展示。

## 2. 目录结构

| 路径 | 作用 |
| --- | --- |
| `mlirdiff/` | 核心检测框架，包括执行引擎、分类器、差分分析、报告生成、案例库构建。 |
| `scripts/` | 数据导入、VM runner、Discovery triage、最小化、版本差分、自检和提交包构建脚本。 |
| `configs/` | pass pipeline、版本差分案例和工具链配置。 |
| `seeds/` | MLIR seed 库，包括官方测试、真实 issue 复现和本地 demo seed。 |
| `data/seed_sources.json` | seed 来源索引，用于标记官方、issue、generated 来源。 |
| `outputs/` | 已生成的实验报告、运行产物、最小化复现和图表。 |
| `web/` | 本地 Web 展示台。 |
| `docs/` | 项目说明、案例报告、源码检查说明和应用价值文档。 |

## 3. 核心模块

### 3.1 执行引擎

文件：`mlirdiff/engine.py`

职责：

- 枚举 seed 和 pipeline。
- 调用 mock runner、本地 `mlir-opt` 或 SSH runner。
- 采集 stdout、stderr、return code、耗时和超时状态。
- 将每次运行产物落盘，供报告和网页展示。

### 3.2 失败分类

文件：`mlirdiff/classifier.py`

职责：

- 将 stderr/stdout 分类为 parser、verifier、dialect registration、type legality、assertion/crash、timeout、unknown failure 等。
- 避免仅因为 IR 文本中出现 `crash` 等普通字符串而误判。
- 为后续 issue 生成和聚类提供稳定类别。

### 3.3 差分分析

文件：`mlirdiff/diffing.py`

职责：

- 比较同一 seed 在不同 pipeline 下的成功/失败分歧。
- 将成功 pipeline 之间的 IR 文本差异作为分析信号记录。
- IR delta 不直接计入安全 issue，避免把正常优化变化误判为漏洞。

### 3.4 结构化 IR 统计

文件：`mlirdiff/ir_stats.py`

职责：

- 统计 operation、function、dialect、type 等结构化信息。
- 对 output delta 提供更可读的差异摘要。

### 3.5 后置不变量检查

文件：`mlirdiff/invariants.py`

职责：

- 对成功 lowering 后的 IR 做残留高层 dialect 检查。
- 用于发现 pipeline 声称完成 lowering 但仍残留异常结构的情况。

### 3.6 报告生成

文件：`mlirdiff/report.py`

职责：

- 输出 JSON、Markdown、HTML 报告。
- 汇总 issue、severity、failure cluster、invariant finding、IR delta。

### 3.7 案例库

文件：`mlirdiff/cases.py`

职责：

- 将真实 LLVM issue seed 与实际运行结果关联。
- 生成网页中的 Issue Case Library。

## 4. 关键脚本

| 脚本 | 作用 |
| --- | --- |
| `scripts/import_official_seeds.py` | 导入 LLVM 官方 seed，并记录来源。 |
| `scripts/ssh_mlir_opt.py` | 通过 SSH 将 seed 送入 VM 中的 `mlir-opt`。 |
| `scripts/triage_discovery.py` | 对 Discovery 结果做 P0/P1/P2 排序。 |
| `scripts/qualify_discovery.py` | 生成 P0 候选复核报告。 |
| `scripts/minimize_seed.py` | 行级 delta minimization。 |
| `scripts/minimize_mlir_chunks.py` | 函数/块级进一步最小化。 |
| `scripts/run_version_diff.py` | 执行 MLIR 15 vs MLIR 22 版本差分。 |
| `scripts/final_check.py` | 参赛前最终自检。 |
| `scripts/build_release.py` | 生成可执行展示包。 |

## 5. 运行入口

启动 Web 展示台：

```powershell
.\启动展示台.ps1
```

或手动运行：

```powershell
python web/server.py 8765
```

打开：

```text
http://127.0.0.1:8765/
```

最终自检：

```powershell
python scripts\final_check.py --web http://127.0.0.1:8765
```

构建展示包：

```powershell
python scripts\build_release.py --zip
```

## 6. 重点检查点

如果评委现场检查源码，建议按以下顺序说明：

1. `mlirdiff/engine.py`：如何批量运行 seed 与 pipeline。
2. `mlirdiff/classifier.py`：如何把 stderr/stdout 归类为安全相关失败。
3. `mlirdiff/diffing.py`：如何识别 pipeline divergence 和 IR delta。
4. `scripts/minimize_seed.py`：如何把 crash seed 最小化。
5. `configs/version_diff_cases.json`：MIN-004 的版本差分配置。
6. `outputs/minimized/mlir22_memref_canonicalize_current.chunk.min.mlir`：8 行核心复现。
7. `web/server.py` 和 `web/app.js`：如何把实验结果可视化展示。

## 7. 原创性边界

原创部分：

- 差分测试框架设计和实现。
- pipeline 批量调度、分类、聚类、报告生成。
- Discovery triage、最小化、版本差分流程。
- Web 展示台和比赛包装材料。

引用/导入部分：

- LLVM 官方 MLIR 测试 seed。
- 真实 LLVM GitHub issue 中的复现样例。

所有导入样例均在 `data/seed_sources.json` 和相关文档中记录来源，不作为原创代码声明。
