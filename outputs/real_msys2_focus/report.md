# MLIR Differential Report

- Seeds: 20
- Pipelines: 9
- Runs: 180
- Issues: 12

## Issues

### [high] pipeline divergence

- Seed: `seeds\outputs_minimized_mlir22_memref_canonicalize_current.chunk.min.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 3221225477 | memory/assertion | false
symbol_dce_inliner_canonicalize | 3221225477 | memory/assertion | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 3221225477 | memory/assertion | false
vector_lowering_stress | 3221225477 | memory/assertion | false
bufferization_probe | 3221225477 | memory/assertion | false
linalg_affine_probe | 3221225477 | memory/assertion | false
gpu_parallel_probe | 3221225477 | memory/assertion | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_issue_repros_llvm_61085_tosa_linalg_affine_assert.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse_sccp | 1 | unknown failure | false
symbol_dce_inliner_canonicalize | 1 | unknown failure | false
affine_lowering_stress | 1 | unknown failure | false
scf_to_cf_stress | 1 | unknown failure | false
vector_lowering_stress | 1 | unknown failure | false
bufferization_probe | 1 | unknown failure | false
linalg_affine_probe | 1 | unknown failure | false
gpu_parallel_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_issue_repros_llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse_sccp | 1 | unknown failure | false
symbol_dce_inliner_canonicalize | 1 | unknown failure | false
affine_lowering_stress | 1 | unknown failure | false
scf_to_cf_stress | 1 | unknown failure | false
vector_lowering_stress | 1 | unknown failure | false
bufferization_probe | 1 | unknown failure | false
linalg_affine_probe | 1 | unknown failure | false
gpu_parallel_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_original_candidates_orig_001_inliner_nested_region_returned_func.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_cse_sccp | 1 | dialect registration | false
symbol_dce_inliner_canonicalize | 1 | dialect registration | false
affine_lowering_stress | 1 | dialect registration | false
scf_to_cf_stress | 1 | dialect registration | false
vector_lowering_stress | 1 | dialect registration | false
bufferization_probe | 1 | dialect registration | false
linalg_affine_probe | 1 | dialect registration | false
gpu_parallel_probe | 1 | dialect registration | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_real_official_affine_canonicalize.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_cse_sccp | 1 | dialect registration | false
symbol_dce_inliner_canonicalize | 1 | dialect registration | false
affine_lowering_stress | 1 | dialect registration | false
scf_to_cf_stress | 1 | dialect registration | false
vector_lowering_stress | 1 | dialect registration | false
bufferization_probe | 1 | dialect registration | false
linalg_affine_probe | 1 | dialect registration | false
gpu_parallel_probe | 1 | dialect registration | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_real_official_arith_int_range_opts_crash.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_cse_sccp | 1 | dialect registration | false
symbol_dce_inliner_canonicalize | 1 | dialect registration | false
affine_lowering_stress | 1 | dialect registration | false
scf_to_cf_stress | 1 | dialect registration | false
vector_lowering_stress | 1 | dialect registration | false
bufferization_probe | 1 | dialect registration | false
linalg_affine_probe | 1 | dialect registration | false
gpu_parallel_probe | 1 | dialect registration | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_real_official_bufferization_one_shot_bufferize.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_cse_sccp | 1 | dialect registration | false
symbol_dce_inliner_canonicalize | 1 | dialect registration | false
affine_lowering_stress | 1 | dialect registration | false
scf_to_cf_stress | 1 | dialect registration | false
vector_lowering_stress | 1 | dialect registration | false
bufferization_probe | 1 | dialect registration | false
linalg_affine_probe | 1 | dialect registration | false
gpu_parallel_probe | 1 | dialect registration | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_real_official_conversion_vector_to_llvm.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse_sccp | 1 | unknown failure | false
symbol_dce_inliner_canonicalize | 1 | unknown failure | false
affine_lowering_stress | 1 | unknown failure | false
scf_to_cf_stress | 1 | unknown failure | false
vector_lowering_stress | 1 | unknown failure | false
bufferization_probe | 1 | unknown failure | false
linalg_affine_probe | 1 | unknown failure | false
gpu_parallel_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_real_official_gpu_canonicalize.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse_sccp | 1 | unknown failure | false
symbol_dce_inliner_canonicalize | 1 | unknown failure | false
affine_lowering_stress | 1 | unknown failure | false
scf_to_cf_stress | 1 | unknown failure | false
vector_lowering_stress | 1 | unknown failure | false
bufferization_probe | 1 | unknown failure | false
linalg_affine_probe | 1 | unknown failure | false
gpu_parallel_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_real_official_linalg_canonicalize.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse_sccp | 1 | unknown failure | false
symbol_dce_inliner_canonicalize | 1 | unknown failure | false
affine_lowering_stress | 1 | unknown failure | false
scf_to_cf_stress | 1 | unknown failure | false
vector_lowering_stress | 1 | unknown failure | false
bufferization_probe | 1 | unknown failure | false
linalg_affine_probe | 1 | unknown failure | false
gpu_parallel_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_real_official_memref_canonicalize_extra.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_cse_sccp | 1 | dialect registration | false
symbol_dce_inliner_canonicalize | 1 | dialect registration | false
affine_lowering_stress | 1 | dialect registration | false
scf_to_cf_stress | 1 | dialect registration | false
vector_lowering_stress | 1 | dialect registration | false
bufferization_probe | 1 | dialect registration | false
linalg_affine_probe | 1 | dialect registration | false
gpu_parallel_probe | 1 | dialect registration | false
```

