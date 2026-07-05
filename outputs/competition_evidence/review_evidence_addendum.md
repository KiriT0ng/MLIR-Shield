# MLIRShield Review Evidence Addendum

## Real User Portal E2E

- Evidence JSON: `outputs/competition_evidence/real_user_portal_e2e.json`
- Toolchain path in report: `<MSYS2_ROOT>/mingw64/bin/mlir-opt.exe`

## Issue Repro Status Matrix

| Seed | parse_verify | Non-success | Status | Subcause |
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

## Unknown Failure Subcauses

- unsupported pass option: 45
- input syntax/version compatibility: 12
- dialect dependency missing: 4
- residual unknown: 4
- pass manager nesting mismatch: 3

## Review Efficiency Metrics

- Run log to signature compression: 92.14%
- Run log to P0 compression: 99.23%
- Signature to P0 compression: 90.22%
- MIN-004 line reduction: 99.35%

## Mojo Application Bridge

- Mojo available on current host: False
- Mojo samples: 3
- MLIR Core profile: 3 seeds, 15 runs, 0 issues