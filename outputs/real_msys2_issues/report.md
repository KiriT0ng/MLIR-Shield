# MLIR Differential Report

- Seeds: 9
- Pipelines: 10
- Runs: 90
- Issues: 9

## Issues

### [high] pipeline divergence

- Seed: `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse | 0 | success | false
convert_parallel_loops_to_gpu | 0 | success | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | rewrite | false
test_rewrite_dynamic_op_issue_60569 | 1 | rewrite | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir`
- Summary: All pipelines failed. Categories: rewrite, unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse | 1 | unknown failure | false
convert_parallel_loops_to_gpu | 1 | unknown failure | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | rewrite | false
test_rewrite_dynamic_op_issue_60569 | 1 | rewrite | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir`
- Summary: All pipelines failed. Categories: rewrite, unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse | 1 | unknown failure | false
convert_parallel_loops_to_gpu | 1 | unknown failure | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | rewrite | false
test_rewrite_dynamic_op_issue_60569 | 1 | rewrite | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 1 | unknown failure | false
```

### [high] pipeline divergence

- Seed: `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse | 0 | success | false
convert_parallel_loops_to_gpu | 0 | success | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | rewrite | false
test_rewrite_dynamic_op_issue_60569 | 1 | rewrite | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir`
- Summary: All pipelines failed. Categories: rewrite, unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse | 1 | unknown failure | false
convert_parallel_loops_to_gpu | 1 | unknown failure | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | rewrite | false
test_rewrite_dynamic_op_issue_60569 | 1 | rewrite | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir`
- Summary: All pipelines failed. Categories: dialect registration, rewrite, unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_cse | 1 | dialect registration | false
convert_parallel_loops_to_gpu | 1 | dialect registration | false
linalg_parallel_to_gpu_issue_82382 | 1 | dialect registration | false
test_linalg_multiuse_fusion_issue_119868 | 1 | rewrite | false
test_rewrite_dynamic_op_issue_60569 | 1 | rewrite | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 1 | dialect registration | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir`
- Summary: All pipelines failed. Categories: rewrite, unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse | 1 | unknown failure | false
convert_parallel_loops_to_gpu | 1 | unknown failure | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | rewrite | false
test_rewrite_dynamic_op_issue_60569 | 1 | rewrite | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir`
- Summary: All pipelines failed. Categories: rewrite, unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse | 1 | unknown failure | false
convert_parallel_loops_to_gpu | 1 | unknown failure | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | rewrite | false
test_rewrite_dynamic_op_issue_60569 | 1 | rewrite | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 1 | unknown failure | false
```

### [high] pipeline divergence

- Seed: `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse | 0 | success | false
convert_parallel_loops_to_gpu | 0 | success | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | rewrite | false
test_rewrite_dynamic_op_issue_60569 | 1 | rewrite | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
```

## Summary

### Run categories

### Invariant findings

- none: 0

- dialect registration: 5
- rewrite: 18
- success: 12
- unknown failure: 55

### Issue kinds

- all pipelines failed: 6
- pipeline divergence: 3

### Failure clusters

- `unknown failure:ca9f60e82b`: 18 runs, 9 seeds, category `unknown failure`
- `rewrite:8f006041c7`: 9 runs, 9 seeds, category `rewrite`
- `rewrite:c86a58a644`: 9 runs, 9 seeds, category `rewrite`
- `unknown failure:11bf0ff5f7`: 9 runs, 9 seeds, category `unknown failure`
- `dialect registration:9f12a94b88`: 5 runs, 1 seeds, category `dialect registration`
- `unknown failure:244f103ffb`: 5 runs, 1 seeds, category `unknown failure`
- `unknown failure:468b2ec032`: 5 runs, 1 seeds, category `unknown failure`
- `unknown failure:c959d179c0`: 5 runs, 1 seeds, category `unknown failure`
- `unknown failure:ccd0eb5162`: 5 runs, 1 seeds, category `unknown failure`
- `unknown failure:cfd3062659`: 5 runs, 1 seeds, category `unknown failure`
- `unknown failure:ff7d26028f`: 3 runs, 3 seeds, category `unknown failure`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `parse_verify` | 0 | success | 84 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `canonicalize_cse` | 0 | success | 47 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `convert_parallel_loops_to_gpu` | 0 | success | 51 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 39 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | rewrite | 122 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | rewrite | 103 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 44 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 76 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 77 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 47 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `parse_verify` | 1 | unknown failure | 99 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `canonicalize_cse` | 1 | unknown failure | 42 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 36 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 38 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | rewrite | 110 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | rewrite | 93 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 38 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 69 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 85 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 38 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `parse_verify` | 1 | unknown failure | 48 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `canonicalize_cse` | 1 | unknown failure | 32 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 38 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 38 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | rewrite | 113 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | rewrite | 75 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 40 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 71 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 67 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 32 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `parse_verify` | 0 | success | 57 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `canonicalize_cse` | 0 | success | 32 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `convert_parallel_loops_to_gpu` | 0 | success | 31 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 33 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | rewrite | 103 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | rewrite | 67 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 37 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 70 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 68 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 34 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `parse_verify` | 1 | unknown failure | 70 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `canonicalize_cse` | 1 | unknown failure | 43 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 43 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 42 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | rewrite | 108 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | rewrite | 67 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 40 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 67 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 68 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 43 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `parse_verify` | 1 | dialect registration | 42 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `canonicalize_cse` | 1 | dialect registration | 32 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `convert_parallel_loops_to_gpu` | 1 | dialect registration | 36 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | dialect registration | 36 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | rewrite | 123 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | rewrite | 86 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 46 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 79 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 75 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | dialect registration | 34 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `parse_verify` | 1 | unknown failure | 50 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `canonicalize_cse` | 1 | unknown failure | 38 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 39 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 36 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | rewrite | 108 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | rewrite | 71 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 40 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 71 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 74 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 41 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `parse_verify` | 1 | unknown failure | 55 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `canonicalize_cse` | 1 | unknown failure | 40 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 36 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 37 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | rewrite | 108 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | rewrite | 67 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 54 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 68 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 74 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 33 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `parse_verify` | 0 | success | 45 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `canonicalize_cse` | 0 | success | 39 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `convert_parallel_loops_to_gpu` | 0 | success | 38 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 42 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | rewrite | 107 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | rewrite | 67 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 38 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 67 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 65 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 35 ms |