### [medium] all pipelines failed

- Seed: `seeds\seeds_real_official_scf_canonicalize.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_cse_sccp | 1 | dialect registration | false
symbol_dce_inliner_canonicalize | 1 | dialect registration | false
affine_lowering_stress | 1 | dialect registration | false
scf_to_cf_stress | 1 | dialect registration | false
vector_lowering_stress | 1 | dialect registration | false
bufferization_probe | 1 | dialect registration | false
linalg_affine_probe | 1 | dialect registration | false
gpu_parallel_probe | 1 | dialect registration | false
```

## Summary

### Run categories

### Invariant findings

- [info] `residual dialect after lowering`: `seeds\seeds_issue_repros_llvm_113021_linalg_negative_indexing_tile.mlir` / `linalg_affine_probe`
  - A lowering pipeline completed but the output still contains high-level dialect(s): linalg.
- [info] `residual dialect after lowering`: `seeds\seeds_issue_repros_llvm_168695_vector_scatter_tensor_canonicalize.mlir` / `vector_lowering_stress`
  - A lowering pipeline completed but the output still contains high-level dialect(s): vector.

- dialect registration: 54
- memory/assertion: 7
- success: 74
- unknown failure: 45

### Issue kinds

- all pipelines failed: 11
- pipeline divergence: 1

### Failure clusters

