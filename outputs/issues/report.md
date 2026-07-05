# MLIR Differential Report

- Seeds: 9
- Pipelines: 10
- Runs: 90
- Issues: 9

## Issues

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir`
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

- Seed: `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse | 1 | parser | false
convert_parallel_loops_to_gpu | 1 | parser | false
linalg_parallel_to_gpu_issue_82382 | 1 | parser | false
test_linalg_multiuse_fusion_issue_119868 | 1 | parser | false
test_rewrite_dynamic_op_issue_60569 | 1 | parser | false
tosa_linalg_affine_issue_61085 | 1 | parser | false
transform_tile_reduction_issue_60210 | 1 | parser | false
transform_linalg_tile_issue_113021 | 1 | parser | false
vector_scatter_canonicalize_issue_168695 | 1 | parser | false
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

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir`
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
linalg_parallel_to_gpu_issue_82382 | 0 | success | false
test_linalg_multiuse_fusion_issue_119868 | 1 | unknown failure | false
test_rewrite_dynamic_op_issue_60569 | 0 | success | false
tosa_linalg_affine_issue_61085 | 0 | success | false
transform_tile_reduction_issue_60210 | 0 | success | false
transform_linalg_tile_issue_113021 | 0 | success | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
```

### [high] pipeline divergence

- Seed: `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse | 0 | success | false
convert_parallel_loops_to_gpu | 0 | success | false
linalg_parallel_to_gpu_issue_82382 | 0 | success | false
test_linalg_multiuse_fusion_issue_119868 | 1 | unknown failure | false
test_rewrite_dynamic_op_issue_60569 | 0 | success | false
tosa_linalg_affine_issue_61085 | 4294967295 | memory/assertion | false
transform_tile_reduction_issue_60210 | 0 | success | false
transform_linalg_tile_issue_113021 | 0 | success | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
```

### [high] pipeline divergence

- Seed: `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse | 0 | success | false
convert_parallel_loops_to_gpu | 4294967295 | memory/assertion | false
linalg_parallel_to_gpu_issue_82382 | 0 | success | false
test_linalg_multiuse_fusion_issue_119868 | 1 | unknown failure | false
test_rewrite_dynamic_op_issue_60569 | 0 | success | false
tosa_linalg_affine_issue_61085 | 0 | success | false
transform_tile_reduction_issue_60210 | 0 | success | false
transform_linalg_tile_issue_113021 | 0 | success | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
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
linalg_parallel_to_gpu_issue_82382 | 0 | success | false
test_linalg_multiuse_fusion_issue_119868 | 1 | unknown failure | false
test_rewrite_dynamic_op_issue_60569 | 0 | success | false
tosa_linalg_affine_issue_61085 | 0 | success | false
transform_tile_reduction_issue_60210 | 0 | success | false
transform_linalg_tile_issue_113021 | 0 | success | false
vector_scatter_canonicalize_issue_168695 | 0 | success | false
```

## Summary

### Run categories

### Invariant findings

- none: 0

- memory/assertion: 2
- parser: 10
- success: 34
- unknown failure: 44

### Issue kinds

- all pipelines failed: 5
- pipeline divergence: 4

### Failure clusters

