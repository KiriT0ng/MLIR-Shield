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
test_linalg_multiuse_fusion_issue_119868 | 0 | success | false
test_rewrite_dynamic_op_issue_60569 | 0 | success | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse | 1 | unknown failure | false
convert_parallel_loops_to_gpu | 1 | unknown failure | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | unknown failure | false
test_rewrite_dynamic_op_issue_60569 | 1 | unknown failure | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse | 1 | unknown failure | false
convert_parallel_loops_to_gpu | 1 | unknown failure | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | unknown failure | false
test_rewrite_dynamic_op_issue_60569 | 1 | unknown failure | false
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
test_linalg_multiuse_fusion_issue_119868 | 0 | success | false
test_rewrite_dynamic_op_issue_60569 | 0 | success | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse | 1 | unknown failure | false
convert_parallel_loops_to_gpu | 1 | unknown failure | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | unknown failure | false
test_rewrite_dynamic_op_issue_60569 | 1 | unknown failure | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 1 | unknown failure | false
```

### [high] pipeline divergence

- Seed: `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse | 0 | success | false
convert_parallel_loops_to_gpu | 0 | success | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 0 | success | false
test_rewrite_dynamic_op_issue_60569 | 0 | success | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse | 1 | unknown failure | false
convert_parallel_loops_to_gpu | 1 | unknown failure | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | unknown failure | false
test_rewrite_dynamic_op_issue_60569 | 1 | unknown failure | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_cse | 1 | unknown failure | false
convert_parallel_loops_to_gpu | 1 | unknown failure | false
linalg_parallel_to_gpu_issue_82382 | 1 | unknown failure | false
test_linalg_multiuse_fusion_issue_119868 | 1 | unknown failure | false
test_rewrite_dynamic_op_issue_60569 | 1 | unknown failure | false
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
test_linalg_multiuse_fusion_issue_119868 | 0 | success | false
test_rewrite_dynamic_op_issue_60569 | 0 | success | false
tosa_linalg_affine_issue_61085 | 1 | unknown failure | false
transform_tile_reduction_issue_60210 | 1 | unknown failure | false
transform_linalg_tile_issue_113021 | 1 | unknown failure | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
```

## Summary

### Run categories

### Invariant findings

- none: 0

- success: 24
- unknown failure: 66

### Issue kinds

- all pipelines failed: 5
- pipeline divergence: 4

### Failure clusters

- `unknown failure:f81f508ed3`: 18 runs, 9 seeds, category `unknown failure`
- `unknown failure:8273343e3d`: 9 runs, 9 seeds, category `unknown failure`
- `unknown failure:0034bf5e84`: 7 runs, 1 seeds, category `unknown failure`
- `unknown failure:1d2c7dea60`: 7 runs, 1 seeds, category `unknown failure`
- `unknown failure:a1de3bb138`: 7 runs, 1 seeds, category `unknown failure`
- `unknown failure:b924d82ce0`: 7 runs, 1 seeds, category `unknown failure`
- `unknown failure:c0d49d756d`: 7 runs, 1 seeds, category `unknown failure`
- `unknown failure:ff7d26028f`: 4 runs, 4 seeds, category `unknown failure`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `parse_verify` | 0 | success | 680 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `canonicalize_cse` | 0 | success | 653 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `convert_parallel_loops_to_gpu` | 0 | success | 617 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 594 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 0 | success | 647 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `test_rewrite_dynamic_op_issue_60569` | 0 | success | 684 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 761 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 1288 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 1251 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 618 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `parse_verify` | 1 | unknown failure | 610 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `canonicalize_cse` | 1 | unknown failure | 602 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 634 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 654 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 603 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | unknown failure | 692 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 755 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 1204 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 1227 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 648 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `parse_verify` | 1 | unknown failure | 599 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `canonicalize_cse` | 1 | unknown failure | 585 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 619 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 583 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 611 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | unknown failure | 667 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 875 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 1233 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 1223 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 650 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `parse_verify` | 0 | success | 598 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `canonicalize_cse` | 0 | success | 607 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `convert_parallel_loops_to_gpu` | 0 | success | 624 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 582 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 0 | success | 636 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `test_rewrite_dynamic_op_issue_60569` | 0 | success | 600 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 764 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 1276 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 1202 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 622 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `parse_verify` | 1 | unknown failure | 754 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `canonicalize_cse` | 1 | unknown failure | 643 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 586 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 631 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 641 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | unknown failure | 670 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 750 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 1254 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 1300 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 638 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `parse_verify` | 0 | success | 637 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `canonicalize_cse` | 0 | success | 627 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `convert_parallel_loops_to_gpu` | 0 | success | 611 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 682 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 0 | success | 604 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `test_rewrite_dynamic_op_issue_60569` | 0 | success | 678 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 759 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 1313 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 1251 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 641 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `parse_verify` | 1 | unknown failure | 623 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `canonicalize_cse` | 1 | unknown failure | 686 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 653 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 630 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 633 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | unknown failure | 637 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 714 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 1238 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 1231 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 611 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `parse_verify` | 1 | unknown failure | 657 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `canonicalize_cse` | 1 | unknown failure | 623 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 600 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 733 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 613 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | unknown failure | 644 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 713 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 1263 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 1269 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 611 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `parse_verify` | 0 | success | 585 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `canonicalize_cse` | 0 | success | 602 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `convert_parallel_loops_to_gpu` | 0 | success | 589 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 665 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 0 | success | 644 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `test_rewrite_dynamic_op_issue_60569` | 0 | success | 637 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 714 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 1258 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 1423 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 662 ms |