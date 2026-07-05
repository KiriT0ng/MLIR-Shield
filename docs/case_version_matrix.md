# 重点案例版本状态矩阵

## 结论视图

| 案例 | MLIR 15 | MLIR 22 | MLIR 23 | 上游状态 | 当前定位 |
| --- | --- | --- | --- | --- | --- |
| MIN-004 | 未作为主验证版本 | hard failure | not reproduced / fixed-like | 与历史公开 bug 形态接近，未作为严格原创上游提交 | MLIR 22 版本差分重点案例 |
| LLVM #197158 | 未作为主验证版本 | 未作为主验证版本 | reproduced hard failure | Open: https://github.com/llvm/llvm-project/issues/197158 | 当前 MLIR 23 公开问题复核 |
| LLVM #197960 baseline | 未作为主验证版本 | 未作为主验证版本 | reproduced hard failure | Open: https://github.com/llvm/llvm-project/issues/197960 | 公开 issue baseline |
| ORIG-CAND-001 | 未作为主验证版本 | 未作为主验证版本 | reproduced hard failure | 待在 #197960 下确认是否同根因 | 原创候选 / 已知问题影响范围扩展 |
| 独立原创搜索批次 | 未作为主验证版本 | 未作为主验证版本 | 5700 runs, 0 independent hard failure | 未提交 | 严谨负结果和去重证据 |

## 关键复现入口

### MIN-004

```text
outputs/minimized/mlir22_memref_canonicalize_current.chunk.min.mlir
outputs/current_validation/min004_current_validation.md
docs/min004_case_report.md
```

### LLVM #197158

```text
seeds/current_mlir23/llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir
outputs/current_issues_mlir23/llvm_197158_current_validation.md
docs/issue_status_matrix.md
```

### ORIG-CAND-001

```text
seeds/original_candidates/orig_001_inliner_nested_region_returned_func.mlir
outputs/orig001_variants/report.json
outputs/orig001_variants/report.html
docs/originality_evidence.md
outputs/orig001_variants/report.html
```

## 演示与复核建议

建议把矩阵作为项目复核中的“证据地图”：

- MIN-004 证明系统能做版本差分和最小化。
- LLVM #197158 证明系统能跟踪当前 MLIR 23 开放问题。
- ORIG-CAND-001 证明系统能发现公开 issue 之外的新触发边界。
- 独立原创搜索批次证明项目没有把普通失败硬包装成原创漏洞。

## 上游确认状态

ORIG-CAND-001 当前还未得到 LLVM 维护者确认。后续若要向上游反馈，建议先根据 `docs/originality_evidence.md` 中的边界说明整理英文复现材料，并在 LLVM #197960 下询问是否同根因。