- `parser:aab7293295`: 10 runs, 1 seeds, category `parser`
- `unknown failure:1e2f3897bc`: 10 runs, 1 seeds, category `unknown failure`
- `unknown failure:27542a8606`: 10 runs, 1 seeds, category `unknown failure`
- `unknown failure:70428b47ea`: 10 runs, 1 seeds, category `unknown failure`
- `unknown failure:fdade4695a`: 10 runs, 1 seeds, category `unknown failure`
- `unknown failure:7fca687bdd`: 4 runs, 4 seeds, category `unknown failure`
- `memory/assertion:c42721cfdd`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:c761d1aa00`: 1 runs, 1 seeds, category `memory/assertion`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `parse_verify` | 1 | unknown failure | 1933 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `canonicalize_cse` | 1 | unknown failure | 1245 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 1229 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 1047 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 1687 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | unknown failure | 1065 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 805 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 938 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 7412 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 604 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `parse_verify` | 1 | parser | 646 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `canonicalize_cse` | 1 | parser | 1163 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `convert_parallel_loops_to_gpu` | 1 | parser | 872 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | parser | 912 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | parser | 865 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | parser | 1111 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `tosa_linalg_affine_issue_61085` | 1 | parser | 1103 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `transform_tile_reduction_issue_60210` | 1 | parser | 1152 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `transform_linalg_tile_issue_113021` | 1 | parser | 807 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | parser | 1087 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `parse_verify` | 1 | unknown failure | 808 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `canonicalize_cse` | 1 | unknown failure | 1079 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 777 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 805 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 1149 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | unknown failure | 1123 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 789 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 798 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 928 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 1212 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `parse_verify` | 1 | unknown failure | 952 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `canonicalize_cse` | 1 | unknown failure | 858 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 1138 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 1305 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 1165 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | unknown failure | 830 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 850 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 857 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 752 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 836 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `parse_verify` | 1 | unknown failure | 740 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `canonicalize_cse` | 1 | unknown failure | 831 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `convert_parallel_loops_to_gpu` | 1 | unknown failure | 838 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `linalg_parallel_to_gpu_issue_82382` | 1 | unknown failure | 843 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 729 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `test_rewrite_dynamic_op_issue_60569` | 1 | unknown failure | 752 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `tosa_linalg_affine_issue_61085` | 1 | unknown failure | 665 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `transform_tile_reduction_issue_60210` | 1 | unknown failure | 861 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `transform_linalg_tile_issue_113021` | 1 | unknown failure | 769 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `vector_scatter_canonicalize_issue_168695` | 1 | unknown failure | 708 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `parse_verify` | 0 | success | 697 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `canonicalize_cse` | 0 | success | 935 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `convert_parallel_loops_to_gpu` | 0 | success | 633 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `linalg_parallel_to_gpu_issue_82382` | 0 | success | 713 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 843 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `test_rewrite_dynamic_op_issue_60569` | 0 | success | 667 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `tosa_linalg_affine_issue_61085` | 0 | success | 649 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `transform_tile_reduction_issue_60210` | 0 | success | 609 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `transform_linalg_tile_issue_113021` | 0 | success | 670 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 698 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `parse_verify` | 0 | success | 795 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `canonicalize_cse` | 0 | success | 705 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `convert_parallel_loops_to_gpu` | 0 | success | 790 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `linalg_parallel_to_gpu_issue_82382` | 0 | success | 631 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 586 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `test_rewrite_dynamic_op_issue_60569` | 0 | success | 593 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `tosa_linalg_affine_issue_61085` | 4294967295 | memory/assertion | 1819 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `transform_tile_reduction_issue_60210` | 0 | success | 608 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `transform_linalg_tile_issue_113021` | 0 | success | 633 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 615 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `parse_verify` | 0 | success | 611 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `canonicalize_cse` | 0 | success | 596 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `convert_parallel_loops_to_gpu` | 4294967295 | memory/assertion | 1800 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `linalg_parallel_to_gpu_issue_82382` | 0 | success | 638 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 580 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `test_rewrite_dynamic_op_issue_60569` | 0 | success | 625 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `tosa_linalg_affine_issue_61085` | 0 | success | 613 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `transform_tile_reduction_issue_60210` | 0 | success | 613 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `transform_linalg_tile_issue_113021` | 0 | success | 726 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 617 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `parse_verify` | 0 | success | 614 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `canonicalize_cse` | 0 | success | 612 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `convert_parallel_loops_to_gpu` | 0 | success | 615 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `linalg_parallel_to_gpu_issue_82382` | 0 | success | 684 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `test_linalg_multiuse_fusion_issue_119868` | 1 | unknown failure | 586 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `test_rewrite_dynamic_op_issue_60569` | 0 | success | 572 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `tosa_linalg_affine_issue_61085` | 0 | success | 628 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `transform_tile_reduction_issue_60210` | 0 | success | 600 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `transform_linalg_tile_issue_113021` | 0 | success | 591 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `vector_scatter_canonicalize_issue_168695` | 0 | success | 581 ms |