- `dialect registration:392a4799d5`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:49d30f8efb`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:56f7267e2c`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:8207af8950`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:9ee208fa1f`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:f413e3d78d`: 9 runs, 1 seeds, category `dialect registration`
- `unknown failure:0e12c0e948`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:25f6160ae3`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:38f68d838e`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:a1ee8dd7d5`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:fe9a80c52c`: 9 runs, 1 seeds, category `unknown failure`
- `memory/assertion:51bc491603`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:7a4130d446`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:ad8be0d0fc`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:b223a484fd`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:c4f6cfe43b`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:fcb4885e44`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:fe30c7a90e`: 1 runs, 1 seeds, category `memory/assertion`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\outputs_minimized_mlir22_memref_canonicalize_current.chunk.min.mlir` | `parse_verify` | 0 | success | 56 ms |
| `seeds\outputs_minimized_mlir22_memref_canonicalize_current.chunk.min.mlir` | `canonicalize_cse_sccp` | 3221225477 | memory/assertion | 100 ms |
| `seeds\outputs_minimized_mlir22_memref_canonicalize_current.chunk.min.mlir` | `symbol_dce_inliner_canonicalize` | 3221225477 | memory/assertion | 76 ms |
| `seeds\outputs_minimized_mlir22_memref_canonicalize_current.chunk.min.mlir` | `affine_lowering_stress` | 0 | success | 31 ms |
| `seeds\outputs_minimized_mlir22_memref_canonicalize_current.chunk.min.mlir` | `scf_to_cf_stress` | 3221225477 | memory/assertion | 89 ms |
| `seeds\outputs_minimized_mlir22_memref_canonicalize_current.chunk.min.mlir` | `vector_lowering_stress` | 3221225477 | memory/assertion | 84 ms |
| `seeds\outputs_minimized_mlir22_memref_canonicalize_current.chunk.min.mlir` | `bufferization_probe` | 3221225477 | memory/assertion | 78 ms |
| `seeds\outputs_minimized_mlir22_memref_canonicalize_current.chunk.min.mlir` | `linalg_affine_probe` | 3221225477 | memory/assertion | 94 ms |
| `seeds\outputs_minimized_mlir22_memref_canonicalize_current.chunk.min.mlir` | `gpu_parallel_probe` | 3221225477 | memory/assertion | 76 ms |
| `seeds\outputs_minimized_shape_fold_div_canonicalize.min.mlir` | `parse_verify` | 0 | success | 64 ms |
| `seeds\outputs_minimized_shape_fold_div_canonicalize.min.mlir` | `canonicalize_cse_sccp` | 0 | success | 33 ms |
| `seeds\outputs_minimized_shape_fold_div_canonicalize.min.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 33 ms |
| `seeds\outputs_minimized_shape_fold_div_canonicalize.min.mlir` | `affine_lowering_stress` | 0 | success | 33 ms |
| `seeds\outputs_minimized_shape_fold_div_canonicalize.min.mlir` | `scf_to_cf_stress` | 0 | success | 35 ms |
| `seeds\outputs_minimized_shape_fold_div_canonicalize.min.mlir` | `vector_lowering_stress` | 0 | success | 38 ms |
| `seeds\outputs_minimized_shape_fold_div_canonicalize.min.mlir` | `bufferization_probe` | 0 | success | 36 ms |
| `seeds\outputs_minimized_shape_fold_div_canonicalize.min.mlir` | `linalg_affine_probe` | 0 | success | 32 ms |
| `seeds\outputs_minimized_shape_fold_div_canonicalize.min.mlir` | `gpu_parallel_probe` | 0 | success | 36 ms |
| `seeds\seeds_current_mlir23_llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `parse_verify` | 0 | success | 32 ms |
| `seeds\seeds_current_mlir23_llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `canonicalize_cse_sccp` | 0 | success | 30 ms |
| `seeds\seeds_current_mlir23_llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 30 ms |
| `seeds\seeds_current_mlir23_llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `affine_lowering_stress` | 0 | success | 33 ms |
| `seeds\seeds_current_mlir23_llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `scf_to_cf_stress` | 0 | success | 34 ms |
| `seeds\seeds_current_mlir23_llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `vector_lowering_stress` | 0 | success | 51 ms |
| `seeds\seeds_current_mlir23_llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `bufferization_probe` | 0 | success | 35 ms |
| `seeds\seeds_current_mlir23_llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `linalg_affine_probe` | 0 | success | 34 ms |
| `seeds\seeds_current_mlir23_llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `gpu_parallel_probe` | 0 | success | 50 ms |
| `seeds\seeds_issue_repros_llvm_113021_linalg_negative_indexing_tile.mlir` | `parse_verify` | 0 | success | 40 ms |
| `seeds\seeds_issue_repros_llvm_113021_linalg_negative_indexing_tile.mlir` | `canonicalize_cse_sccp` | 0 | success | 40 ms |
| `seeds\seeds_issue_repros_llvm_113021_linalg_negative_indexing_tile.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 40 ms |
| `seeds\seeds_issue_repros_llvm_113021_linalg_negative_indexing_tile.mlir` | `affine_lowering_stress` | 0 | success | 53 ms |
| `seeds\seeds_issue_repros_llvm_113021_linalg_negative_indexing_tile.mlir` | `scf_to_cf_stress` | 0 | success | 39 ms |
| `seeds\seeds_issue_repros_llvm_113021_linalg_negative_indexing_tile.mlir` | `vector_lowering_stress` | 0 | success | 38 ms |
| `seeds\seeds_issue_repros_llvm_113021_linalg_negative_indexing_tile.mlir` | `bufferization_probe` | 0 | success | 38 ms |
| `seeds\seeds_issue_repros_llvm_113021_linalg_negative_indexing_tile.mlir` | `linalg_affine_probe` | 0 | success | 41 ms |
| `seeds\seeds_issue_repros_llvm_113021_linalg_negative_indexing_tile.mlir` | `gpu_parallel_probe` | 0 | success | 41 ms |
| `seeds\seeds_issue_repros_llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `parse_verify` | 0 | success | 49 ms |
| `seeds\seeds_issue_repros_llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `canonicalize_cse_sccp` | 0 | success | 31 ms |
| `seeds\seeds_issue_repros_llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 30 ms |
| `seeds\seeds_issue_repros_llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `affine_lowering_stress` | 0 | success | 31 ms |
| `seeds\seeds_issue_repros_llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `scf_to_cf_stress` | 0 | success | 33 ms |
| `seeds\seeds_issue_repros_llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `vector_lowering_stress` | 0 | success | 38 ms |
| `seeds\seeds_issue_repros_llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `bufferization_probe` | 0 | success | 34 ms |
| `seeds\seeds_issue_repros_llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `linalg_affine_probe` | 0 | success | 44 ms |
| `seeds\seeds_issue_repros_llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `gpu_parallel_probe` | 0 | success | 31 ms |
| `seeds\seeds_issue_repros_llvm_61085_tosa_linalg_affine_assert.mlir` | `parse_verify` | 1 | unknown failure | 37 ms |
| `seeds\seeds_issue_repros_llvm_61085_tosa_linalg_affine_assert.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 32 ms |
| `seeds\seeds_issue_repros_llvm_61085_tosa_linalg_affine_assert.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 33 ms |
| `seeds\seeds_issue_repros_llvm_61085_tosa_linalg_affine_assert.mlir` | `affine_lowering_stress` | 1 | unknown failure | 33 ms |
| `seeds\seeds_issue_repros_llvm_61085_tosa_linalg_affine_assert.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 33 ms |
| `seeds\seeds_issue_repros_llvm_61085_tosa_linalg_affine_assert.mlir` | `vector_lowering_stress` | 1 | unknown failure | 32 ms |
| `seeds\seeds_issue_repros_llvm_61085_tosa_linalg_affine_assert.mlir` | `bufferization_probe` | 1 | unknown failure | 31 ms |
| `seeds\seeds_issue_repros_llvm_61085_tosa_linalg_affine_assert.mlir` | `linalg_affine_probe` | 1 | unknown failure | 32 ms |
| `seeds\seeds_issue_repros_llvm_61085_tosa_linalg_affine_assert.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 32 ms |
| `seeds\seeds_issue_repros_llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `parse_verify` | 1 | unknown failure | 33 ms |
| `seeds\seeds_issue_repros_llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 31 ms |
| `seeds\seeds_issue_repros_llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 30 ms |
| `seeds\seeds_issue_repros_llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `affine_lowering_stress` | 1 | unknown failure | 30 ms |
| `seeds\seeds_issue_repros_llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 31 ms |
| `seeds\seeds_issue_repros_llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `vector_lowering_stress` | 1 | unknown failure | 32 ms |
| `seeds\seeds_issue_repros_llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `bufferization_probe` | 1 | unknown failure | 30 ms |
| `seeds\seeds_issue_repros_llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `linalg_affine_probe` | 1 | unknown failure | 36 ms |
| `seeds\seeds_issue_repros_llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 31 ms |
| `seeds\seeds_issue_repros_llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `parse_verify` | 0 | success | 33 ms |
| `seeds\seeds_issue_repros_llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `canonicalize_cse_sccp` | 0 | success | 35 ms |
| `seeds\seeds_issue_repros_llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 40 ms |
| `seeds\seeds_issue_repros_llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `affine_lowering_stress` | 0 | success | 33 ms |
| `seeds\seeds_issue_repros_llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `scf_to_cf_stress` | 0 | success | 35 ms |
| `seeds\seeds_issue_repros_llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `vector_lowering_stress` | 0 | success | 36 ms |
| `seeds\seeds_issue_repros_llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `bufferization_probe` | 0 | success | 32 ms |
| `seeds\seeds_issue_repros_llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `linalg_affine_probe` | 0 | success | 51 ms |
| `seeds\seeds_issue_repros_llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `gpu_parallel_probe` | 0 | success | 33 ms |
| `seeds\seeds_original_candidates_orig_001_inliner_nested_region_returned_func.mlir` | `parse_verify` | 1 | dialect registration | 43 ms |
| `seeds\seeds_original_candidates_orig_001_inliner_nested_region_returned_func.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 29 ms |
| `seeds\seeds_original_candidates_orig_001_inliner_nested_region_returned_func.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 30 ms |
| `seeds\seeds_original_candidates_orig_001_inliner_nested_region_returned_func.mlir` | `affine_lowering_stress` | 1 | dialect registration | 38 ms |
| `seeds\seeds_original_candidates_orig_001_inliner_nested_region_returned_func.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 32 ms |
| `seeds\seeds_original_candidates_orig_001_inliner_nested_region_returned_func.mlir` | `vector_lowering_stress` | 1 | dialect registration | 28 ms |
| `seeds\seeds_original_candidates_orig_001_inliner_nested_region_returned_func.mlir` | `bufferization_probe` | 1 | dialect registration | 38 ms |
| `seeds\seeds_original_candidates_orig_001_inliner_nested_region_returned_func.mlir` | `linalg_affine_probe` | 1 | dialect registration | 30 ms |
| `seeds\seeds_original_candidates_orig_001_inliner_nested_region_returned_func.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 29 ms |
| `seeds\seeds_real_official_affine_canonicalize.mlir` | `parse_verify` | 1 | dialect registration | 81 ms |
| `seeds\seeds_real_official_affine_canonicalize.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 33 ms |
| `seeds\seeds_real_official_affine_canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 30 ms |
| `seeds\seeds_real_official_affine_canonicalize.mlir` | `affine_lowering_stress` | 1 | dialect registration | 31 ms |
| `seeds\seeds_real_official_affine_canonicalize.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 32 ms |
| `seeds\seeds_real_official_affine_canonicalize.mlir` | `vector_lowering_stress` | 1 | dialect registration | 31 ms |
| `seeds\seeds_real_official_affine_canonicalize.mlir` | `bufferization_probe` | 1 | dialect registration | 31 ms |
| `seeds\seeds_real_official_affine_canonicalize.mlir` | `linalg_affine_probe` | 1 | dialect registration | 31 ms |
| `seeds\seeds_real_official_affine_canonicalize.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 32 ms |
| `seeds\seeds_real_official_arith_int_range_opts_crash.mlir` | `parse_verify` | 1 | dialect registration | 32 ms |
| `seeds\seeds_real_official_arith_int_range_opts_crash.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 30 ms |
| `seeds\seeds_real_official_arith_int_range_opts_crash.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 48 ms |
| `seeds\seeds_real_official_arith_int_range_opts_crash.mlir` | `affine_lowering_stress` | 1 | dialect registration | 30 ms |
| `seeds\seeds_real_official_arith_int_range_opts_crash.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 31 ms |
| `seeds\seeds_real_official_arith_int_range_opts_crash.mlir` | `vector_lowering_stress` | 1 | dialect registration | 29 ms |
| `seeds\seeds_real_official_arith_int_range_opts_crash.mlir` | `bufferization_probe` | 1 | dialect registration | 29 ms |
| `seeds\seeds_real_official_arith_int_range_opts_crash.mlir` | `linalg_affine_probe` | 1 | dialect registration | 29 ms |
| `seeds\seeds_real_official_arith_int_range_opts_crash.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 30 ms |
| `seeds\seeds_real_official_bufferization_one_shot_bufferize.mlir` | `parse_verify` | 1 | dialect registration | 36 ms |
| `seeds\seeds_real_official_bufferization_one_shot_bufferize.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 33 ms |
| `seeds\seeds_real_official_bufferization_one_shot_bufferize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 32 ms |
| `seeds\seeds_real_official_bufferization_one_shot_bufferize.mlir` | `affine_lowering_stress` | 1 | dialect registration | 32 ms |
| `seeds\seeds_real_official_bufferization_one_shot_bufferize.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 34 ms |
| `seeds\seeds_real_official_bufferization_one_shot_bufferize.mlir` | `vector_lowering_stress` | 1 | dialect registration | 31 ms |
| `seeds\seeds_real_official_bufferization_one_shot_bufferize.mlir` | `bufferization_probe` | 1 | dialect registration | 31 ms |
| `seeds\seeds_real_official_bufferization_one_shot_bufferize.mlir` | `linalg_affine_probe` | 1 | dialect registration | 32 ms |
| `seeds\seeds_real_official_bufferization_one_shot_bufferize.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 366 ms |
| `seeds\seeds_real_official_conversion_scf_to_gpu_parallel_loop.mlir` | `parse_verify` | 0 | success | 70 ms |
| `seeds\seeds_real_official_conversion_scf_to_gpu_parallel_loop.mlir` | `canonicalize_cse_sccp` | 0 | success | 36 ms |
| `seeds\seeds_real_official_conversion_scf_to_gpu_parallel_loop.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 37 ms |
| `seeds\seeds_real_official_conversion_scf_to_gpu_parallel_loop.mlir` | `affine_lowering_stress` | 0 | success | 38 ms |
| `seeds\seeds_real_official_conversion_scf_to_gpu_parallel_loop.mlir` | `scf_to_cf_stress` | 0 | success | 38 ms |
| `seeds\seeds_real_official_conversion_scf_to_gpu_parallel_loop.mlir` | `vector_lowering_stress` | 0 | success | 43 ms |
| `seeds\seeds_real_official_conversion_scf_to_gpu_parallel_loop.mlir` | `bufferization_probe` | 0 | success | 45 ms |
| `seeds\seeds_real_official_conversion_scf_to_gpu_parallel_loop.mlir` | `linalg_affine_probe` | 0 | success | 36 ms |
| `seeds\seeds_real_official_conversion_scf_to_gpu_parallel_loop.mlir` | `gpu_parallel_probe` | 0 | success | 48 ms |
| `seeds\seeds_real_official_conversion_vector_to_llvm.mlir` | `parse_verify` | 1 | unknown failure | 65 ms |
| `seeds\seeds_real_official_conversion_vector_to_llvm.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 32 ms |
| `seeds\seeds_real_official_conversion_vector_to_llvm.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 30 ms |
| `seeds\seeds_real_official_conversion_vector_to_llvm.mlir` | `affine_lowering_stress` | 1 | unknown failure | 31 ms |
| `seeds\seeds_real_official_conversion_vector_to_llvm.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 35 ms |
| `seeds\seeds_real_official_conversion_vector_to_llvm.mlir` | `vector_lowering_stress` | 1 | unknown failure | 35 ms |
| `seeds\seeds_real_official_conversion_vector_to_llvm.mlir` | `bufferization_probe` | 1 | unknown failure | 30 ms |
| `seeds\seeds_real_official_conversion_vector_to_llvm.mlir` | `linalg_affine_probe` | 1 | unknown failure | 50 ms |
| `seeds\seeds_real_official_conversion_vector_to_llvm.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 31 ms |
| `seeds\seeds_real_official_gpu_canonicalize.mlir` | `parse_verify` | 1 | unknown failure | 58 ms |
| `seeds\seeds_real_official_gpu_canonicalize.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 30 ms |
| `seeds\seeds_real_official_gpu_canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 31 ms |
| `seeds\seeds_real_official_gpu_canonicalize.mlir` | `affine_lowering_stress` | 1 | unknown failure | 28 ms |
| `seeds\seeds_real_official_gpu_canonicalize.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 33 ms |
| `seeds\seeds_real_official_gpu_canonicalize.mlir` | `vector_lowering_stress` | 1 | unknown failure | 30 ms |
| `seeds\seeds_real_official_gpu_canonicalize.mlir` | `bufferization_probe` | 1 | unknown failure | 32 ms |
| `seeds\seeds_real_official_gpu_canonicalize.mlir` | `linalg_affine_probe` | 1 | unknown failure | 31 ms |
| `seeds\seeds_real_official_gpu_canonicalize.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 33 ms |
| `seeds\seeds_real_official_linalg_canonicalize.mlir` | `parse_verify` | 1 | unknown failure | 79 ms |
| `seeds\seeds_real_official_linalg_canonicalize.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 35 ms |
| `seeds\seeds_real_official_linalg_canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 50 ms |
| `seeds\seeds_real_official_linalg_canonicalize.mlir` | `affine_lowering_stress` | 1 | unknown failure | 35 ms |
| `seeds\seeds_real_official_linalg_canonicalize.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 34 ms |
| `seeds\seeds_real_official_linalg_canonicalize.mlir` | `vector_lowering_stress` | 1 | unknown failure | 31 ms |
| `seeds\seeds_real_official_linalg_canonicalize.mlir` | `bufferization_probe` | 1 | unknown failure | 31 ms |
| `seeds\seeds_real_official_linalg_canonicalize.mlir` | `linalg_affine_probe` | 1 | unknown failure | 32 ms |
| `seeds\seeds_real_official_linalg_canonicalize.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 32 ms |
| `seeds\seeds_real_official_memref_canonicalize_extra.mlir` | `parse_verify` | 1 | dialect registration | 77 ms |
| `seeds\seeds_real_official_memref_canonicalize_extra.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 35 ms |
| `seeds\seeds_real_official_memref_canonicalize_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 31 ms |
| `seeds\seeds_real_official_memref_canonicalize_extra.mlir` | `affine_lowering_stress` | 1 | dialect registration | 30 ms |
| `seeds\seeds_real_official_memref_canonicalize_extra.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 32 ms |
| `seeds\seeds_real_official_memref_canonicalize_extra.mlir` | `vector_lowering_stress` | 1 | dialect registration | 32 ms |
| `seeds\seeds_real_official_memref_canonicalize_extra.mlir` | `bufferization_probe` | 1 | dialect registration | 32 ms |
| `seeds\seeds_real_official_memref_canonicalize_extra.mlir` | `linalg_affine_probe` | 1 | dialect registration | 36 ms |
| `seeds\seeds_real_official_memref_canonicalize_extra.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 34 ms |
| `seeds\seeds_real_official_scf_canonicalize.mlir` | `parse_verify` | 1 | dialect registration | 78 ms |
| `seeds\seeds_real_official_scf_canonicalize.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 36 ms |
| `seeds\seeds_real_official_scf_canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 32 ms |
| `seeds\seeds_real_official_scf_canonicalize.mlir` | `affine_lowering_stress` | 1 | dialect registration | 33 ms |
| `seeds\seeds_real_official_scf_canonicalize.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 31 ms |
| `seeds\seeds_real_official_scf_canonicalize.mlir` | `vector_lowering_stress` | 1 | dialect registration | 34 ms |
| `seeds\seeds_real_official_scf_canonicalize.mlir` | `bufferization_probe` | 1 | dialect registration | 33 ms |
| `seeds\seeds_real_official_scf_canonicalize.mlir` | `linalg_affine_probe` | 1 | dialect registration | 36 ms |
| `seeds\seeds_real_official_scf_canonicalize.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 53 ms |
| `seeds\seeds_real_official_shape_fold_div.mlir` | `parse_verify` | 0 | success | 39 ms |
| `seeds\seeds_real_official_shape_fold_div.mlir` | `canonicalize_cse_sccp` | 0 | success | 33 ms |
| `seeds\seeds_real_official_shape_fold_div.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 34 ms |
| `seeds\seeds_real_official_shape_fold_div.mlir` | `affine_lowering_stress` | 0 | success | 33 ms |
| `seeds\seeds_real_official_shape_fold_div.mlir` | `scf_to_cf_stress` | 0 | success | 33 ms |
| `seeds\seeds_real_official_shape_fold_div.mlir` | `vector_lowering_stress` | 0 | success | 37 ms |
| `seeds\seeds_real_official_shape_fold_div.mlir` | `bufferization_probe` | 0 | success | 32 ms |
| `seeds\seeds_real_official_shape_fold_div.mlir` | `linalg_affine_probe` | 0 | success | 33 ms |
| `seeds\seeds_real_official_shape_fold_div.mlir` | `gpu_parallel_probe` | 0 | success | 34 ms |
| `seeds\seeds_real_official_vector_constant_fold.mlir` | `parse_verify` | 0 | success | 38 ms |
| `seeds\seeds_real_official_vector_constant_fold.mlir` | `canonicalize_cse_sccp` | 0 | success | 29 ms |
| `seeds\seeds_real_official_vector_constant_fold.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 30 ms |
| `seeds\seeds_real_official_vector_constant_fold.mlir` | `affine_lowering_stress` | 0 | success | 36 ms |
| `seeds\seeds_real_official_vector_constant_fold.mlir` | `scf_to_cf_stress` | 0 | success | 30 ms |
| `seeds\seeds_real_official_vector_constant_fold.mlir` | `vector_lowering_stress` | 0 | success | 39 ms |
| `seeds\seeds_real_official_vector_constant_fold.mlir` | `bufferization_probe` | 0 | success | 37 ms |
| `seeds\seeds_real_official_vector_constant_fold.mlir` | `linalg_affine_probe` | 0 | success | 31 ms |
| `seeds\seeds_real_official_vector_constant_fold.mlir` | `gpu_parallel_probe` | 0 | success | 31 ms |