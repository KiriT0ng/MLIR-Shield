# 报告数据快照

- 快照目录：`outputs/competition_evidence/`
- 主快照：`outputs/competition_evidence/competition_evidence.json`
- 收敛指标：`outputs/competition_evidence/review_efficiency_metrics.json`
- 真实门户 E2E：`outputs/competition_evidence/real_user_portal_e2e.json`
- 本轮工具链探测：`outputs/toolchain_probe/real_msys2_mingw64_probe.json`
- 本轮真实运行：`outputs/real_msys2_mingw64/20260704_002907/summary.json`

## 固定口径

| 指标 | 采用值 | 来源 |
|---|---:|---|
| seed 总数 | 4822 | `competition_evidence.json / seed_summary.total` |
| 来源索引数 | 4522 | `competition_evidence.json / seed_summary.indexed` |
| Discovery MLIR22 runs | 1170 | `competition_evidence.json / discovery_mlir22.runs` |
| Discovery MLIR22 non-success | 451 | 类别分布扣除 success 719 |
| Discovery MLIR22 issues | 59 | `competition_evidence.json / discovery_mlir22.issues` |
| Discovery MLIR22 stable clusters | 61 | `competition_evidence.json / discovery_mlir22.clusters` |
| triage signatures | 92 | `review_efficiency_metrics.json / triage_signatures` |
| P0 candidates | 9 | `review_efficiency_metrics.json / p0_candidates` |
| MIN-004 原始行数 | 1236 | `review_efficiency_metrics.json` |
| MIN-004 最小行数 | 8 | `review_efficiency_metrics.json` |
| MIN-004 行数缩减 | 99.35% | `review_efficiency_metrics.json` |
| 真实工具链版本 | LLVM 22.1.8 Optimized build | `real_msys2_mingw64_probe.json` |

## MIN-004

- 来源：LLVM official memref canonicalize seed。
- 最小复现：`outputs/minimized/mlir22_memref_canonicalize_current.chunk.min.mlir`
- 本轮 real runner：通过 `MLIRSHIELD_MLIR_OPT` 或 `MLIR_OPT` 指定的 `mlir-opt`。
- pipeline：`--canonicalize --cse --sccp --canonicalize -o -`
- 分类：`memory/assertion`
- 返回码：本轮证据见 `outputs/real_msys2_mingw64/20260704_002907/summary.json`。
- 结论边界：用于说明 MLIR 22.1.8 上的真实异常与历史版本差分，不宣称最新版本漏洞或可利用性。

## 口径不一致与处理

- 固定快照记录 seed 总数为 4822；用户门户动态扫描历史记录中出现过 4825。报告统一采用 4822，因为其来自冻结 evidence bundle。
- Discovery MLIR22 的 `clusters=61` 与 review metrics 的 `triage_signatures=92` 不是同一指标。前者来自报告聚类字段，后者来自人工分诊候选签名统计；报告中分别称为“稳定簇”和“候选签名”。
- Mock baseline 38576 runs 属于 `showcase` 或负结果展示基线，不写成真实工具链漏洞发现结论。
