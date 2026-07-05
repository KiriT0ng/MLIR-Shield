# 真实 Issue 状态矩阵与复核效率

## 验证目标

项目使用公开 LLVM Issue 样例作为真实环境基准，评估系统对历史问题、环境兼容问题、pass 选项不匹配和内部异常候选的分流能力。复核材料以 seed 为单位呈现，避免只用总数描述实验结论。

## 状态矩阵

| Seed | Parse/Verify | Non-success runs | 状态 | 主要原因 |
| --- | --- | ---: | --- | --- |
| `llvm_113021_linalg_negative_indexing_tile.mlir` | success | 6 | pass option mismatch | unsupported pass option |
| `llvm_119868_linalg_fusion_multiuse_assert.mlir` | unknown failure | 10 | pass option mismatch | unsupported pass option |
| `llvm_168179_custom_stride_read_crash.mlir` | unknown failure | 10 | pass option mismatch | unsupported pass option |
| `llvm_168695_vector_scatter_tensor_canonicalize.mlir` | success | 6 | pass option mismatch | unsupported pass option |
| `llvm_60210_transform_tile_reduction_assert.mlir` | unknown failure | 10 | pass option mismatch | unsupported pass option |
| `llvm_60569_unregistered_dependent_dialect.mlir` | dialect registration | 10 | dialect dependency | unsupported pass option |
| `llvm_61085_tosa_linalg_affine_assert.mlir` | unknown failure | 10 | pass option mismatch | unsupported pass option |
| `llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | unknown failure | 10 | pass option mismatch | unsupported pass option |
| `llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | success | 6 | pass option mismatch | unsupported pass option |

## Unknown Failure 细分

| 子原因 | 数量 |
| --- | ---: |
| unsupported pass option | 45 |
| input syntax/version compatibility | 12 |
| dialect dependency missing | 4 |
| residual unknown | 4 |
| pass manager nesting mismatch | 3 |

这些结果表明，`unknown failure` 并不直接等同于安全漏洞。MLIRShield 将其继续归因到 pass 选项、输入版本、dialect 依赖和 pass manager 嵌套等可解释类别，减少人工复核时的噪声。

## 复核效率

| 指标 | 结果 |
| --- | ---: |
| 原始运行日志到签名聚类压缩率 | 92.14% |
| 原始运行日志到 P0 候选压缩率 | 99.23% |
| 签名聚类到 P0 候选压缩率 | 90.22% |
| MIN-004 最小化行数压缩率 | 99.35% |

## 证据文件

- 结构化统计：`outputs/competition_evidence/review_evidence_addendum.md`
- 状态图：`outputs/materials/issue_matrix_efficiency.png`
- 公开问题复核：`docs/MLIR23当前开放问题复核.md`
- ORIG-CAND-001 对照：`docs/ORIG-CAND-001变体验证.md`
