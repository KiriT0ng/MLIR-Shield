# MLIR Differential Report

- Seeds: 130
- Pipelines: 9
- Runs: 1170
- Issues: 59

## Issues

### [medium] all pipelines failed

- Seed: `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir`
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

- Seed: `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir`
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

- Seed: `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir`
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

- Seed: `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir`
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

- Seed: `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir`
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

- Seed: `seeds\real_official\affine\affine_data_copy.mlir`
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

- Seed: `seeds\real_official\affine\canonicalize.mlir`
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

- Seed: `seeds\real_official\affine\invalid.mlir`
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

- Seed: `seeds\real_official\async\verify.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official\bufferization\one_shot_bufferize.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 0 | success | false
symbol_dce_inliner_canonicalize | 0 | success | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 0 | success | false
vector_lowering_stress | 0 | success | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 0 | success | false
gpu_parallel_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\complex\invalid.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\conversion\arith_to_llvm.mlir`
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

- Seed: `seeds\real_official\conversion\convert_funcs.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\conversion\func_to_llvm_convert_funcs_extra.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\conversion\gpu_to_nvvm.mlir`
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

- Seed: `seeds\real_official\conversion\gpu_to_nvvm_extra.mlir`
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

- Seed: `seeds\real_official\conversion\math_to_llvm.mlir`
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

- Seed: `seeds\real_official\conversion\module_opencl.mlir`
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

- Seed: `seeds\real_official\conversion\tosa_to_linalg.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\conversion\tosa_to_linalg_extra.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\conversion\vector_to_llvm.mlir`
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

- Seed: `seeds\real_official\conversion\vector_to_llvm_extra.mlir`
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

- Seed: `seeds\real_official\gpu\canonicalize.mlir`
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

- Seed: `seeds\real_official\gpu\constant_address_space.mlir`
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

- Seed: `seeds\real_official\gpu\invalid.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\linalg\bufferize.mlir`
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

- Seed: `seeds\real_official\linalg\canonicalize.mlir`
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

- Seed: `seeds\real_official\linalg\invalid.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official\linalg\loops.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 0 | success | false
symbol_dce_inliner_canonicalize | 0 | success | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 1 | unknown failure | false
vector_lowering_stress | 0 | success | false
bufferization_probe | 0 | success | false
linalg_affine_probe | 0 | success | false
gpu_parallel_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\linalg\parallel_loops.mlir`
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

- Seed: `seeds\real_official\llvmir\canonicalize_extra.mlir`
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

- Seed: `seeds\real_official\llvmir\nvvm_target_invalid.mlir`
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

- Seed: `seeds\real_official\math\uplift_to_fma.mlir`
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

### [high] pipeline divergence

- Seed: `seeds\real_official\memref\canonicalize_extra.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 4294967295 | memory/assertion | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 4294967295 | memory/assertion | false
scf_to_cf_stress | 4294967295 | memory/assertion | false
vector_lowering_stress | 4294967295 | memory/assertion | false
bufferization_probe | 4294967295 | memory/assertion | false
linalg_affine_probe | 4294967295 | memory/assertion | false
gpu_parallel_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\memref\invalid_extra.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\memref\ops_extra.mlir`
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

- Seed: `seeds\real_official\openmp\canonicalize.mlir`
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

- Seed: `seeds\real_official\openmp\invalid_fuse.mlir`
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

- Seed: `seeds\real_official\quant\normalize_quant_types.mlir`
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

- Seed: `seeds\real_official\quant\parse_any.mlir`
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

- Seed: `seeds\real_official\quant\parse_calibrated.mlir`
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

- Seed: `seeds\real_official\scf\canonicalize.mlir`
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

- Seed: `seeds\real_official\scf\canonicalize_extra.mlir`
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

### [high] pipeline divergence

- Seed: `seeds\real_official\scf\for_loop_canonicalization.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 0 | success | false
symbol_dce_inliner_canonicalize | 0 | success | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 0 | success | false
vector_lowering_stress | 0 | success | false
bufferization_probe | 1 | unknown failure | false
linalg_affine_probe | 0 | success | false
gpu_parallel_probe | 0 | success | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official\scf\ops.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 0 | success | false
symbol_dce_inliner_canonicalize | 0 | success | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 1 | type legality | false
vector_lowering_stress | 0 | success | false
bufferization_probe | 0 | success | false
linalg_affine_probe | 0 | success | false
gpu_parallel_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\scf\parallel_to_nested_fors.mlir`
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

### [high] pipeline divergence

- Seed: `seeds\real_official\shape\bufferize.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 0 | success | false
symbol_dce_inliner_canonicalize | 0 | success | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 0 | success | false
vector_lowering_stress | 0 | success | false
bufferization_probe | 1 | unknown failure | false
linalg_affine_probe | 0 | success | false
gpu_parallel_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\shape\canonicalize_extra.mlir`
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

### [high] pipeline divergence

- Seed: `seeds\real_official\shape\shape_to_shape.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 0 | success | false
symbol_dce_inliner_canonicalize | 0 | success | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 0 | success | false
vector_lowering_stress | 0 | success | false
bufferization_probe | 1 | unknown failure | false
linalg_affine_probe | 0 | success | false
gpu_parallel_probe | 0 | success | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official\sparsetensor\conversion_invalid.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 0 | success | false
symbol_dce_inliner_canonicalize | 0 | success | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 0 | success | false
vector_lowering_stress | 0 | success | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 0 | success | false
gpu_parallel_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\spirv\IR_invalid.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\tensor\canonicalize_extra.mlir`
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

- Seed: `seeds\real_official\tensor\fold_constant_extract_slice.mlir`
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

### [high] pipeline divergence

- Seed: `seeds\real_official\tensor\ops_extra.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 0 | success | false
symbol_dce_inliner_canonicalize | 0 | success | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 0 | success | false
vector_lowering_stress | 0 | success | false
bufferization_probe | 1 | unknown failure | false
linalg_affine_probe | 0 | success | false
gpu_parallel_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\tosa\canonicalize.mlir`
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

- Seed: `seeds\real_official\tosa\invalid.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_cse_sccp | 1 | parser | false
symbol_dce_inliner_canonicalize | 1 | parser | false
affine_lowering_stress | 1 | parser | false
scf_to_cf_stress | 1 | parser | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 1 | parser | false
gpu_parallel_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official\tosa\ops.mlir`
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

### [high] pipeline divergence

- Seed: `seeds\real_official\vector\bufferize_invalid.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 0 | success | false
symbol_dce_inliner_canonicalize | 0 | success | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 0 | success | false
vector_lowering_stress | 1 | parser | false
bufferization_probe | 1 | parser | false
linalg_affine_probe | 0 | success | false
gpu_parallel_probe | 0 | success | false
```

### [high] pipeline divergence

- Seed: `seeds\tosa\tosa_add.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_cse_sccp | 0 | success | false
symbol_dce_inliner_canonicalize | 0 | success | false
affine_lowering_stress | 0 | success | false
scf_to_cf_stress | 0 | success | false
vector_lowering_stress | 0 | success | false
bufferization_probe | 1 | unknown failure | false
linalg_affine_probe | 0 | success | false
gpu_parallel_probe | 0 | success | false
```

## Summary

### Run categories

### Invariant findings

- [info] `residual dialect after lowering`: `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` / `linalg_affine_probe`
  - A lowering pipeline completed but the output still contains high-level dialect(s): linalg.
- [info] `residual dialect after lowering`: `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` / `vector_lowering_stress`
  - A lowering pipeline completed but the output still contains high-level dialect(s): vector.
- [info] `residual dialect after lowering`: `seeds\linalg\fill_tensor.mlir` / `linalg_affine_probe`
  - A lowering pipeline completed but the output still contains high-level dialect(s): linalg.
- [info] `residual dialect after lowering`: `seeds\real_official\bufferization\one_shot_bufferize.mlir` / `vector_lowering_stress`
  - A lowering pipeline completed but the output still contains high-level dialect(s): vector.
- [info] `residual dialect after lowering`: `seeds\real_official\bufferization\one_shot_bufferize.mlir` / `linalg_affine_probe`
  - A lowering pipeline completed but the output still contains high-level dialect(s): linalg.
- [info] `residual dialect after lowering`: `seeds\real_official\linalg\constant_fold.mlir` / `linalg_affine_probe`
  - A lowering pipeline completed but the output still contains high-level dialect(s): linalg.
- [info] `residual dialect after lowering`: `seeds\real_official\linalg\fusion_multiuse_producer.mlir` / `linalg_affine_probe`
  - A lowering pipeline completed but the output still contains high-level dialect(s): linalg.
- [info] `residual dialect after lowering`: `seeds\real_official\sparsetensor\minipipeline_vector.mlir` / `linalg_affine_probe`
  - A lowering pipeline completed but the output still contains high-level dialect(s): linalg.
- [info] `residual dialect after lowering`: `seeds\real_official\sparsetensor\sparse_relu.mlir` / `linalg_affine_probe`
  - A lowering pipeline completed but the output still contains high-level dialect(s): linalg.
- [info] `residual dialect after lowering`: `seeds\real_official\sparsetensor\sparse_vector_mv.mlir` / `linalg_affine_probe`
  - A lowering pipeline completed but the output still contains high-level dialect(s): linalg.

- dialect registration: 54
- memory/assertion: 6
- parser: 105
- success: 719
- type legality: 1
- unknown failure: 285

### Issue kinds

- all pipelines failed: 48
- pipeline divergence: 11

### Failure clusters

- `dialect registration:834f73a1b3`: 18 runs, 2 seeds, category `dialect registration`
- `parser:b96e904ec2`: 18 runs, 2 seeds, category `parser`
- `parser:d7ba518c5b`: 18 runs, 2 seeds, category `parser`
- `unknown failure:06408e1018`: 18 runs, 2 seeds, category `unknown failure`
- `unknown failure:2823d55290`: 18 runs, 2 seeds, category `unknown failure`
- `unknown failure:c52fd71a63`: 18 runs, 2 seeds, category `unknown failure`
- `dialect registration:75f4396cb4`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:92862fef64`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:a07e7213b9`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:bc509613b1`: 9 runs, 1 seeds, category `dialect registration`
- `parser:23454e21dc`: 9 runs, 1 seeds, category `parser`
- `parser:310c241988`: 9 runs, 1 seeds, category `parser`
- `parser:3fc276e6da`: 9 runs, 1 seeds, category `parser`
- `parser:8397ee53f5`: 9 runs, 1 seeds, category `parser`
- `parser:c7afc2ddb0`: 9 runs, 1 seeds, category `parser`
- `parser:cbff7ad96a`: 9 runs, 1 seeds, category `parser`
- `parser:ebdde3ee9b`: 9 runs, 1 seeds, category `parser`
- `unknown failure:0034bf5e84`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:00ee5ecb1e`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:0563ac7c29`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:17cd114d83`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:1d2c7dea60`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:21cb23bc9b`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:39db0a4afb`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:3ec7551809`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:5ad07c604a`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:5bc81cca8a`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:7005818929`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:72481bcbc4`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:73d86be023`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:854c2b07d4`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:94d6bcc4c2`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:9b2a96e14e`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:9bbf3f0d43`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:a1de3bb138`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:b7cf09258b`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:bbb5a82bf5`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:c0d49d756d`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:c927dcc12a`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:f41c9f13e2`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:f5a8b318b2`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:fd04bc51c9`: 9 runs, 1 seeds, category `unknown failure`
- `memory/assertion:378358d938`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:4c39513fb7`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:58382d2ba1`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:98034329b7`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:d2eed5b29d`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:dc1cf21e24`: 1 runs, 1 seeds, category `memory/assertion`
- `parser:0e1238c082`: 1 runs, 1 seeds, category `parser`
- `parser:1f04132c52`: 1 runs, 1 seeds, category `parser`
- `parser:2cc5251084`: 1 runs, 1 seeds, category `parser`
- `parser:b0ceb8413e`: 1 runs, 1 seeds, category `parser`
- `parser:b7c471b715`: 1 runs, 1 seeds, category `parser`
- `parser:f7ca4c5117`: 1 runs, 1 seeds, category `parser`
- `type legality:660e1cdc9e`: 1 runs, 1 seeds, category `type legality`
- `unknown failure:22fe91f336`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:2db817d900`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:53cfe7a06b`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:9cc2eab03e`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:9d3114386c`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:df3a919d4f`: 1 runs, 1 seeds, category `unknown failure`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\affine\affine_loop.mlir` | `parse_verify` | 0 | success | 634 ms |
| `seeds\affine\affine_loop.mlir` | `canonicalize_cse_sccp` | 0 | success | 593 ms |
| `seeds\affine\affine_loop.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 623 ms |
| `seeds\affine\affine_loop.mlir` | `affine_lowering_stress` | 0 | success | 620 ms |
| `seeds\affine\affine_loop.mlir` | `scf_to_cf_stress` | 0 | success | 594 ms |
| `seeds\affine\affine_loop.mlir` | `vector_lowering_stress` | 0 | success | 626 ms |
| `seeds\affine\affine_loop.mlir` | `bufferization_probe` | 0 | success | 603 ms |
| `seeds\affine\affine_loop.mlir` | `linalg_affine_probe` | 0 | success | 623 ms |
| `seeds\affine\affine_loop.mlir` | `gpu_parallel_probe` | 0 | success | 645 ms |
| `seeds\arith\arith_add.mlir` | `parse_verify` | 0 | success | 615 ms |
| `seeds\arith\arith_add.mlir` | `canonicalize_cse_sccp` | 0 | success | 631 ms |
| `seeds\arith\arith_add.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 595 ms |
| `seeds\arith\arith_add.mlir` | `affine_lowering_stress` | 0 | success | 638 ms |
| `seeds\arith\arith_add.mlir` | `scf_to_cf_stress` | 0 | success | 624 ms |
| `seeds\arith\arith_add.mlir` | `vector_lowering_stress` | 0 | success | 595 ms |
| `seeds\arith\arith_add.mlir` | `bufferization_probe` | 0 | success | 610 ms |
| `seeds\arith\arith_add.mlir` | `linalg_affine_probe` | 0 | success | 615 ms |
| `seeds\arith\arith_add.mlir` | `gpu_parallel_probe` | 0 | success | 589 ms |
| `seeds\arith\canonical_fold.mlir` | `parse_verify` | 0 | success | 646 ms |
| `seeds\arith\canonical_fold.mlir` | `canonicalize_cse_sccp` | 0 | success | 647 ms |
| `seeds\arith\canonical_fold.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 649 ms |
| `seeds\arith\canonical_fold.mlir` | `affine_lowering_stress` | 0 | success | 596 ms |
| `seeds\arith\canonical_fold.mlir` | `scf_to_cf_stress` | 0 | success | 639 ms |
| `seeds\arith\canonical_fold.mlir` | `vector_lowering_stress` | 0 | success | 617 ms |
| `seeds\arith\canonical_fold.mlir` | `bufferization_probe` | 0 | success | 633 ms |
| `seeds\arith\canonical_fold.mlir` | `linalg_affine_probe` | 0 | success | 624 ms |
| `seeds\arith\canonical_fold.mlir` | `gpu_parallel_probe` | 0 | success | 644 ms |
| `seeds\cf\branch.mlir` | `parse_verify` | 0 | success | 592 ms |
| `seeds\cf\branch.mlir` | `canonicalize_cse_sccp` | 0 | success | 613 ms |
| `seeds\cf\branch.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 609 ms |
| `seeds\cf\branch.mlir` | `affine_lowering_stress` | 0 | success | 605 ms |
| `seeds\cf\branch.mlir` | `scf_to_cf_stress` | 0 | success | 605 ms |
| `seeds\cf\branch.mlir` | `vector_lowering_stress` | 0 | success | 618 ms |
| `seeds\cf\branch.mlir` | `bufferization_probe` | 0 | success | 612 ms |
| `seeds\cf\branch.mlir` | `linalg_affine_probe` | 0 | success | 619 ms |
| `seeds\cf\branch.mlir` | `gpu_parallel_probe` | 0 | success | 590 ms |
| `seeds\demo_failures\assertion_sensitive.mlir` | `parse_verify` | 0 | success | 680 ms |
| `seeds\demo_failures\assertion_sensitive.mlir` | `canonicalize_cse_sccp` | 0 | success | 753 ms |
| `seeds\demo_failures\assertion_sensitive.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 621 ms |
| `seeds\demo_failures\assertion_sensitive.mlir` | `affine_lowering_stress` | 0 | success | 606 ms |
| `seeds\demo_failures\assertion_sensitive.mlir` | `scf_to_cf_stress` | 0 | success | 607 ms |
| `seeds\demo_failures\assertion_sensitive.mlir` | `vector_lowering_stress` | 0 | success | 603 ms |
| `seeds\demo_failures\assertion_sensitive.mlir` | `bufferization_probe` | 0 | success | 602 ms |
| `seeds\demo_failures\assertion_sensitive.mlir` | `linalg_affine_probe` | 0 | success | 602 ms |
| `seeds\demo_failures\assertion_sensitive.mlir` | `gpu_parallel_probe` | 0 | success | 626 ms |
| `seeds\demo_failures\dialect_sensitive.mlir` | `parse_verify` | 0 | success | 631 ms |
| `seeds\demo_failures\dialect_sensitive.mlir` | `canonicalize_cse_sccp` | 0 | success | 671 ms |
| `seeds\demo_failures\dialect_sensitive.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 601 ms |
| `seeds\demo_failures\dialect_sensitive.mlir` | `affine_lowering_stress` | 0 | success | 613 ms |
| `seeds\demo_failures\dialect_sensitive.mlir` | `scf_to_cf_stress` | 0 | success | 601 ms |
| `seeds\demo_failures\dialect_sensitive.mlir` | `vector_lowering_stress` | 0 | success | 588 ms |
| `seeds\demo_failures\dialect_sensitive.mlir` | `bufferization_probe` | 0 | success | 639 ms |
| `seeds\demo_failures\dialect_sensitive.mlir` | `linalg_affine_probe` | 0 | success | 601 ms |
| `seeds\demo_failures\dialect_sensitive.mlir` | `gpu_parallel_probe` | 0 | success | 666 ms |
| `seeds\demo_failures\parser_sensitive.mlir` | `parse_verify` | 0 | success | 634 ms |
| `seeds\demo_failures\parser_sensitive.mlir` | `canonicalize_cse_sccp` | 0 | success | 616 ms |
| `seeds\demo_failures\parser_sensitive.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 649 ms |
| `seeds\demo_failures\parser_sensitive.mlir` | `affine_lowering_stress` | 0 | success | 598 ms |
| `seeds\demo_failures\parser_sensitive.mlir` | `scf_to_cf_stress` | 0 | success | 621 ms |
| `seeds\demo_failures\parser_sensitive.mlir` | `vector_lowering_stress` | 0 | success | 589 ms |
| `seeds\demo_failures\parser_sensitive.mlir` | `bufferization_probe` | 0 | success | 666 ms |
| `seeds\demo_failures\parser_sensitive.mlir` | `linalg_affine_probe` | 0 | success | 667 ms |
| `seeds\demo_failures\parser_sensitive.mlir` | `gpu_parallel_probe` | 0 | success | 608 ms |
| `seeds\demo_failures\type_sensitive.mlir` | `parse_verify` | 0 | success | 613 ms |
| `seeds\demo_failures\type_sensitive.mlir` | `canonicalize_cse_sccp` | 0 | success | 660 ms |
| `seeds\demo_failures\type_sensitive.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 598 ms |
| `seeds\demo_failures\type_sensitive.mlir` | `affine_lowering_stress` | 0 | success | 654 ms |
| `seeds\demo_failures\type_sensitive.mlir` | `scf_to_cf_stress` | 0 | success | 618 ms |
| `seeds\demo_failures\type_sensitive.mlir` | `vector_lowering_stress` | 0 | success | 634 ms |
| `seeds\demo_failures\type_sensitive.mlir` | `bufferization_probe` | 0 | success | 639 ms |
| `seeds\demo_failures\type_sensitive.mlir` | `linalg_affine_probe` | 0 | success | 607 ms |
| `seeds\demo_failures\type_sensitive.mlir` | `gpu_parallel_probe` | 0 | success | 642 ms |
| `seeds\demo_failures\verifier_sensitive.mlir` | `parse_verify` | 0 | success | 609 ms |
| `seeds\demo_failures\verifier_sensitive.mlir` | `canonicalize_cse_sccp` | 0 | success | 636 ms |
| `seeds\demo_failures\verifier_sensitive.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 666 ms |
| `seeds\demo_failures\verifier_sensitive.mlir` | `affine_lowering_stress` | 0 | success | 645 ms |
| `seeds\demo_failures\verifier_sensitive.mlir` | `scf_to_cf_stress` | 0 | success | 675 ms |
| `seeds\demo_failures\verifier_sensitive.mlir` | `vector_lowering_stress` | 0 | success | 642 ms |
| `seeds\demo_failures\verifier_sensitive.mlir` | `bufferization_probe` | 0 | success | 640 ms |
| `seeds\demo_failures\verifier_sensitive.mlir` | `linalg_affine_probe` | 0 | success | 613 ms |
| `seeds\demo_failures\verifier_sensitive.mlir` | `gpu_parallel_probe` | 0 | success | 644 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `parse_verify` | 0 | success | 652 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `canonicalize_cse_sccp` | 0 | success | 636 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 637 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `affine_lowering_stress` | 0 | success | 597 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `scf_to_cf_stress` | 0 | success | 634 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `vector_lowering_stress` | 0 | success | 666 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `bufferization_probe` | 0 | success | 635 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `linalg_affine_probe` | 0 | success | 706 ms |
| `seeds\issue_repros\llvm_113021_linalg_negative_indexing_tile.mlir` | `gpu_parallel_probe` | 0 | success | 641 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `parse_verify` | 1 | unknown failure | 647 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 646 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 615 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `affine_lowering_stress` | 1 | unknown failure | 626 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 649 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `vector_lowering_stress` | 1 | unknown failure | 631 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `bufferization_probe` | 1 | unknown failure | 662 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `linalg_affine_probe` | 1 | unknown failure | 613 ms |
| `seeds\issue_repros\llvm_119868_linalg_fusion_multiuse_assert.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 623 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `parse_verify` | 1 | unknown failure | 668 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 601 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 631 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `affine_lowering_stress` | 1 | unknown failure | 619 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 632 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `vector_lowering_stress` | 1 | unknown failure | 636 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `bufferization_probe` | 1 | unknown failure | 629 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `linalg_affine_probe` | 1 | unknown failure | 602 ms |
| `seeds\issue_repros\llvm_168179_custom_stride_read_crash.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 603 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `parse_verify` | 0 | success | 635 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `canonicalize_cse_sccp` | 0 | success | 662 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 639 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `affine_lowering_stress` | 0 | success | 606 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `scf_to_cf_stress` | 0 | success | 618 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `vector_lowering_stress` | 0 | success | 613 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `bufferization_probe` | 0 | success | 636 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `linalg_affine_probe` | 0 | success | 626 ms |
| `seeds\issue_repros\llvm_168695_vector_scatter_tensor_canonicalize.mlir` | `gpu_parallel_probe` | 0 | success | 602 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `parse_verify` | 1 | unknown failure | 626 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 698 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 637 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `affine_lowering_stress` | 1 | unknown failure | 658 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 663 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `vector_lowering_stress` | 1 | unknown failure | 608 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `bufferization_probe` | 1 | unknown failure | 598 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `linalg_affine_probe` | 1 | unknown failure | 616 ms |
| `seeds\issue_repros\llvm_60210_transform_tile_reduction_assert.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 643 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `parse_verify` | 0 | success | 633 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `canonicalize_cse_sccp` | 0 | success | 652 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 638 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `affine_lowering_stress` | 0 | success | 630 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `scf_to_cf_stress` | 0 | success | 654 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `vector_lowering_stress` | 0 | success | 680 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `bufferization_probe` | 0 | success | 650 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `linalg_affine_probe` | 0 | success | 616 ms |
| `seeds\issue_repros\llvm_60569_unregistered_dependent_dialect.mlir` | `gpu_parallel_probe` | 0 | success | 600 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `parse_verify` | 1 | unknown failure | 635 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 611 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 646 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `affine_lowering_stress` | 1 | unknown failure | 628 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 614 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `vector_lowering_stress` | 1 | unknown failure | 591 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `bufferization_probe` | 1 | unknown failure | 666 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `linalg_affine_probe` | 1 | unknown failure | 665 ms |
| `seeds\issue_repros\llvm_61085_tosa_linalg_affine_assert.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 600 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `parse_verify` | 1 | unknown failure | 677 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 660 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 691 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `affine_lowering_stress` | 1 | unknown failure | 615 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 638 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `vector_lowering_stress` | 1 | unknown failure | 588 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `bufferization_probe` | 1 | unknown failure | 649 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `linalg_affine_probe` | 1 | unknown failure | 622 ms |
| `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 650 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `parse_verify` | 0 | success | 643 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `canonicalize_cse_sccp` | 0 | success | 670 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 587 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `affine_lowering_stress` | 0 | success | 632 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `scf_to_cf_stress` | 0 | success | 645 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `vector_lowering_stress` | 0 | success | 639 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `bufferization_probe` | 0 | success | 687 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `linalg_affine_probe` | 0 | success | 615 ms |
| `seeds\issue_repros\llvm_82382_linalg_parallel_loops_to_gpu_crash.mlir` | `gpu_parallel_probe` | 0 | success | 604 ms |
| `seeds\linalg\fill_tensor.mlir` | `parse_verify` | 0 | success | 646 ms |
| `seeds\linalg\fill_tensor.mlir` | `canonicalize_cse_sccp` | 0 | success | 613 ms |
| `seeds\linalg\fill_tensor.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 618 ms |
| `seeds\linalg\fill_tensor.mlir` | `affine_lowering_stress` | 0 | success | 599 ms |
| `seeds\linalg\fill_tensor.mlir` | `scf_to_cf_stress` | 0 | success | 622 ms |
| `seeds\linalg\fill_tensor.mlir` | `vector_lowering_stress` | 0 | success | 663 ms |
| `seeds\linalg\fill_tensor.mlir` | `bufferization_probe` | 0 | success | 590 ms |
| `seeds\linalg\fill_tensor.mlir` | `linalg_affine_probe` | 0 | success | 619 ms |
| `seeds\linalg\fill_tensor.mlir` | `gpu_parallel_probe` | 0 | success | 641 ms |
| `seeds\real_official\affine\affine_data_copy.mlir` | `parse_verify` | 1 | unknown failure | 646 ms |
| `seeds\real_official\affine\affine_data_copy.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 640 ms |
| `seeds\real_official\affine\affine_data_copy.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 616 ms |
| `seeds\real_official\affine\affine_data_copy.mlir` | `affine_lowering_stress` | 1 | unknown failure | 596 ms |
| `seeds\real_official\affine\affine_data_copy.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 624 ms |
| `seeds\real_official\affine\affine_data_copy.mlir` | `vector_lowering_stress` | 1 | unknown failure | 593 ms |
| `seeds\real_official\affine\affine_data_copy.mlir` | `bufferization_probe` | 1 | unknown failure | 625 ms |
| `seeds\real_official\affine\affine_data_copy.mlir` | `linalg_affine_probe` | 1 | unknown failure | 644 ms |
| `seeds\real_official\affine\affine_data_copy.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 653 ms |
| `seeds\real_official\affine\canonicalize.mlir` | `parse_verify` | 1 | dialect registration | 644 ms |
| `seeds\real_official\affine\canonicalize.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 629 ms |
| `seeds\real_official\affine\canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 637 ms |
| `seeds\real_official\affine\canonicalize.mlir` | `affine_lowering_stress` | 1 | dialect registration | 666 ms |
| `seeds\real_official\affine\canonicalize.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 599 ms |
| `seeds\real_official\affine\canonicalize.mlir` | `vector_lowering_stress` | 1 | dialect registration | 596 ms |
| `seeds\real_official\affine\canonicalize.mlir` | `bufferization_probe` | 1 | dialect registration | 663 ms |
| `seeds\real_official\affine\canonicalize.mlir` | `linalg_affine_probe` | 1 | dialect registration | 627 ms |
| `seeds\real_official\affine\canonicalize.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 581 ms |
| `seeds\real_official\affine\invalid.mlir` | `parse_verify` | 1 | dialect registration | 641 ms |
| `seeds\real_official\affine\invalid.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 626 ms |
| `seeds\real_official\affine\invalid.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 655 ms |
| `seeds\real_official\affine\invalid.mlir` | `affine_lowering_stress` | 1 | dialect registration | 628 ms |
| `seeds\real_official\affine\invalid.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 618 ms |
| `seeds\real_official\affine\invalid.mlir` | `vector_lowering_stress` | 1 | dialect registration | 677 ms |
| `seeds\real_official\affine\invalid.mlir` | `bufferization_probe` | 1 | dialect registration | 647 ms |
| `seeds\real_official\affine\invalid.mlir` | `linalg_affine_probe` | 1 | dialect registration | 645 ms |
| `seeds\real_official\affine\invalid.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 661 ms |
| `seeds\real_official\affine\vectorize_1d.mlir` | `parse_verify` | 0 | success | 749 ms |
| `seeds\real_official\affine\vectorize_1d.mlir` | `canonicalize_cse_sccp` | 0 | success | 598 ms |
| `seeds\real_official\affine\vectorize_1d.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 642 ms |
| `seeds\real_official\affine\vectorize_1d.mlir` | `affine_lowering_stress` | 0 | success | 624 ms |
| `seeds\real_official\affine\vectorize_1d.mlir` | `scf_to_cf_stress` | 0 | success | 603 ms |
| `seeds\real_official\affine\vectorize_1d.mlir` | `vector_lowering_stress` | 0 | success | 651 ms |
| `seeds\real_official\affine\vectorize_1d.mlir` | `bufferization_probe` | 0 | success | 627 ms |
| `seeds\real_official\affine\vectorize_1d.mlir` | `linalg_affine_probe` | 0 | success | 644 ms |
| `seeds\real_official\affine\vectorize_1d.mlir` | `gpu_parallel_probe` | 0 | success | 654 ms |
| `seeds\real_official\arith\constant_fold.mlir` | `parse_verify` | 0 | success | 570 ms |
| `seeds\real_official\arith\constant_fold.mlir` | `canonicalize_cse_sccp` | 0 | success | 586 ms |
| `seeds\real_official\arith\constant_fold.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 646 ms |
| `seeds\real_official\arith\constant_fold.mlir` | `affine_lowering_stress` | 0 | success | 622 ms |
| `seeds\real_official\arith\constant_fold.mlir` | `scf_to_cf_stress` | 0 | success | 731 ms |
| `seeds\real_official\arith\constant_fold.mlir` | `vector_lowering_stress` | 0 | success | 647 ms |
| `seeds\real_official\arith\constant_fold.mlir` | `bufferization_probe` | 0 | success | 651 ms |
| `seeds\real_official\arith\constant_fold.mlir` | `linalg_affine_probe` | 0 | success | 691 ms |
| `seeds\real_official\arith\constant_fold.mlir` | `gpu_parallel_probe` | 0 | success | 639 ms |
| `seeds\real_official\arith\int_range_loop_iter_args.mlir` | `parse_verify` | 0 | success | 642 ms |
| `seeds\real_official\arith\int_range_loop_iter_args.mlir` | `canonicalize_cse_sccp` | 0 | success | 649 ms |
| `seeds\real_official\arith\int_range_loop_iter_args.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 642 ms |
| `seeds\real_official\arith\int_range_loop_iter_args.mlir` | `affine_lowering_stress` | 0 | success | 628 ms |
| `seeds\real_official\arith\int_range_loop_iter_args.mlir` | `scf_to_cf_stress` | 0 | success | 626 ms |
| `seeds\real_official\arith\int_range_loop_iter_args.mlir` | `vector_lowering_stress` | 0 | success | 751 ms |
| `seeds\real_official\arith\int_range_loop_iter_args.mlir` | `bufferization_probe` | 0 | success | 619 ms |
| `seeds\real_official\arith\int_range_loop_iter_args.mlir` | `linalg_affine_probe` | 0 | success | 609 ms |
| `seeds\real_official\arith\int_range_loop_iter_args.mlir` | `gpu_parallel_probe` | 0 | success | 669 ms |
| `seeds\real_official\arith\int_range_opts_bug_119045.mlir` | `parse_verify` | 0 | success | 647 ms |
| `seeds\real_official\arith\int_range_opts_bug_119045.mlir` | `canonicalize_cse_sccp` | 0 | success | 749 ms |
| `seeds\real_official\arith\int_range_opts_bug_119045.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 634 ms |
| `seeds\real_official\arith\int_range_opts_bug_119045.mlir` | `affine_lowering_stress` | 0 | success | 600 ms |
| `seeds\real_official\arith\int_range_opts_bug_119045.mlir` | `scf_to_cf_stress` | 0 | success | 637 ms |
| `seeds\real_official\arith\int_range_opts_bug_119045.mlir` | `vector_lowering_stress` | 0 | success | 755 ms |
| `seeds\real_official\arith\int_range_opts_bug_119045.mlir` | `bufferization_probe` | 0 | success | 619 ms |
| `seeds\real_official\arith\int_range_opts_bug_119045.mlir` | `linalg_affine_probe` | 0 | success | 600 ms |
| `seeds\real_official\arith\int_range_opts_bug_119045.mlir` | `gpu_parallel_probe` | 0 | success | 559 ms |
| `seeds\real_official\arith\int_range_opts_crash.mlir` | `parse_verify` | 0 | success | 624 ms |
| `seeds\real_official\arith\int_range_opts_crash.mlir` | `canonicalize_cse_sccp` | 0 | success | 630 ms |
| `seeds\real_official\arith\int_range_opts_crash.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 640 ms |
| `seeds\real_official\arith\int_range_opts_crash.mlir` | `affine_lowering_stress` | 0 | success | 625 ms |
| `seeds\real_official\arith\int_range_opts_crash.mlir` | `scf_to_cf_stress` | 0 | success | 684 ms |
| `seeds\real_official\arith\int_range_opts_crash.mlir` | `vector_lowering_stress` | 0 | success | 644 ms |
| `seeds\real_official\arith\int_range_opts_crash.mlir` | `bufferization_probe` | 0 | success | 640 ms |
| `seeds\real_official\arith\int_range_opts_crash.mlir` | `linalg_affine_probe` | 0 | success | 584 ms |
| `seeds\real_official\arith\int_range_opts_crash.mlir` | `gpu_parallel_probe` | 0 | success | 600 ms |
| `seeds\real_official\arith\vscale_constants.mlir` | `parse_verify` | 0 | success | 620 ms |
| `seeds\real_official\arith\vscale_constants.mlir` | `canonicalize_cse_sccp` | 0 | success | 662 ms |
| `seeds\real_official\arith\vscale_constants.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 638 ms |
| `seeds\real_official\arith\vscale_constants.mlir` | `affine_lowering_stress` | 0 | success | 613 ms |
| `seeds\real_official\arith\vscale_constants.mlir` | `scf_to_cf_stress` | 0 | success | 611 ms |
| `seeds\real_official\arith\vscale_constants.mlir` | `vector_lowering_stress` | 0 | success | 645 ms |
| `seeds\real_official\arith\vscale_constants.mlir` | `bufferization_probe` | 0 | success | 722 ms |
| `seeds\real_official\arith\vscale_constants.mlir` | `linalg_affine_probe` | 0 | success | 623 ms |
| `seeds\real_official\arith\vscale_constants.mlir` | `gpu_parallel_probe` | 0 | success | 624 ms |
| `seeds\real_official\async\canonicalize.mlir` | `parse_verify` | 0 | success | 595 ms |
| `seeds\real_official\async\canonicalize.mlir` | `canonicalize_cse_sccp` | 0 | success | 640 ms |
| `seeds\real_official\async\canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 637 ms |
| `seeds\real_official\async\canonicalize.mlir` | `affine_lowering_stress` | 0 | success | 582 ms |
| `seeds\real_official\async\canonicalize.mlir` | `scf_to_cf_stress` | 0 | success | 574 ms |
| `seeds\real_official\async\canonicalize.mlir` | `vector_lowering_stress` | 0 | success | 623 ms |
| `seeds\real_official\async\canonicalize.mlir` | `bufferization_probe` | 0 | success | 635 ms |
| `seeds\real_official\async\canonicalize.mlir` | `linalg_affine_probe` | 0 | success | 599 ms |
| `seeds\real_official\async\canonicalize.mlir` | `gpu_parallel_probe` | 0 | success | 609 ms |
| `seeds\real_official\async\coro.mlir` | `parse_verify` | 0 | success | 625 ms |
| `seeds\real_official\async\coro.mlir` | `canonicalize_cse_sccp` | 0 | success | 586 ms |
| `seeds\real_official\async\coro.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 708 ms |
| `seeds\real_official\async\coro.mlir` | `affine_lowering_stress` | 0 | success | 652 ms |
| `seeds\real_official\async\coro.mlir` | `scf_to_cf_stress` | 0 | success | 552 ms |
| `seeds\real_official\async\coro.mlir` | `vector_lowering_stress` | 0 | success | 586 ms |
| `seeds\real_official\async\coro.mlir` | `bufferization_probe` | 0 | success | 610 ms |
| `seeds\real_official\async\coro.mlir` | `linalg_affine_probe` | 0 | success | 610 ms |
| `seeds\real_official\async\coro.mlir` | `gpu_parallel_probe` | 0 | success | 603 ms |
| `seeds\real_official\async\verify.mlir` | `parse_verify` | 1 | parser | 597 ms |
| `seeds\real_official\async\verify.mlir` | `canonicalize_cse_sccp` | 1 | parser | 621 ms |
| `seeds\real_official\async\verify.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 601 ms |
| `seeds\real_official\async\verify.mlir` | `affine_lowering_stress` | 1 | parser | 619 ms |
| `seeds\real_official\async\verify.mlir` | `scf_to_cf_stress` | 1 | parser | 620 ms |
| `seeds\real_official\async\verify.mlir` | `vector_lowering_stress` | 1 | parser | 602 ms |
| `seeds\real_official\async\verify.mlir` | `bufferization_probe` | 1 | parser | 603 ms |
| `seeds\real_official\async\verify.mlir` | `linalg_affine_probe` | 1 | parser | 634 ms |
| `seeds\real_official\async\verify.mlir` | `gpu_parallel_probe` | 1 | parser | 724 ms |
| `seeds\real_official\bufferization\one_shot_bufferize.mlir` | `parse_verify` | 0 | success | 628 ms |
| `seeds\real_official\bufferization\one_shot_bufferize.mlir` | `canonicalize_cse_sccp` | 0 | success | 619 ms |
| `seeds\real_official\bufferization\one_shot_bufferize.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 632 ms |
| `seeds\real_official\bufferization\one_shot_bufferize.mlir` | `affine_lowering_stress` | 0 | success | 606 ms |
| `seeds\real_official\bufferization\one_shot_bufferize.mlir` | `scf_to_cf_stress` | 0 | success | 653 ms |
| `seeds\real_official\bufferization\one_shot_bufferize.mlir` | `vector_lowering_stress` | 0 | success | 622 ms |
| `seeds\real_official\bufferization\one_shot_bufferize.mlir` | `bufferization_probe` | 1 | parser | 637 ms |
| `seeds\real_official\bufferization\one_shot_bufferize.mlir` | `linalg_affine_probe` | 0 | success | 626 ms |
| `seeds\real_official\bufferization\one_shot_bufferize.mlir` | `gpu_parallel_probe` | 0 | success | 645 ms |
| `seeds\real_official\complex\attribute.mlir` | `parse_verify` | 0 | success | 640 ms |
| `seeds\real_official\complex\attribute.mlir` | `canonicalize_cse_sccp` | 0 | success | 606 ms |
| `seeds\real_official\complex\attribute.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 663 ms |
| `seeds\real_official\complex\attribute.mlir` | `affine_lowering_stress` | 0 | success | 646 ms |
| `seeds\real_official\complex\attribute.mlir` | `scf_to_cf_stress` | 0 | success | 654 ms |
| `seeds\real_official\complex\attribute.mlir` | `vector_lowering_stress` | 0 | success | 638 ms |
| `seeds\real_official\complex\attribute.mlir` | `bufferization_probe` | 0 | success | 631 ms |
| `seeds\real_official\complex\attribute.mlir` | `linalg_affine_probe` | 0 | success | 603 ms |
| `seeds\real_official\complex\attribute.mlir` | `gpu_parallel_probe` | 0 | success | 631 ms |
| `seeds\real_official\complex\invalid.mlir` | `parse_verify` | 1 | parser | 618 ms |
| `seeds\real_official\complex\invalid.mlir` | `canonicalize_cse_sccp` | 1 | parser | 634 ms |
| `seeds\real_official\complex\invalid.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 750 ms |
| `seeds\real_official\complex\invalid.mlir` | `affine_lowering_stress` | 1 | parser | 616 ms |
| `seeds\real_official\complex\invalid.mlir` | `scf_to_cf_stress` | 1 | parser | 638 ms |
| `seeds\real_official\complex\invalid.mlir` | `vector_lowering_stress` | 1 | parser | 618 ms |
| `seeds\real_official\complex\invalid.mlir` | `bufferization_probe` | 1 | parser | 619 ms |
| `seeds\real_official\complex\invalid.mlir` | `linalg_affine_probe` | 1 | parser | 608 ms |
| `seeds\real_official\complex\invalid.mlir` | `gpu_parallel_probe` | 1 | parser | 610 ms |
| `seeds\real_official\complex\ops.mlir` | `parse_verify` | 0 | success | 645 ms |
| `seeds\real_official\complex\ops.mlir` | `canonicalize_cse_sccp` | 0 | success | 597 ms |
| `seeds\real_official\complex\ops.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 614 ms |
| `seeds\real_official\complex\ops.mlir` | `affine_lowering_stress` | 0 | success | 632 ms |
| `seeds\real_official\complex\ops.mlir` | `scf_to_cf_stress` | 0 | success | 607 ms |
| `seeds\real_official\complex\ops.mlir` | `vector_lowering_stress` | 0 | success | 605 ms |
| `seeds\real_official\complex\ops.mlir` | `bufferization_probe` | 0 | success | 621 ms |
| `seeds\real_official\complex\ops.mlir` | `linalg_affine_probe` | 0 | success | 662 ms |
| `seeds\real_official\complex\ops.mlir` | `gpu_parallel_probe` | 0 | success | 594 ms |
| `seeds\real_official\complex\powi_simplify.mlir` | `parse_verify` | 0 | success | 579 ms |
| `seeds\real_official\complex\powi_simplify.mlir` | `canonicalize_cse_sccp` | 0 | success | 601 ms |
| `seeds\real_official\complex\powi_simplify.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 666 ms |
| `seeds\real_official\complex\powi_simplify.mlir` | `affine_lowering_stress` | 0 | success | 783 ms |
| `seeds\real_official\complex\powi_simplify.mlir` | `scf_to_cf_stress` | 0 | success | 625 ms |
| `seeds\real_official\complex\powi_simplify.mlir` | `vector_lowering_stress` | 0 | success | 664 ms |
| `seeds\real_official\complex\powi_simplify.mlir` | `bufferization_probe` | 0 | success | 602 ms |
| `seeds\real_official\complex\powi_simplify.mlir` | `linalg_affine_probe` | 0 | success | 633 ms |
| `seeds\real_official\complex\powi_simplify.mlir` | `gpu_parallel_probe` | 0 | success | 645 ms |
| `seeds\real_official\conversion\arith_to_llvm.mlir` | `parse_verify` | 1 | unknown failure | 621 ms |
| `seeds\real_official\conversion\arith_to_llvm.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 631 ms |
| `seeds\real_official\conversion\arith_to_llvm.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 666 ms |
| `seeds\real_official\conversion\arith_to_llvm.mlir` | `affine_lowering_stress` | 1 | unknown failure | 617 ms |
| `seeds\real_official\conversion\arith_to_llvm.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 635 ms |
| `seeds\real_official\conversion\arith_to_llvm.mlir` | `vector_lowering_stress` | 1 | unknown failure | 650 ms |
| `seeds\real_official\conversion\arith_to_llvm.mlir` | `bufferization_probe` | 1 | unknown failure | 616 ms |
| `seeds\real_official\conversion\arith_to_llvm.mlir` | `linalg_affine_probe` | 1 | unknown failure | 622 ms |
| `seeds\real_official\conversion\arith_to_llvm.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 597 ms |
| `seeds\real_official\conversion\convert_funcs.mlir` | `parse_verify` | 1 | parser | 625 ms |
| `seeds\real_official\conversion\convert_funcs.mlir` | `canonicalize_cse_sccp` | 1 | parser | 606 ms |
| `seeds\real_official\conversion\convert_funcs.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 624 ms |
| `seeds\real_official\conversion\convert_funcs.mlir` | `affine_lowering_stress` | 1 | parser | 664 ms |
| `seeds\real_official\conversion\convert_funcs.mlir` | `scf_to_cf_stress` | 1 | parser | 637 ms |
| `seeds\real_official\conversion\convert_funcs.mlir` | `vector_lowering_stress` | 1 | parser | 627 ms |
| `seeds\real_official\conversion\convert_funcs.mlir` | `bufferization_probe` | 1 | parser | 630 ms |
| `seeds\real_official\conversion\convert_funcs.mlir` | `linalg_affine_probe` | 1 | parser | 667 ms |
| `seeds\real_official\conversion\convert_funcs.mlir` | `gpu_parallel_probe` | 1 | parser | 608 ms |
| `seeds\real_official\conversion\convert_to_standard.mlir` | `parse_verify` | 0 | success | 633 ms |
| `seeds\real_official\conversion\convert_to_standard.mlir` | `canonicalize_cse_sccp` | 0 | success | 650 ms |
| `seeds\real_official\conversion\convert_to_standard.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 627 ms |
| `seeds\real_official\conversion\convert_to_standard.mlir` | `affine_lowering_stress` | 0 | success | 652 ms |
| `seeds\real_official\conversion\convert_to_standard.mlir` | `scf_to_cf_stress` | 0 | success | 617 ms |
| `seeds\real_official\conversion\convert_to_standard.mlir` | `vector_lowering_stress` | 0 | success | 612 ms |
| `seeds\real_official\conversion\convert_to_standard.mlir` | `bufferization_probe` | 0 | success | 597 ms |
| `seeds\real_official\conversion\convert_to_standard.mlir` | `linalg_affine_probe` | 0 | success | 668 ms |
| `seeds\real_official\conversion\convert_to_standard.mlir` | `gpu_parallel_probe` | 0 | success | 657 ms |
| `seeds\real_official\conversion\func_to_llvm_convert_funcs_extra.mlir` | `parse_verify` | 1 | parser | 670 ms |
| `seeds\real_official\conversion\func_to_llvm_convert_funcs_extra.mlir` | `canonicalize_cse_sccp` | 1 | parser | 642 ms |
| `seeds\real_official\conversion\func_to_llvm_convert_funcs_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 602 ms |
| `seeds\real_official\conversion\func_to_llvm_convert_funcs_extra.mlir` | `affine_lowering_stress` | 1 | parser | 620 ms |
| `seeds\real_official\conversion\func_to_llvm_convert_funcs_extra.mlir` | `scf_to_cf_stress` | 1 | parser | 616 ms |
| `seeds\real_official\conversion\func_to_llvm_convert_funcs_extra.mlir` | `vector_lowering_stress` | 1 | parser | 690 ms |
| `seeds\real_official\conversion\func_to_llvm_convert_funcs_extra.mlir` | `bufferization_probe` | 1 | parser | 612 ms |
| `seeds\real_official\conversion\func_to_llvm_convert_funcs_extra.mlir` | `linalg_affine_probe` | 1 | parser | 639 ms |
| `seeds\real_official\conversion\func_to_llvm_convert_funcs_extra.mlir` | `gpu_parallel_probe` | 1 | parser | 617 ms |
| `seeds\real_official\conversion\gpu_to_nvvm.mlir` | `parse_verify` | 1 | unknown failure | 642 ms |
| `seeds\real_official\conversion\gpu_to_nvvm.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 626 ms |
| `seeds\real_official\conversion\gpu_to_nvvm.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 662 ms |
| `seeds\real_official\conversion\gpu_to_nvvm.mlir` | `affine_lowering_stress` | 1 | unknown failure | 624 ms |
| `seeds\real_official\conversion\gpu_to_nvvm.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 637 ms |
| `seeds\real_official\conversion\gpu_to_nvvm.mlir` | `vector_lowering_stress` | 1 | unknown failure | 622 ms |
| `seeds\real_official\conversion\gpu_to_nvvm.mlir` | `bufferization_probe` | 1 | unknown failure | 637 ms |
| `seeds\real_official\conversion\gpu_to_nvvm.mlir` | `linalg_affine_probe` | 1 | unknown failure | 659 ms |
| `seeds\real_official\conversion\gpu_to_nvvm.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 635 ms |
| `seeds\real_official\conversion\gpu_to_nvvm_extra.mlir` | `parse_verify` | 1 | unknown failure | 674 ms |
| `seeds\real_official\conversion\gpu_to_nvvm_extra.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 647 ms |
| `seeds\real_official\conversion\gpu_to_nvvm_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 634 ms |
| `seeds\real_official\conversion\gpu_to_nvvm_extra.mlir` | `affine_lowering_stress` | 1 | unknown failure | 646 ms |
| `seeds\real_official\conversion\gpu_to_nvvm_extra.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 639 ms |
| `seeds\real_official\conversion\gpu_to_nvvm_extra.mlir` | `vector_lowering_stress` | 1 | unknown failure | 611 ms |
| `seeds\real_official\conversion\gpu_to_nvvm_extra.mlir` | `bufferization_probe` | 1 | unknown failure | 593 ms |
| `seeds\real_official\conversion\gpu_to_nvvm_extra.mlir` | `linalg_affine_probe` | 1 | unknown failure | 677 ms |
| `seeds\real_official\conversion\gpu_to_nvvm_extra.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 671 ms |
| `seeds\real_official\conversion\math_to_llvm.mlir` | `parse_verify` | 1 | unknown failure | 620 ms |
| `seeds\real_official\conversion\math_to_llvm.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 654 ms |
| `seeds\real_official\conversion\math_to_llvm.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 618 ms |
| `seeds\real_official\conversion\math_to_llvm.mlir` | `affine_lowering_stress` | 1 | unknown failure | 656 ms |
| `seeds\real_official\conversion\math_to_llvm.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 650 ms |
| `seeds\real_official\conversion\math_to_llvm.mlir` | `vector_lowering_stress` | 1 | unknown failure | 642 ms |
| `seeds\real_official\conversion\math_to_llvm.mlir` | `bufferization_probe` | 1 | unknown failure | 595 ms |
| `seeds\real_official\conversion\math_to_llvm.mlir` | `linalg_affine_probe` | 1 | unknown failure | 634 ms |
| `seeds\real_official\conversion\math_to_llvm.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 623 ms |
| `seeds\real_official\conversion\memref_to_llvm.mlir` | `parse_verify` | 0 | success | 626 ms |
| `seeds\real_official\conversion\memref_to_llvm.mlir` | `canonicalize_cse_sccp` | 0 | success | 676 ms |
| `seeds\real_official\conversion\memref_to_llvm.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 675 ms |
| `seeds\real_official\conversion\memref_to_llvm.mlir` | `affine_lowering_stress` | 0 | success | 648 ms |
| `seeds\real_official\conversion\memref_to_llvm.mlir` | `scf_to_cf_stress` | 0 | success | 630 ms |
| `seeds\real_official\conversion\memref_to_llvm.mlir` | `vector_lowering_stress` | 0 | success | 618 ms |
| `seeds\real_official\conversion\memref_to_llvm.mlir` | `bufferization_probe` | 0 | success | 642 ms |
| `seeds\real_official\conversion\memref_to_llvm.mlir` | `linalg_affine_probe` | 0 | success | 637 ms |
| `seeds\real_official\conversion\memref_to_llvm.mlir` | `gpu_parallel_probe` | 0 | success | 662 ms |
| `seeds\real_official\conversion\memref_to_llvm_extra.mlir` | `parse_verify` | 0 | success | 631 ms |
| `seeds\real_official\conversion\memref_to_llvm_extra.mlir` | `canonicalize_cse_sccp` | 0 | success | 660 ms |
| `seeds\real_official\conversion\memref_to_llvm_extra.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 638 ms |
| `seeds\real_official\conversion\memref_to_llvm_extra.mlir` | `affine_lowering_stress` | 0 | success | 641 ms |
| `seeds\real_official\conversion\memref_to_llvm_extra.mlir` | `scf_to_cf_stress` | 0 | success | 677 ms |
| `seeds\real_official\conversion\memref_to_llvm_extra.mlir` | `vector_lowering_stress` | 0 | success | 686 ms |
| `seeds\real_official\conversion\memref_to_llvm_extra.mlir` | `bufferization_probe` | 0 | success | 672 ms |
| `seeds\real_official\conversion\memref_to_llvm_extra.mlir` | `linalg_affine_probe` | 0 | success | 637 ms |
| `seeds\real_official\conversion\memref_to_llvm_extra.mlir` | `gpu_parallel_probe` | 0 | success | 647 ms |
| `seeds\real_official\conversion\module_opencl.mlir` | `parse_verify` | 1 | dialect registration | 601 ms |
| `seeds\real_official\conversion\module_opencl.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 623 ms |
| `seeds\real_official\conversion\module_opencl.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 635 ms |
| `seeds\real_official\conversion\module_opencl.mlir` | `affine_lowering_stress` | 1 | dialect registration | 666 ms |
| `seeds\real_official\conversion\module_opencl.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 620 ms |
| `seeds\real_official\conversion\module_opencl.mlir` | `vector_lowering_stress` | 1 | dialect registration | 665 ms |
| `seeds\real_official\conversion\module_opencl.mlir` | `bufferization_probe` | 1 | dialect registration | 629 ms |
| `seeds\real_official\conversion\module_opencl.mlir` | `linalg_affine_probe` | 1 | dialect registration | 662 ms |
| `seeds\real_official\conversion\module_opencl.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 649 ms |
| `seeds\real_official\conversion\scf_to_gpu_parallel_loop.mlir` | `parse_verify` | 0 | success | 598 ms |
| `seeds\real_official\conversion\scf_to_gpu_parallel_loop.mlir` | `canonicalize_cse_sccp` | 0 | success | 681 ms |
| `seeds\real_official\conversion\scf_to_gpu_parallel_loop.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 629 ms |
| `seeds\real_official\conversion\scf_to_gpu_parallel_loop.mlir` | `affine_lowering_stress` | 0 | success | 694 ms |
| `seeds\real_official\conversion\scf_to_gpu_parallel_loop.mlir` | `scf_to_cf_stress` | 0 | success | 604 ms |
| `seeds\real_official\conversion\scf_to_gpu_parallel_loop.mlir` | `vector_lowering_stress` | 0 | success | 619 ms |
| `seeds\real_official\conversion\scf_to_gpu_parallel_loop.mlir` | `bufferization_probe` | 0 | success | 660 ms |
| `seeds\real_official\conversion\scf_to_gpu_parallel_loop.mlir` | `linalg_affine_probe` | 0 | success | 641 ms |
| `seeds\real_official\conversion\scf_to_gpu_parallel_loop.mlir` | `gpu_parallel_probe` | 0 | success | 644 ms |
| `seeds\real_official\conversion\scf_to_openmp.mlir` | `parse_verify` | 0 | success | 630 ms |
| `seeds\real_official\conversion\scf_to_openmp.mlir` | `canonicalize_cse_sccp` | 0 | success | 585 ms |
| `seeds\real_official\conversion\scf_to_openmp.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 665 ms |
| `seeds\real_official\conversion\scf_to_openmp.mlir` | `affine_lowering_stress` | 0 | success | 656 ms |
| `seeds\real_official\conversion\scf_to_openmp.mlir` | `scf_to_cf_stress` | 0 | success | 645 ms |
| `seeds\real_official\conversion\scf_to_openmp.mlir` | `vector_lowering_stress` | 0 | success | 665 ms |
| `seeds\real_official\conversion\scf_to_openmp.mlir` | `bufferization_probe` | 0 | success | 676 ms |
| `seeds\real_official\conversion\scf_to_openmp.mlir` | `linalg_affine_probe` | 0 | success | 648 ms |
| `seeds\real_official\conversion\scf_to_openmp.mlir` | `gpu_parallel_probe` | 0 | success | 707 ms |
| `seeds\real_official\conversion\tosa_to_linalg.mlir` | `parse_verify` | 1 | parser | 655 ms |
| `seeds\real_official\conversion\tosa_to_linalg.mlir` | `canonicalize_cse_sccp` | 1 | parser | 651 ms |
| `seeds\real_official\conversion\tosa_to_linalg.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 634 ms |
| `seeds\real_official\conversion\tosa_to_linalg.mlir` | `affine_lowering_stress` | 1 | parser | 659 ms |
| `seeds\real_official\conversion\tosa_to_linalg.mlir` | `scf_to_cf_stress` | 1 | parser | 624 ms |
| `seeds\real_official\conversion\tosa_to_linalg.mlir` | `vector_lowering_stress` | 1 | parser | 651 ms |
| `seeds\real_official\conversion\tosa_to_linalg.mlir` | `bufferization_probe` | 1 | parser | 667 ms |
| `seeds\real_official\conversion\tosa_to_linalg.mlir` | `linalg_affine_probe` | 1 | parser | 614 ms |
| `seeds\real_official\conversion\tosa_to_linalg.mlir` | `gpu_parallel_probe` | 1 | parser | 637 ms |
| `seeds\real_official\conversion\tosa_to_linalg_extra.mlir` | `parse_verify` | 1 | parser | 647 ms |
| `seeds\real_official\conversion\tosa_to_linalg_extra.mlir` | `canonicalize_cse_sccp` | 1 | parser | 615 ms |
| `seeds\real_official\conversion\tosa_to_linalg_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 628 ms |
| `seeds\real_official\conversion\tosa_to_linalg_extra.mlir` | `affine_lowering_stress` | 1 | parser | 666 ms |
| `seeds\real_official\conversion\tosa_to_linalg_extra.mlir` | `scf_to_cf_stress` | 1 | parser | 668 ms |
| `seeds\real_official\conversion\tosa_to_linalg_extra.mlir` | `vector_lowering_stress` | 1 | parser | 629 ms |
| `seeds\real_official\conversion\tosa_to_linalg_extra.mlir` | `bufferization_probe` | 1 | parser | 631 ms |
| `seeds\real_official\conversion\tosa_to_linalg_extra.mlir` | `linalg_affine_probe` | 1 | parser | 687 ms |
| `seeds\real_official\conversion\tosa_to_linalg_extra.mlir` | `gpu_parallel_probe` | 1 | parser | 652 ms |
| `seeds\real_official\conversion\vector_to_llvm.mlir` | `parse_verify` | 1 | unknown failure | 626 ms |
| `seeds\real_official\conversion\vector_to_llvm.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 652 ms |
| `seeds\real_official\conversion\vector_to_llvm.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 641 ms |
| `seeds\real_official\conversion\vector_to_llvm.mlir` | `affine_lowering_stress` | 1 | unknown failure | 632 ms |
| `seeds\real_official\conversion\vector_to_llvm.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 647 ms |
| `seeds\real_official\conversion\vector_to_llvm.mlir` | `vector_lowering_stress` | 1 | unknown failure | 641 ms |
| `seeds\real_official\conversion\vector_to_llvm.mlir` | `bufferization_probe` | 1 | unknown failure | 597 ms |
| `seeds\real_official\conversion\vector_to_llvm.mlir` | `linalg_affine_probe` | 1 | unknown failure | 620 ms |
| `seeds\real_official\conversion\vector_to_llvm.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 743 ms |
| `seeds\real_official\conversion\vector_to_llvm_extra.mlir` | `parse_verify` | 1 | unknown failure | 669 ms |
| `seeds\real_official\conversion\vector_to_llvm_extra.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 630 ms |
| `seeds\real_official\conversion\vector_to_llvm_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 643 ms |
| `seeds\real_official\conversion\vector_to_llvm_extra.mlir` | `affine_lowering_stress` | 1 | unknown failure | 777 ms |
| `seeds\real_official\conversion\vector_to_llvm_extra.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 659 ms |
| `seeds\real_official\conversion\vector_to_llvm_extra.mlir` | `vector_lowering_stress` | 1 | unknown failure | 640 ms |
| `seeds\real_official\conversion\vector_to_llvm_extra.mlir` | `bufferization_probe` | 1 | unknown failure | 632 ms |
| `seeds\real_official\conversion\vector_to_llvm_extra.mlir` | `linalg_affine_probe` | 1 | unknown failure | 627 ms |
| `seeds\real_official\conversion\vector_to_llvm_extra.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 654 ms |
| `seeds\real_official\gpu\bufferization_buffer_deallocation.mlir` | `parse_verify` | 0 | success | 662 ms |
| `seeds\real_official\gpu\bufferization_buffer_deallocation.mlir` | `canonicalize_cse_sccp` | 0 | success | 640 ms |
| `seeds\real_official\gpu\bufferization_buffer_deallocation.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 632 ms |
| `seeds\real_official\gpu\bufferization_buffer_deallocation.mlir` | `affine_lowering_stress` | 0 | success | 606 ms |
| `seeds\real_official\gpu\bufferization_buffer_deallocation.mlir` | `scf_to_cf_stress` | 0 | success | 674 ms |
| `seeds\real_official\gpu\bufferization_buffer_deallocation.mlir` | `vector_lowering_stress` | 0 | success | 744 ms |
| `seeds\real_official\gpu\bufferization_buffer_deallocation.mlir` | `bufferization_probe` | 0 | success | 652 ms |
| `seeds\real_official\gpu\bufferization_buffer_deallocation.mlir` | `linalg_affine_probe` | 0 | success | 623 ms |
| `seeds\real_official\gpu\bufferization_buffer_deallocation.mlir` | `gpu_parallel_probe` | 0 | success | 640 ms |
| `seeds\real_official\gpu\canonicalize.mlir` | `parse_verify` | 1 | unknown failure | 675 ms |
| `seeds\real_official\gpu\canonicalize.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 637 ms |
| `seeds\real_official\gpu\canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 608 ms |
| `seeds\real_official\gpu\canonicalize.mlir` | `affine_lowering_stress` | 1 | unknown failure | 604 ms |
| `seeds\real_official\gpu\canonicalize.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 644 ms |
| `seeds\real_official\gpu\canonicalize.mlir` | `vector_lowering_stress` | 1 | unknown failure | 616 ms |
| `seeds\real_official\gpu\canonicalize.mlir` | `bufferization_probe` | 1 | unknown failure | 644 ms |
| `seeds\real_official\gpu\canonicalize.mlir` | `linalg_affine_probe` | 1 | unknown failure | 655 ms |
| `seeds\real_official\gpu\canonicalize.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 617 ms |
| `seeds\real_official\gpu\constant_address_space.mlir` | `parse_verify` | 1 | unknown failure | 655 ms |
| `seeds\real_official\gpu\constant_address_space.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 591 ms |
| `seeds\real_official\gpu\constant_address_space.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 665 ms |
| `seeds\real_official\gpu\constant_address_space.mlir` | `affine_lowering_stress` | 1 | unknown failure | 638 ms |
| `seeds\real_official\gpu\constant_address_space.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 635 ms |
| `seeds\real_official\gpu\constant_address_space.mlir` | `vector_lowering_stress` | 1 | unknown failure | 614 ms |
| `seeds\real_official\gpu\constant_address_space.mlir` | `bufferization_probe` | 1 | unknown failure | 639 ms |
| `seeds\real_official\gpu\constant_address_space.mlir` | `linalg_affine_probe` | 1 | unknown failure | 627 ms |
| `seeds\real_official\gpu\constant_address_space.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 666 ms |
| `seeds\real_official\gpu\invalid.mlir` | `parse_verify` | 1 | parser | 664 ms |
| `seeds\real_official\gpu\invalid.mlir` | `canonicalize_cse_sccp` | 1 | parser | 646 ms |
| `seeds\real_official\gpu\invalid.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 656 ms |
| `seeds\real_official\gpu\invalid.mlir` | `affine_lowering_stress` | 1 | parser | 654 ms |
| `seeds\real_official\gpu\invalid.mlir` | `scf_to_cf_stress` | 1 | parser | 675 ms |
| `seeds\real_official\gpu\invalid.mlir` | `vector_lowering_stress` | 1 | parser | 675 ms |
| `seeds\real_official\gpu\invalid.mlir` | `bufferization_probe` | 1 | parser | 682 ms |
| `seeds\real_official\gpu\invalid.mlir` | `linalg_affine_probe` | 1 | parser | 727 ms |
| `seeds\real_official\gpu\invalid.mlir` | `gpu_parallel_probe` | 1 | parser | 682 ms |
| `seeds\real_official\gpu\memref_to_llvm.mlir` | `parse_verify` | 0 | success | 628 ms |
| `seeds\real_official\gpu\memref_to_llvm.mlir` | `canonicalize_cse_sccp` | 0 | success | 618 ms |
| `seeds\real_official\gpu\memref_to_llvm.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 643 ms |
| `seeds\real_official\gpu\memref_to_llvm.mlir` | `affine_lowering_stress` | 0 | success | 622 ms |
| `seeds\real_official\gpu\memref_to_llvm.mlir` | `scf_to_cf_stress` | 0 | success | 623 ms |
| `seeds\real_official\gpu\memref_to_llvm.mlir` | `vector_lowering_stress` | 0 | success | 732 ms |
| `seeds\real_official\gpu\memref_to_llvm.mlir` | `bufferization_probe` | 0 | success | 619 ms |
| `seeds\real_official\gpu\memref_to_llvm.mlir` | `linalg_affine_probe` | 0 | success | 794 ms |
| `seeds\real_official\gpu\memref_to_llvm.mlir` | `gpu_parallel_probe` | 0 | success | 619 ms |
| `seeds\real_official\gpu\module_to_binary_invalid.mlir` | `parse_verify` | 0 | success | 593 ms |
| `seeds\real_official\gpu\module_to_binary_invalid.mlir` | `canonicalize_cse_sccp` | 0 | success | 630 ms |
| `seeds\real_official\gpu\module_to_binary_invalid.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 657 ms |
| `seeds\real_official\gpu\module_to_binary_invalid.mlir` | `affine_lowering_stress` | 0 | success | 636 ms |
| `seeds\real_official\gpu\module_to_binary_invalid.mlir` | `scf_to_cf_stress` | 0 | success | 629 ms |
| `seeds\real_official\gpu\module_to_binary_invalid.mlir` | `vector_lowering_stress` | 0 | success | 703 ms |
| `seeds\real_official\gpu\module_to_binary_invalid.mlir` | `bufferization_probe` | 0 | success | 649 ms |
| `seeds\real_official\gpu\module_to_binary_invalid.mlir` | `linalg_affine_probe` | 0 | success | 660 ms |
| `seeds\real_official\gpu\module_to_binary_invalid.mlir` | `gpu_parallel_probe` | 0 | success | 620 ms |
| `seeds\real_official\gpu\multiple_all_reduce.mlir` | `parse_verify` | 0 | success | 610 ms |
| `seeds\real_official\gpu\multiple_all_reduce.mlir` | `canonicalize_cse_sccp` | 0 | success | 651 ms |
| `seeds\real_official\gpu\multiple_all_reduce.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 642 ms |
| `seeds\real_official\gpu\multiple_all_reduce.mlir` | `affine_lowering_stress` | 0 | success | 636 ms |
| `seeds\real_official\gpu\multiple_all_reduce.mlir` | `scf_to_cf_stress` | 0 | success | 612 ms |
| `seeds\real_official\gpu\multiple_all_reduce.mlir` | `vector_lowering_stress` | 0 | success | 645 ms |
| `seeds\real_official\gpu\multiple_all_reduce.mlir` | `bufferization_probe` | 0 | success | 691 ms |
| `seeds\real_official\gpu\multiple_all_reduce.mlir` | `linalg_affine_probe` | 0 | success | 637 ms |
| `seeds\real_official\gpu\multiple_all_reduce.mlir` | `gpu_parallel_probe` | 0 | success | 634 ms |
| `seeds\real_official\linalg\bufferize.mlir` | `parse_verify` | 1 | unknown failure | 680 ms |
| `seeds\real_official\linalg\bufferize.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 648 ms |
| `seeds\real_official\linalg\bufferize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 635 ms |
| `seeds\real_official\linalg\bufferize.mlir` | `affine_lowering_stress` | 1 | unknown failure | 637 ms |
| `seeds\real_official\linalg\bufferize.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 648 ms |
| `seeds\real_official\linalg\bufferize.mlir` | `vector_lowering_stress` | 1 | unknown failure | 638 ms |
| `seeds\real_official\linalg\bufferize.mlir` | `bufferization_probe` | 1 | unknown failure | 613 ms |
| `seeds\real_official\linalg\bufferize.mlir` | `linalg_affine_probe` | 1 | unknown failure | 611 ms |
| `seeds\real_official\linalg\bufferize.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 586 ms |
| `seeds\real_official\linalg\canonicalize.mlir` | `parse_verify` | 1 | unknown failure | 654 ms |
| `seeds\real_official\linalg\canonicalize.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 643 ms |
| `seeds\real_official\linalg\canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 643 ms |
| `seeds\real_official\linalg\canonicalize.mlir` | `affine_lowering_stress` | 1 | unknown failure | 656 ms |
| `seeds\real_official\linalg\canonicalize.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 654 ms |
| `seeds\real_official\linalg\canonicalize.mlir` | `vector_lowering_stress` | 1 | unknown failure | 631 ms |
| `seeds\real_official\linalg\canonicalize.mlir` | `bufferization_probe` | 1 | unknown failure | 619 ms |
| `seeds\real_official\linalg\canonicalize.mlir` | `linalg_affine_probe` | 1 | unknown failure | 666 ms |
| `seeds\real_official\linalg\canonicalize.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 651 ms |
| `seeds\real_official\linalg\constant_fold.mlir` | `parse_verify` | 0 | success | 694 ms |
| `seeds\real_official\linalg\constant_fold.mlir` | `canonicalize_cse_sccp` | 0 | success | 648 ms |
| `seeds\real_official\linalg\constant_fold.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 618 ms |
| `seeds\real_official\linalg\constant_fold.mlir` | `affine_lowering_stress` | 0 | success | 635 ms |
| `seeds\real_official\linalg\constant_fold.mlir` | `scf_to_cf_stress` | 0 | success | 636 ms |
| `seeds\real_official\linalg\constant_fold.mlir` | `vector_lowering_stress` | 0 | success | 665 ms |
| `seeds\real_official\linalg\constant_fold.mlir` | `bufferization_probe` | 0 | success | 624 ms |
| `seeds\real_official\linalg\constant_fold.mlir` | `linalg_affine_probe` | 0 | success | 673 ms |
| `seeds\real_official\linalg\constant_fold.mlir` | `gpu_parallel_probe` | 0 | success | 621 ms |
| `seeds\real_official\linalg\fusion_multiuse_producer.mlir` | `parse_verify` | 0 | success | 626 ms |
| `seeds\real_official\linalg\fusion_multiuse_producer.mlir` | `canonicalize_cse_sccp` | 0 | success | 633 ms |
| `seeds\real_official\linalg\fusion_multiuse_producer.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 653 ms |
| `seeds\real_official\linalg\fusion_multiuse_producer.mlir` | `affine_lowering_stress` | 0 | success | 616 ms |
| `seeds\real_official\linalg\fusion_multiuse_producer.mlir` | `scf_to_cf_stress` | 0 | success | 629 ms |
| `seeds\real_official\linalg\fusion_multiuse_producer.mlir` | `vector_lowering_stress` | 0 | success | 652 ms |
| `seeds\real_official\linalg\fusion_multiuse_producer.mlir` | `bufferization_probe` | 0 | success | 665 ms |
| `seeds\real_official\linalg\fusion_multiuse_producer.mlir` | `linalg_affine_probe` | 0 | success | 655 ms |
| `seeds\real_official\linalg\fusion_multiuse_producer.mlir` | `gpu_parallel_probe` | 0 | success | 719 ms |
| `seeds\real_official\linalg\invalid.mlir` | `parse_verify` | 1 | parser | 668 ms |
| `seeds\real_official\linalg\invalid.mlir` | `canonicalize_cse_sccp` | 1 | parser | 718 ms |
| `seeds\real_official\linalg\invalid.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 646 ms |
| `seeds\real_official\linalg\invalid.mlir` | `affine_lowering_stress` | 1 | parser | 651 ms |
| `seeds\real_official\linalg\invalid.mlir` | `scf_to_cf_stress` | 1 | parser | 692 ms |
| `seeds\real_official\linalg\invalid.mlir` | `vector_lowering_stress` | 1 | parser | 662 ms |
| `seeds\real_official\linalg\invalid.mlir` | `bufferization_probe` | 1 | parser | 711 ms |
| `seeds\real_official\linalg\invalid.mlir` | `linalg_affine_probe` | 1 | parser | 707 ms |
| `seeds\real_official\linalg\invalid.mlir` | `gpu_parallel_probe` | 1 | parser | 709 ms |
| `seeds\real_official\linalg\loops.mlir` | `parse_verify` | 0 | success | 641 ms |
| `seeds\real_official\linalg\loops.mlir` | `canonicalize_cse_sccp` | 0 | success | 631 ms |
| `seeds\real_official\linalg\loops.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 634 ms |
| `seeds\real_official\linalg\loops.mlir` | `affine_lowering_stress` | 0 | success | 638 ms |
| `seeds\real_official\linalg\loops.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 649 ms |
| `seeds\real_official\linalg\loops.mlir` | `vector_lowering_stress` | 0 | success | 644 ms |
| `seeds\real_official\linalg\loops.mlir` | `bufferization_probe` | 0 | success | 635 ms |
| `seeds\real_official\linalg\loops.mlir` | `linalg_affine_probe` | 0 | success | 632 ms |
| `seeds\real_official\linalg\loops.mlir` | `gpu_parallel_probe` | 0 | success | 641 ms |
| `seeds\real_official\linalg\parallel_loops.mlir` | `parse_verify` | 1 | unknown failure | 745 ms |
| `seeds\real_official\linalg\parallel_loops.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 647 ms |
| `seeds\real_official\linalg\parallel_loops.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 687 ms |
| `seeds\real_official\linalg\parallel_loops.mlir` | `affine_lowering_stress` | 1 | unknown failure | 633 ms |
| `seeds\real_official\linalg\parallel_loops.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 620 ms |
| `seeds\real_official\linalg\parallel_loops.mlir` | `vector_lowering_stress` | 1 | unknown failure | 623 ms |
| `seeds\real_official\linalg\parallel_loops.mlir` | `bufferization_probe` | 1 | unknown failure | 600 ms |
| `seeds\real_official\linalg\parallel_loops.mlir` | `linalg_affine_probe` | 1 | unknown failure | 628 ms |
| `seeds\real_official\linalg\parallel_loops.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 625 ms |
| `seeds\real_official\llvmir\canonicalize_extra.mlir` | `parse_verify` | 1 | unknown failure | 662 ms |
| `seeds\real_official\llvmir\canonicalize_extra.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 654 ms |
| `seeds\real_official\llvmir\canonicalize_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 649 ms |
| `seeds\real_official\llvmir\canonicalize_extra.mlir` | `affine_lowering_stress` | 1 | unknown failure | 622 ms |
| `seeds\real_official\llvmir\canonicalize_extra.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 777 ms |
| `seeds\real_official\llvmir\canonicalize_extra.mlir` | `vector_lowering_stress` | 1 | unknown failure | 631 ms |
| `seeds\real_official\llvmir\canonicalize_extra.mlir` | `bufferization_probe` | 1 | unknown failure | 652 ms |
| `seeds\real_official\llvmir\canonicalize_extra.mlir` | `linalg_affine_probe` | 1 | unknown failure | 643 ms |
| `seeds\real_official\llvmir\canonicalize_extra.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 651 ms |
| `seeds\real_official\llvmir\comdat.mlir` | `parse_verify` | 0 | success | 664 ms |
| `seeds\real_official\llvmir\comdat.mlir` | `canonicalize_cse_sccp` | 0 | success | 619 ms |
| `seeds\real_official\llvmir\comdat.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 624 ms |
| `seeds\real_official\llvmir\comdat.mlir` | `affine_lowering_stress` | 0 | success | 632 ms |
| `seeds\real_official\llvmir\comdat.mlir` | `scf_to_cf_stress` | 0 | success | 643 ms |
| `seeds\real_official\llvmir\comdat.mlir` | `vector_lowering_stress` | 0 | success | 624 ms |
| `seeds\real_official\llvmir\comdat.mlir` | `bufferization_probe` | 0 | success | 647 ms |
| `seeds\real_official\llvmir\comdat.mlir` | `linalg_affine_probe` | 0 | success | 655 ms |
| `seeds\real_official\llvmir\comdat.mlir` | `gpu_parallel_probe` | 0 | success | 662 ms |
| `seeds\real_official\llvmir\inlining_debuginfo.mlir` | `parse_verify` | 0 | success | 658 ms |
| `seeds\real_official\llvmir\inlining_debuginfo.mlir` | `canonicalize_cse_sccp` | 0 | success | 655 ms |
| `seeds\real_official\llvmir\inlining_debuginfo.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 601 ms |
| `seeds\real_official\llvmir\inlining_debuginfo.mlir` | `affine_lowering_stress` | 0 | success | 630 ms |
| `seeds\real_official\llvmir\inlining_debuginfo.mlir` | `scf_to_cf_stress` | 0 | success | 628 ms |
| `seeds\real_official\llvmir\inlining_debuginfo.mlir` | `vector_lowering_stress` | 0 | success | 626 ms |
| `seeds\real_official\llvmir\inlining_debuginfo.mlir` | `bufferization_probe` | 0 | success | 620 ms |
| `seeds\real_official\llvmir\inlining_debuginfo.mlir` | `linalg_affine_probe` | 0 | success | 595 ms |
| `seeds\real_official\llvmir\inlining_debuginfo.mlir` | `gpu_parallel_probe` | 0 | success | 626 ms |
| `seeds\real_official\llvmir\nvvm_target_invalid.mlir` | `parse_verify` | 1 | unknown failure | 627 ms |
| `seeds\real_official\llvmir\nvvm_target_invalid.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 619 ms |
| `seeds\real_official\llvmir\nvvm_target_invalid.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 648 ms |
| `seeds\real_official\llvmir\nvvm_target_invalid.mlir` | `affine_lowering_stress` | 1 | unknown failure | 642 ms |
| `seeds\real_official\llvmir\nvvm_target_invalid.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 654 ms |
| `seeds\real_official\llvmir\nvvm_target_invalid.mlir` | `vector_lowering_stress` | 1 | unknown failure | 624 ms |
| `seeds\real_official\llvmir\nvvm_target_invalid.mlir` | `bufferization_probe` | 1 | unknown failure | 634 ms |
| `seeds\real_official\llvmir\nvvm_target_invalid.mlir` | `linalg_affine_probe` | 1 | unknown failure | 637 ms |
| `seeds\real_official\llvmir\nvvm_target_invalid.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 640 ms |
| `seeds\real_official\llvmir\ptr.mlir` | `parse_verify` | 0 | success | 587 ms |
| `seeds\real_official\llvmir\ptr.mlir` | `canonicalize_cse_sccp` | 0 | success | 652 ms |
| `seeds\real_official\llvmir\ptr.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 648 ms |
| `seeds\real_official\llvmir\ptr.mlir` | `affine_lowering_stress` | 0 | success | 645 ms |
| `seeds\real_official\llvmir\ptr.mlir` | `scf_to_cf_stress` | 0 | success | 629 ms |
| `seeds\real_official\llvmir\ptr.mlir` | `vector_lowering_stress` | 0 | success | 626 ms |
| `seeds\real_official\llvmir\ptr.mlir` | `bufferization_probe` | 0 | success | 607 ms |
| `seeds\real_official\llvmir\ptr.mlir` | `linalg_affine_probe` | 0 | success | 615 ms |
| `seeds\real_official\llvmir\ptr.mlir` | `gpu_parallel_probe` | 0 | success | 675 ms |
| `seeds\real_official\llvmir\terminator.mlir` | `parse_verify` | 0 | success | 700 ms |
| `seeds\real_official\llvmir\terminator.mlir` | `canonicalize_cse_sccp` | 0 | success | 663 ms |
| `seeds\real_official\llvmir\terminator.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 649 ms |
| `seeds\real_official\llvmir\terminator.mlir` | `affine_lowering_stress` | 0 | success | 653 ms |
| `seeds\real_official\llvmir\terminator.mlir` | `scf_to_cf_stress` | 0 | success | 624 ms |
| `seeds\real_official\llvmir\terminator.mlir` | `vector_lowering_stress` | 0 | success | 639 ms |
| `seeds\real_official\llvmir\terminator.mlir` | `bufferization_probe` | 0 | success | 635 ms |
| `seeds\real_official\llvmir\terminator.mlir` | `linalg_affine_probe` | 0 | success | 646 ms |
| `seeds\real_official\llvmir\terminator.mlir` | `gpu_parallel_probe` | 0 | success | 638 ms |
| `seeds\real_official\math\canonicalize_extra.mlir` | `parse_verify` | 0 | success | 606 ms |
| `seeds\real_official\math\canonicalize_extra.mlir` | `canonicalize_cse_sccp` | 0 | success | 678 ms |
| `seeds\real_official\math\canonicalize_extra.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 668 ms |
| `seeds\real_official\math\canonicalize_extra.mlir` | `affine_lowering_stress` | 0 | success | 639 ms |
| `seeds\real_official\math\canonicalize_extra.mlir` | `scf_to_cf_stress` | 0 | success | 630 ms |
| `seeds\real_official\math\canonicalize_extra.mlir` | `vector_lowering_stress` | 0 | success | 622 ms |
| `seeds\real_official\math\canonicalize_extra.mlir` | `bufferization_probe` | 0 | success | 648 ms |
| `seeds\real_official\math\canonicalize_extra.mlir` | `linalg_affine_probe` | 0 | success | 607 ms |
| `seeds\real_official\math\canonicalize_extra.mlir` | `gpu_parallel_probe` | 0 | success | 692 ms |
| `seeds\real_official\math\depends_on_arith.mlir` | `parse_verify` | 0 | success | 623 ms |
| `seeds\real_official\math\depends_on_arith.mlir` | `canonicalize_cse_sccp` | 0 | success | 645 ms |
| `seeds\real_official\math\depends_on_arith.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 618 ms |
| `seeds\real_official\math\depends_on_arith.mlir` | `affine_lowering_stress` | 0 | success | 669 ms |
| `seeds\real_official\math\depends_on_arith.mlir` | `scf_to_cf_stress` | 0 | success | 593 ms |
| `seeds\real_official\math\depends_on_arith.mlir` | `vector_lowering_stress` | 0 | success | 667 ms |
| `seeds\real_official\math\depends_on_arith.mlir` | `bufferization_probe` | 0 | success | 613 ms |
| `seeds\real_official\math\depends_on_arith.mlir` | `linalg_affine_probe` | 0 | success | 652 ms |
| `seeds\real_official\math\depends_on_arith.mlir` | `gpu_parallel_probe` | 0 | success | 598 ms |
| `seeds\real_official\math\extend_to_supported_types.mlir` | `parse_verify` | 0 | success | 642 ms |
| `seeds\real_official\math\extend_to_supported_types.mlir` | `canonicalize_cse_sccp` | 0 | success | 598 ms |
| `seeds\real_official\math\extend_to_supported_types.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 656 ms |
| `seeds\real_official\math\extend_to_supported_types.mlir` | `affine_lowering_stress` | 0 | success | 652 ms |
| `seeds\real_official\math\extend_to_supported_types.mlir` | `scf_to_cf_stress` | 0 | success | 638 ms |
| `seeds\real_official\math\extend_to_supported_types.mlir` | `vector_lowering_stress` | 0 | success | 678 ms |
| `seeds\real_official\math\extend_to_supported_types.mlir` | `bufferization_probe` | 0 | success | 661 ms |
| `seeds\real_official\math\extend_to_supported_types.mlir` | `linalg_affine_probe` | 0 | success | 602 ms |
| `seeds\real_official\math\extend_to_supported_types.mlir` | `gpu_parallel_probe` | 0 | success | 613 ms |
| `seeds\real_official\math\sincos_fusion.mlir` | `parse_verify` | 0 | success | 577 ms |
| `seeds\real_official\math\sincos_fusion.mlir` | `canonicalize_cse_sccp` | 0 | success | 617 ms |
| `seeds\real_official\math\sincos_fusion.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 629 ms |
| `seeds\real_official\math\sincos_fusion.mlir` | `affine_lowering_stress` | 0 | success | 594 ms |
| `seeds\real_official\math\sincos_fusion.mlir` | `scf_to_cf_stress` | 0 | success | 646 ms |
| `seeds\real_official\math\sincos_fusion.mlir` | `vector_lowering_stress` | 0 | success | 653 ms |
| `seeds\real_official\math\sincos_fusion.mlir` | `bufferization_probe` | 0 | success | 640 ms |
| `seeds\real_official\math\sincos_fusion.mlir` | `linalg_affine_probe` | 0 | success | 614 ms |
| `seeds\real_official\math\sincos_fusion.mlir` | `gpu_parallel_probe` | 0 | success | 669 ms |
| `seeds\real_official\math\uplift_to_fma.mlir` | `parse_verify` | 1 | unknown failure | 594 ms |
| `seeds\real_official\math\uplift_to_fma.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 599 ms |
| `seeds\real_official\math\uplift_to_fma.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 645 ms |
| `seeds\real_official\math\uplift_to_fma.mlir` | `affine_lowering_stress` | 1 | unknown failure | 620 ms |
| `seeds\real_official\math\uplift_to_fma.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 623 ms |
| `seeds\real_official\math\uplift_to_fma.mlir` | `vector_lowering_stress` | 1 | unknown failure | 599 ms |
| `seeds\real_official\math\uplift_to_fma.mlir` | `bufferization_probe` | 1 | unknown failure | 596 ms |
| `seeds\real_official\math\uplift_to_fma.mlir` | `linalg_affine_probe` | 1 | unknown failure | 620 ms |
| `seeds\real_official\math\uplift_to_fma.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 616 ms |
| `seeds\real_official\memref\alloc_to_alloca.mlir` | `parse_verify` | 0 | success | 596 ms |
| `seeds\real_official\memref\alloc_to_alloca.mlir` | `canonicalize_cse_sccp` | 0 | success | 675 ms |
| `seeds\real_official\memref\alloc_to_alloca.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 614 ms |
| `seeds\real_official\memref\alloc_to_alloca.mlir` | `affine_lowering_stress` | 0 | success | 653 ms |
| `seeds\real_official\memref\alloc_to_alloca.mlir` | `scf_to_cf_stress` | 0 | success | 684 ms |
| `seeds\real_official\memref\alloc_to_alloca.mlir` | `vector_lowering_stress` | 0 | success | 787 ms |
| `seeds\real_official\memref\alloc_to_alloca.mlir` | `bufferization_probe` | 0 | success | 644 ms |
| `seeds\real_official\memref\alloc_to_alloca.mlir` | `linalg_affine_probe` | 0 | success | 617 ms |
| `seeds\real_official\memref\alloc_to_alloca.mlir` | `gpu_parallel_probe` | 0 | success | 640 ms |
| `seeds\real_official\memref\canonicalize_extra.mlir` | `parse_verify` | 0 | success | 663 ms |
| `seeds\real_official\memref\canonicalize_extra.mlir` | `canonicalize_cse_sccp` | 4294967295 | memory/assertion | 2398 ms |
| `seeds\real_official\memref\canonicalize_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 703 ms |
| `seeds\real_official\memref\canonicalize_extra.mlir` | `affine_lowering_stress` | 4294967295 | memory/assertion | 1899 ms |
| `seeds\real_official\memref\canonicalize_extra.mlir` | `scf_to_cf_stress` | 4294967295 | memory/assertion | 1915 ms |
| `seeds\real_official\memref\canonicalize_extra.mlir` | `vector_lowering_stress` | 4294967295 | memory/assertion | 1851 ms |
| `seeds\real_official\memref\canonicalize_extra.mlir` | `bufferization_probe` | 4294967295 | memory/assertion | 1879 ms |
| `seeds\real_official\memref\canonicalize_extra.mlir` | `linalg_affine_probe` | 4294967295 | memory/assertion | 1850 ms |
| `seeds\real_official\memref\canonicalize_extra.mlir` | `gpu_parallel_probe` | 1 | parser | 617 ms |
| `seeds\real_official\memref\expand_ops.mlir` | `parse_verify` | 0 | success | 635 ms |
| `seeds\real_official\memref\expand_ops.mlir` | `canonicalize_cse_sccp` | 0 | success | 596 ms |
| `seeds\real_official\memref\expand_ops.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 633 ms |
| `seeds\real_official\memref\expand_ops.mlir` | `affine_lowering_stress` | 0 | success | 582 ms |
| `seeds\real_official\memref\expand_ops.mlir` | `scf_to_cf_stress` | 0 | success | 589 ms |
| `seeds\real_official\memref\expand_ops.mlir` | `vector_lowering_stress` | 0 | success | 650 ms |
| `seeds\real_official\memref\expand_ops.mlir` | `bufferization_probe` | 0 | success | 595 ms |
| `seeds\real_official\memref\expand_ops.mlir` | `linalg_affine_probe` | 0 | success | 624 ms |
| `seeds\real_official\memref\expand_ops.mlir` | `gpu_parallel_probe` | 0 | success | 696 ms |
| `seeds\real_official\memref\high_rank_overflow.mlir` | `parse_verify` | 0 | success | 657 ms |
| `seeds\real_official\memref\high_rank_overflow.mlir` | `canonicalize_cse_sccp` | 0 | success | 643 ms |
| `seeds\real_official\memref\high_rank_overflow.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 637 ms |
| `seeds\real_official\memref\high_rank_overflow.mlir` | `affine_lowering_stress` | 0 | success | 639 ms |
| `seeds\real_official\memref\high_rank_overflow.mlir` | `scf_to_cf_stress` | 0 | success | 597 ms |
| `seeds\real_official\memref\high_rank_overflow.mlir` | `vector_lowering_stress` | 0 | success | 602 ms |
| `seeds\real_official\memref\high_rank_overflow.mlir` | `bufferization_probe` | 0 | success | 627 ms |
| `seeds\real_official\memref\high_rank_overflow.mlir` | `linalg_affine_probe` | 0 | success | 625 ms |
| `seeds\real_official\memref\high_rank_overflow.mlir` | `gpu_parallel_probe` | 0 | success | 619 ms |
| `seeds\real_official\memref\int_range_inference.mlir` | `parse_verify` | 0 | success | 635 ms |
| `seeds\real_official\memref\int_range_inference.mlir` | `canonicalize_cse_sccp` | 0 | success | 647 ms |
| `seeds\real_official\memref\int_range_inference.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 603 ms |
| `seeds\real_official\memref\int_range_inference.mlir` | `affine_lowering_stress` | 0 | success | 649 ms |
| `seeds\real_official\memref\int_range_inference.mlir` | `scf_to_cf_stress` | 0 | success | 628 ms |
| `seeds\real_official\memref\int_range_inference.mlir` | `vector_lowering_stress` | 0 | success | 650 ms |
| `seeds\real_official\memref\int_range_inference.mlir` | `bufferization_probe` | 0 | success | 630 ms |
| `seeds\real_official\memref\int_range_inference.mlir` | `linalg_affine_probe` | 0 | success | 661 ms |
| `seeds\real_official\memref\int_range_inference.mlir` | `gpu_parallel_probe` | 0 | success | 620 ms |
| `seeds\real_official\memref\invalid_extra.mlir` | `parse_verify` | 1 | parser | 711 ms |
| `seeds\real_official\memref\invalid_extra.mlir` | `canonicalize_cse_sccp` | 1 | parser | 659 ms |
| `seeds\real_official\memref\invalid_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 671 ms |
| `seeds\real_official\memref\invalid_extra.mlir` | `affine_lowering_stress` | 1 | parser | 652 ms |
| `seeds\real_official\memref\invalid_extra.mlir` | `scf_to_cf_stress` | 1 | parser | 654 ms |
| `seeds\real_official\memref\invalid_extra.mlir` | `vector_lowering_stress` | 1 | parser | 686 ms |
| `seeds\real_official\memref\invalid_extra.mlir` | `bufferization_probe` | 1 | parser | 707 ms |
| `seeds\real_official\memref\invalid_extra.mlir` | `linalg_affine_probe` | 1 | parser | 652 ms |
| `seeds\real_official\memref\invalid_extra.mlir` | `gpu_parallel_probe` | 1 | parser | 653 ms |
| `seeds\real_official\memref\ops_extra.mlir` | `parse_verify` | 1 | unknown failure | 633 ms |
| `seeds\real_official\memref\ops_extra.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 659 ms |
| `seeds\real_official\memref\ops_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 633 ms |
| `seeds\real_official\memref\ops_extra.mlir` | `affine_lowering_stress` | 1 | unknown failure | 627 ms |
| `seeds\real_official\memref\ops_extra.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 640 ms |
| `seeds\real_official\memref\ops_extra.mlir` | `vector_lowering_stress` | 1 | unknown failure | 672 ms |
| `seeds\real_official\memref\ops_extra.mlir` | `bufferization_probe` | 1 | unknown failure | 597 ms |
| `seeds\real_official\memref\ops_extra.mlir` | `linalg_affine_probe` | 1 | unknown failure | 738 ms |
| `seeds\real_official\memref\ops_extra.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 653 ms |
| `seeds\real_official\memref\runtime_verification.mlir` | `parse_verify` | 0 | success | 629 ms |
| `seeds\real_official\memref\runtime_verification.mlir` | `canonicalize_cse_sccp` | 0 | success | 618 ms |
| `seeds\real_official\memref\runtime_verification.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 604 ms |
| `seeds\real_official\memref\runtime_verification.mlir` | `affine_lowering_stress` | 0 | success | 632 ms |
| `seeds\real_official\memref\runtime_verification.mlir` | `scf_to_cf_stress` | 0 | success | 653 ms |
| `seeds\real_official\memref\runtime_verification.mlir` | `vector_lowering_stress` | 0 | success | 608 ms |
| `seeds\real_official\memref\runtime_verification.mlir` | `bufferization_probe` | 0 | success | 630 ms |
| `seeds\real_official\memref\runtime_verification.mlir` | `linalg_affine_probe` | 0 | success | 654 ms |
| `seeds\real_official\memref\runtime_verification.mlir` | `gpu_parallel_probe` | 0 | success | 606 ms |
| `seeds\real_official\openmp\canonicalize.mlir` | `parse_verify` | 1 | unknown failure | 591 ms |
| `seeds\real_official\openmp\canonicalize.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 642 ms |
| `seeds\real_official\openmp\canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 598 ms |
| `seeds\real_official\openmp\canonicalize.mlir` | `affine_lowering_stress` | 1 | unknown failure | 616 ms |
| `seeds\real_official\openmp\canonicalize.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 634 ms |
| `seeds\real_official\openmp\canonicalize.mlir` | `vector_lowering_stress` | 1 | unknown failure | 644 ms |
| `seeds\real_official\openmp\canonicalize.mlir` | `bufferization_probe` | 1 | unknown failure | 621 ms |
| `seeds\real_official\openmp\canonicalize.mlir` | `linalg_affine_probe` | 1 | unknown failure | 623 ms |
| `seeds\real_official\openmp\canonicalize.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 635 ms |
| `seeds\real_official\openmp\cli_unroll_heuristic.mlir` | `parse_verify` | 0 | success | 599 ms |
| `seeds\real_official\openmp\cli_unroll_heuristic.mlir` | `canonicalize_cse_sccp` | 0 | success | 632 ms |
| `seeds\real_official\openmp\cli_unroll_heuristic.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 678 ms |
| `seeds\real_official\openmp\cli_unroll_heuristic.mlir` | `affine_lowering_stress` | 0 | success | 646 ms |
| `seeds\real_official\openmp\cli_unroll_heuristic.mlir` | `scf_to_cf_stress` | 0 | success | 668 ms |
| `seeds\real_official\openmp\cli_unroll_heuristic.mlir` | `vector_lowering_stress` | 0 | success | 621 ms |
| `seeds\real_official\openmp\cli_unroll_heuristic.mlir` | `bufferization_probe` | 0 | success | 637 ms |
| `seeds\real_official\openmp\cli_unroll_heuristic.mlir` | `linalg_affine_probe` | 0 | success | 589 ms |
| `seeds\real_official\openmp\cli_unroll_heuristic.mlir` | `gpu_parallel_probe` | 0 | success | 635 ms |
| `seeds\real_official\openmp\invalid_fuse.mlir` | `parse_verify` | 1 | unknown failure | 618 ms |
| `seeds\real_official\openmp\invalid_fuse.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 639 ms |
| `seeds\real_official\openmp\invalid_fuse.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 621 ms |
| `seeds\real_official\openmp\invalid_fuse.mlir` | `affine_lowering_stress` | 1 | unknown failure | 644 ms |
| `seeds\real_official\openmp\invalid_fuse.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 637 ms |
| `seeds\real_official\openmp\invalid_fuse.mlir` | `vector_lowering_stress` | 1 | unknown failure | 650 ms |
| `seeds\real_official\openmp\invalid_fuse.mlir` | `bufferization_probe` | 1 | unknown failure | 585 ms |
| `seeds\real_official\openmp\invalid_fuse.mlir` | `linalg_affine_probe` | 1 | unknown failure | 639 ms |
| `seeds\real_official\openmp\invalid_fuse.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 638 ms |
| `seeds\real_official\quant\inlining.mlir` | `parse_verify` | 0 | success | 615 ms |
| `seeds\real_official\quant\inlining.mlir` | `canonicalize_cse_sccp` | 0 | success | 638 ms |
| `seeds\real_official\quant\inlining.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 637 ms |
| `seeds\real_official\quant\inlining.mlir` | `affine_lowering_stress` | 0 | success | 606 ms |
| `seeds\real_official\quant\inlining.mlir` | `scf_to_cf_stress` | 0 | success | 631 ms |
| `seeds\real_official\quant\inlining.mlir` | `vector_lowering_stress` | 0 | success | 666 ms |
| `seeds\real_official\quant\inlining.mlir` | `bufferization_probe` | 0 | success | 585 ms |
| `seeds\real_official\quant\inlining.mlir` | `linalg_affine_probe` | 0 | success | 623 ms |
| `seeds\real_official\quant\inlining.mlir` | `gpu_parallel_probe` | 0 | success | 586 ms |
| `seeds\real_official\quant\normalize_quant_types.mlir` | `parse_verify` | 1 | unknown failure | 658 ms |
| `seeds\real_official\quant\normalize_quant_types.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 617 ms |
| `seeds\real_official\quant\normalize_quant_types.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 604 ms |
| `seeds\real_official\quant\normalize_quant_types.mlir` | `affine_lowering_stress` | 1 | unknown failure | 675 ms |
| `seeds\real_official\quant\normalize_quant_types.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 630 ms |
| `seeds\real_official\quant\normalize_quant_types.mlir` | `vector_lowering_stress` | 1 | unknown failure | 619 ms |
| `seeds\real_official\quant\normalize_quant_types.mlir` | `bufferization_probe` | 1 | unknown failure | 659 ms |
| `seeds\real_official\quant\normalize_quant_types.mlir` | `linalg_affine_probe` | 1 | unknown failure | 616 ms |
| `seeds\real_official\quant\normalize_quant_types.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 606 ms |
| `seeds\real_official\quant\parse_any.mlir` | `parse_verify` | 1 | dialect registration | 620 ms |
| `seeds\real_official\quant\parse_any.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 731 ms |
| `seeds\real_official\quant\parse_any.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 571 ms |
| `seeds\real_official\quant\parse_any.mlir` | `affine_lowering_stress` | 1 | dialect registration | 579 ms |
| `seeds\real_official\quant\parse_any.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 620 ms |
| `seeds\real_official\quant\parse_any.mlir` | `vector_lowering_stress` | 1 | dialect registration | 610 ms |
| `seeds\real_official\quant\parse_any.mlir` | `bufferization_probe` | 1 | dialect registration | 596 ms |
| `seeds\real_official\quant\parse_any.mlir` | `linalg_affine_probe` | 1 | dialect registration | 633 ms |
| `seeds\real_official\quant\parse_any.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 688 ms |
| `seeds\real_official\quant\parse_calibrated.mlir` | `parse_verify` | 1 | dialect registration | 648 ms |
| `seeds\real_official\quant\parse_calibrated.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 661 ms |
| `seeds\real_official\quant\parse_calibrated.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 606 ms |
| `seeds\real_official\quant\parse_calibrated.mlir` | `affine_lowering_stress` | 1 | dialect registration | 658 ms |
| `seeds\real_official\quant\parse_calibrated.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 612 ms |
| `seeds\real_official\quant\parse_calibrated.mlir` | `vector_lowering_stress` | 1 | dialect registration | 629 ms |
| `seeds\real_official\quant\parse_calibrated.mlir` | `bufferization_probe` | 1 | dialect registration | 643 ms |
| `seeds\real_official\quant\parse_calibrated.mlir` | `linalg_affine_probe` | 1 | dialect registration | 597 ms |
| `seeds\real_official\quant\parse_calibrated.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 664 ms |
| `seeds\real_official\scf\canonicalize.mlir` | `parse_verify` | 1 | unknown failure | 610 ms |
| `seeds\real_official\scf\canonicalize.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 609 ms |
| `seeds\real_official\scf\canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 701 ms |
| `seeds\real_official\scf\canonicalize.mlir` | `affine_lowering_stress` | 1 | unknown failure | 616 ms |
| `seeds\real_official\scf\canonicalize.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 627 ms |
| `seeds\real_official\scf\canonicalize.mlir` | `vector_lowering_stress` | 1 | unknown failure | 633 ms |
| `seeds\real_official\scf\canonicalize.mlir` | `bufferization_probe` | 1 | unknown failure | 669 ms |
| `seeds\real_official\scf\canonicalize.mlir` | `linalg_affine_probe` | 1 | unknown failure | 623 ms |
| `seeds\real_official\scf\canonicalize.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 658 ms |
| `seeds\real_official\scf\canonicalize_extra.mlir` | `parse_verify` | 1 | unknown failure | 635 ms |
| `seeds\real_official\scf\canonicalize_extra.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 633 ms |
| `seeds\real_official\scf\canonicalize_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 633 ms |
| `seeds\real_official\scf\canonicalize_extra.mlir` | `affine_lowering_stress` | 1 | unknown failure | 648 ms |
| `seeds\real_official\scf\canonicalize_extra.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 604 ms |
| `seeds\real_official\scf\canonicalize_extra.mlir` | `vector_lowering_stress` | 1 | unknown failure | 655 ms |
| `seeds\real_official\scf\canonicalize_extra.mlir` | `bufferization_probe` | 1 | unknown failure | 635 ms |
| `seeds\real_official\scf\canonicalize_extra.mlir` | `linalg_affine_probe` | 1 | unknown failure | 656 ms |
| `seeds\real_official\scf\canonicalize_extra.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 668 ms |
| `seeds\real_official\scf\for_loop_canonicalization.mlir` | `parse_verify` | 0 | success | 612 ms |
| `seeds\real_official\scf\for_loop_canonicalization.mlir` | `canonicalize_cse_sccp` | 0 | success | 652 ms |
| `seeds\real_official\scf\for_loop_canonicalization.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 661 ms |
| `seeds\real_official\scf\for_loop_canonicalization.mlir` | `affine_lowering_stress` | 0 | success | 617 ms |
| `seeds\real_official\scf\for_loop_canonicalization.mlir` | `scf_to_cf_stress` | 0 | success | 618 ms |
| `seeds\real_official\scf\for_loop_canonicalization.mlir` | `vector_lowering_stress` | 0 | success | 660 ms |
| `seeds\real_official\scf\for_loop_canonicalization.mlir` | `bufferization_probe` | 1 | unknown failure | 638 ms |
| `seeds\real_official\scf\for_loop_canonicalization.mlir` | `linalg_affine_probe` | 0 | success | 622 ms |
| `seeds\real_official\scf\for_loop_canonicalization.mlir` | `gpu_parallel_probe` | 0 | success | 776 ms |
| `seeds\real_official\scf\for_loop_specialization.mlir` | `parse_verify` | 0 | success | 660 ms |
| `seeds\real_official\scf\for_loop_specialization.mlir` | `canonicalize_cse_sccp` | 0 | success | 653 ms |
| `seeds\real_official\scf\for_loop_specialization.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 609 ms |
| `seeds\real_official\scf\for_loop_specialization.mlir` | `affine_lowering_stress` | 0 | success | 594 ms |
| `seeds\real_official\scf\for_loop_specialization.mlir` | `scf_to_cf_stress` | 0 | success | 597 ms |
| `seeds\real_official\scf\for_loop_specialization.mlir` | `vector_lowering_stress` | 0 | success | 604 ms |
| `seeds\real_official\scf\for_loop_specialization.mlir` | `bufferization_probe` | 0 | success | 564 ms |
| `seeds\real_official\scf\for_loop_specialization.mlir` | `linalg_affine_probe` | 0 | success | 600 ms |
| `seeds\real_official\scf\for_loop_specialization.mlir` | `gpu_parallel_probe` | 0 | success | 609 ms |
| `seeds\real_official\scf\ops.mlir` | `parse_verify` | 0 | success | 622 ms |
| `seeds\real_official\scf\ops.mlir` | `canonicalize_cse_sccp` | 0 | success | 684 ms |
| `seeds\real_official\scf\ops.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 644 ms |
| `seeds\real_official\scf\ops.mlir` | `affine_lowering_stress` | 0 | success | 635 ms |
| `seeds\real_official\scf\ops.mlir` | `scf_to_cf_stress` | 1 | type legality | 599 ms |
| `seeds\real_official\scf\ops.mlir` | `vector_lowering_stress` | 0 | success | 678 ms |
| `seeds\real_official\scf\ops.mlir` | `bufferization_probe` | 0 | success | 624 ms |
| `seeds\real_official\scf\ops.mlir` | `linalg_affine_probe` | 0 | success | 656 ms |
| `seeds\real_official\scf\ops.mlir` | `gpu_parallel_probe` | 0 | success | 655 ms |
| `seeds\real_official\scf\parallel_loop_invalid.mlir` | `parse_verify` | 0 | success | 644 ms |
| `seeds\real_official\scf\parallel_loop_invalid.mlir` | `canonicalize_cse_sccp` | 0 | success | 620 ms |
| `seeds\real_official\scf\parallel_loop_invalid.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 649 ms |
| `seeds\real_official\scf\parallel_loop_invalid.mlir` | `affine_lowering_stress` | 0 | success | 601 ms |
| `seeds\real_official\scf\parallel_loop_invalid.mlir` | `scf_to_cf_stress` | 0 | success | 663 ms |
| `seeds\real_official\scf\parallel_loop_invalid.mlir` | `vector_lowering_stress` | 0 | success | 623 ms |
| `seeds\real_official\scf\parallel_loop_invalid.mlir` | `bufferization_probe` | 0 | success | 614 ms |
| `seeds\real_official\scf\parallel_loop_invalid.mlir` | `linalg_affine_probe` | 0 | success | 633 ms |
| `seeds\real_official\scf\parallel_loop_invalid.mlir` | `gpu_parallel_probe` | 0 | success | 585 ms |
| `seeds\real_official\scf\parallel_loop_specialization.mlir` | `parse_verify` | 0 | success | 637 ms |
| `seeds\real_official\scf\parallel_loop_specialization.mlir` | `canonicalize_cse_sccp` | 0 | success | 642 ms |
| `seeds\real_official\scf\parallel_loop_specialization.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 611 ms |
| `seeds\real_official\scf\parallel_loop_specialization.mlir` | `affine_lowering_stress` | 0 | success | 637 ms |
| `seeds\real_official\scf\parallel_loop_specialization.mlir` | `scf_to_cf_stress` | 0 | success | 674 ms |
| `seeds\real_official\scf\parallel_loop_specialization.mlir` | `vector_lowering_stress` | 0 | success | 629 ms |
| `seeds\real_official\scf\parallel_loop_specialization.mlir` | `bufferization_probe` | 0 | success | 603 ms |
| `seeds\real_official\scf\parallel_loop_specialization.mlir` | `linalg_affine_probe` | 0 | success | 641 ms |
| `seeds\real_official\scf\parallel_loop_specialization.mlir` | `gpu_parallel_probe` | 0 | success | 620 ms |
| `seeds\real_official\scf\parallel_to_nested_fors.mlir` | `parse_verify` | 1 | unknown failure | 643 ms |
| `seeds\real_official\scf\parallel_to_nested_fors.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 751 ms |
| `seeds\real_official\scf\parallel_to_nested_fors.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 630 ms |
| `seeds\real_official\scf\parallel_to_nested_fors.mlir` | `affine_lowering_stress` | 1 | unknown failure | 627 ms |
| `seeds\real_official\scf\parallel_to_nested_fors.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 729 ms |
| `seeds\real_official\scf\parallel_to_nested_fors.mlir` | `vector_lowering_stress` | 1 | unknown failure | 609 ms |
| `seeds\real_official\scf\parallel_to_nested_fors.mlir` | `bufferization_probe` | 1 | unknown failure | 597 ms |
| `seeds\real_official\scf\parallel_to_nested_fors.mlir` | `linalg_affine_probe` | 1 | unknown failure | 635 ms |
| `seeds\real_official\scf\parallel_to_nested_fors.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 745 ms |
| `seeds\real_official\shape\arg_with_shape.mlir` | `parse_verify` | 0 | success | 647 ms |
| `seeds\real_official\shape\arg_with_shape.mlir` | `canonicalize_cse_sccp` | 0 | success | 664 ms |
| `seeds\real_official\shape\arg_with_shape.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 681 ms |
| `seeds\real_official\shape\arg_with_shape.mlir` | `affine_lowering_stress` | 0 | success | 695 ms |
| `seeds\real_official\shape\arg_with_shape.mlir` | `scf_to_cf_stress` | 0 | success | 729 ms |
| `seeds\real_official\shape\arg_with_shape.mlir` | `vector_lowering_stress` | 0 | success | 606 ms |
| `seeds\real_official\shape\arg_with_shape.mlir` | `bufferization_probe` | 0 | success | 593 ms |
| `seeds\real_official\shape\arg_with_shape.mlir` | `linalg_affine_probe` | 0 | success | 638 ms |
| `seeds\real_official\shape\arg_with_shape.mlir` | `gpu_parallel_probe` | 0 | success | 641 ms |
| `seeds\real_official\shape\bufferize.mlir` | `parse_verify` | 0 | success | 629 ms |
| `seeds\real_official\shape\bufferize.mlir` | `canonicalize_cse_sccp` | 0 | success | 670 ms |
| `seeds\real_official\shape\bufferize.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 642 ms |
| `seeds\real_official\shape\bufferize.mlir` | `affine_lowering_stress` | 0 | success | 655 ms |
| `seeds\real_official\shape\bufferize.mlir` | `scf_to_cf_stress` | 0 | success | 623 ms |
| `seeds\real_official\shape\bufferize.mlir` | `vector_lowering_stress` | 0 | success | 627 ms |
| `seeds\real_official\shape\bufferize.mlir` | `bufferization_probe` | 1 | unknown failure | 683 ms |
| `seeds\real_official\shape\bufferize.mlir` | `linalg_affine_probe` | 0 | success | 620 ms |
| `seeds\real_official\shape\bufferize.mlir` | `gpu_parallel_probe` | 0 | success | 656 ms |
| `seeds\real_official\shape\canonicalize_extra.mlir` | `parse_verify` | 1 | dialect registration | 631 ms |
| `seeds\real_official\shape\canonicalize_extra.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 667 ms |
| `seeds\real_official\shape\canonicalize_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 645 ms |
| `seeds\real_official\shape\canonicalize_extra.mlir` | `affine_lowering_stress` | 1 | dialect registration | 651 ms |
| `seeds\real_official\shape\canonicalize_extra.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 645 ms |
| `seeds\real_official\shape\canonicalize_extra.mlir` | `vector_lowering_stress` | 1 | dialect registration | 591 ms |
| `seeds\real_official\shape\canonicalize_extra.mlir` | `bufferization_probe` | 1 | dialect registration | 586 ms |
| `seeds\real_official\shape\canonicalize_extra.mlir` | `linalg_affine_probe` | 1 | dialect registration | 625 ms |
| `seeds\real_official\shape\canonicalize_extra.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 616 ms |
| `seeds\real_official\shape\fold_div.mlir` | `parse_verify` | 0 | success | 602 ms |
| `seeds\real_official\shape\fold_div.mlir` | `canonicalize_cse_sccp` | 0 | success | 627 ms |
| `seeds\real_official\shape\fold_div.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 610 ms |
| `seeds\real_official\shape\fold_div.mlir` | `affine_lowering_stress` | 0 | success | 599 ms |
| `seeds\real_official\shape\fold_div.mlir` | `scf_to_cf_stress` | 0 | success | 610 ms |
| `seeds\real_official\shape\fold_div.mlir` | `vector_lowering_stress` | 0 | success | 680 ms |
| `seeds\real_official\shape\fold_div.mlir` | `bufferization_probe` | 0 | success | 602 ms |
| `seeds\real_official\shape\fold_div.mlir` | `linalg_affine_probe` | 0 | success | 605 ms |
| `seeds\real_official\shape\fold_div.mlir` | `gpu_parallel_probe` | 0 | success | 651 ms |
| `seeds\real_official\shape\shape_to_shape.mlir` | `parse_verify` | 0 | success | 659 ms |
| `seeds\real_official\shape\shape_to_shape.mlir` | `canonicalize_cse_sccp` | 0 | success | 642 ms |
| `seeds\real_official\shape\shape_to_shape.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 653 ms |
| `seeds\real_official\shape\shape_to_shape.mlir` | `affine_lowering_stress` | 0 | success | 619 ms |
| `seeds\real_official\shape\shape_to_shape.mlir` | `scf_to_cf_stress` | 0 | success | 670 ms |
| `seeds\real_official\shape\shape_to_shape.mlir` | `vector_lowering_stress` | 0 | success | 622 ms |
| `seeds\real_official\shape\shape_to_shape.mlir` | `bufferization_probe` | 1 | unknown failure | 646 ms |
| `seeds\real_official\shape\shape_to_shape.mlir` | `linalg_affine_probe` | 0 | success | 638 ms |
| `seeds\real_official\shape\shape_to_shape.mlir` | `gpu_parallel_probe` | 0 | success | 618 ms |
| `seeds\real_official\sparsetensor\codegen_to_llvm.mlir` | `parse_verify` | 0 | success | 741 ms |
| `seeds\real_official\sparsetensor\codegen_to_llvm.mlir` | `canonicalize_cse_sccp` | 0 | success | 668 ms |
| `seeds\real_official\sparsetensor\codegen_to_llvm.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 587 ms |
| `seeds\real_official\sparsetensor\codegen_to_llvm.mlir` | `affine_lowering_stress` | 0 | success | 590 ms |
| `seeds\real_official\sparsetensor\codegen_to_llvm.mlir` | `scf_to_cf_stress` | 0 | success | 667 ms |
| `seeds\real_official\sparsetensor\codegen_to_llvm.mlir` | `vector_lowering_stress` | 0 | success | 651 ms |
| `seeds\real_official\sparsetensor\codegen_to_llvm.mlir` | `bufferization_probe` | 0 | success | 679 ms |
| `seeds\real_official\sparsetensor\codegen_to_llvm.mlir` | `linalg_affine_probe` | 0 | success | 597 ms |
| `seeds\real_official\sparsetensor\codegen_to_llvm.mlir` | `gpu_parallel_probe` | 0 | success | 668 ms |
| `seeds\real_official\sparsetensor\conversion_invalid.mlir` | `parse_verify` | 0 | success | 640 ms |
| `seeds\real_official\sparsetensor\conversion_invalid.mlir` | `canonicalize_cse_sccp` | 0 | success | 614 ms |
| `seeds\real_official\sparsetensor\conversion_invalid.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 656 ms |
| `seeds\real_official\sparsetensor\conversion_invalid.mlir` | `affine_lowering_stress` | 0 | success | 651 ms |
| `seeds\real_official\sparsetensor\conversion_invalid.mlir` | `scf_to_cf_stress` | 0 | success | 630 ms |
| `seeds\real_official\sparsetensor\conversion_invalid.mlir` | `vector_lowering_stress` | 0 | success | 669 ms |
| `seeds\real_official\sparsetensor\conversion_invalid.mlir` | `bufferization_probe` | 1 | parser | 616 ms |
| `seeds\real_official\sparsetensor\conversion_invalid.mlir` | `linalg_affine_probe` | 0 | success | 671 ms |
| `seeds\real_official\sparsetensor\conversion_invalid.mlir` | `gpu_parallel_probe` | 0 | success | 625 ms |
| `seeds\real_official\sparsetensor\minipipeline_vector.mlir` | `parse_verify` | 0 | success | 649 ms |
| `seeds\real_official\sparsetensor\minipipeline_vector.mlir` | `canonicalize_cse_sccp` | 0 | success | 631 ms |
| `seeds\real_official\sparsetensor\minipipeline_vector.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 592 ms |
| `seeds\real_official\sparsetensor\minipipeline_vector.mlir` | `affine_lowering_stress` | 0 | success | 651 ms |
| `seeds\real_official\sparsetensor\minipipeline_vector.mlir` | `scf_to_cf_stress` | 0 | success | 661 ms |
| `seeds\real_official\sparsetensor\minipipeline_vector.mlir` | `vector_lowering_stress` | 0 | success | 641 ms |
| `seeds\real_official\sparsetensor\minipipeline_vector.mlir` | `bufferization_probe` | 0 | success | 645 ms |
| `seeds\real_official\sparsetensor\minipipeline_vector.mlir` | `linalg_affine_probe` | 0 | success | 646 ms |
| `seeds\real_official\sparsetensor\minipipeline_vector.mlir` | `gpu_parallel_probe` | 0 | success | 619 ms |
| `seeds\real_official\sparsetensor\sparse_relu.mlir` | `parse_verify` | 0 | success | 664 ms |
| `seeds\real_official\sparsetensor\sparse_relu.mlir` | `canonicalize_cse_sccp` | 0 | success | 632 ms |
| `seeds\real_official\sparsetensor\sparse_relu.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 665 ms |
| `seeds\real_official\sparsetensor\sparse_relu.mlir` | `affine_lowering_stress` | 0 | success | 652 ms |
| `seeds\real_official\sparsetensor\sparse_relu.mlir` | `scf_to_cf_stress` | 0 | success | 628 ms |
| `seeds\real_official\sparsetensor\sparse_relu.mlir` | `vector_lowering_stress` | 0 | success | 644 ms |
| `seeds\real_official\sparsetensor\sparse_relu.mlir` | `bufferization_probe` | 0 | success | 627 ms |
| `seeds\real_official\sparsetensor\sparse_relu.mlir` | `linalg_affine_probe` | 0 | success | 631 ms |
| `seeds\real_official\sparsetensor\sparse_relu.mlir` | `gpu_parallel_probe` | 0 | success | 629 ms |
| `seeds\real_official\sparsetensor\sparse_vector_mv.mlir` | `parse_verify` | 0 | success | 631 ms |
| `seeds\real_official\sparsetensor\sparse_vector_mv.mlir` | `canonicalize_cse_sccp` | 0 | success | 618 ms |
| `seeds\real_official\sparsetensor\sparse_vector_mv.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 616 ms |
| `seeds\real_official\sparsetensor\sparse_vector_mv.mlir` | `affine_lowering_stress` | 0 | success | 617 ms |
| `seeds\real_official\sparsetensor\sparse_vector_mv.mlir` | `scf_to_cf_stress` | 0 | success | 630 ms |
| `seeds\real_official\sparsetensor\sparse_vector_mv.mlir` | `vector_lowering_stress` | 0 | success | 676 ms |
| `seeds\real_official\sparsetensor\sparse_vector_mv.mlir` | `bufferization_probe` | 0 | success | 649 ms |
| `seeds\real_official\sparsetensor\sparse_vector_mv.mlir` | `linalg_affine_probe` | 0 | success | 639 ms |
| `seeds\real_official\sparsetensor\sparse_vector_mv.mlir` | `gpu_parallel_probe` | 0 | success | 615 ms |
| `seeds\real_official\spirv\IR_invalid.mlir` | `parse_verify` | 1 | parser | 627 ms |
| `seeds\real_official\spirv\IR_invalid.mlir` | `canonicalize_cse_sccp` | 1 | parser | 629 ms |
| `seeds\real_official\spirv\IR_invalid.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 634 ms |
| `seeds\real_official\spirv\IR_invalid.mlir` | `affine_lowering_stress` | 1 | parser | 641 ms |
| `seeds\real_official\spirv\IR_invalid.mlir` | `scf_to_cf_stress` | 1 | parser | 649 ms |
| `seeds\real_official\spirv\IR_invalid.mlir` | `vector_lowering_stress` | 1 | parser | 685 ms |
| `seeds\real_official\spirv\IR_invalid.mlir` | `bufferization_probe` | 1 | parser | 632 ms |
| `seeds\real_official\spirv\IR_invalid.mlir` | `linalg_affine_probe` | 1 | parser | 652 ms |
| `seeds\real_official\spirv\IR_invalid.mlir` | `gpu_parallel_probe` | 1 | parser | 611 ms |
| `seeds\real_official\spirv\IR_primitive_ops.mlir` | `parse_verify` | 0 | success | 583 ms |
| `seeds\real_official\spirv\IR_primitive_ops.mlir` | `canonicalize_cse_sccp` | 0 | success | 686 ms |
| `seeds\real_official\spirv\IR_primitive_ops.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 608 ms |
| `seeds\real_official\spirv\IR_primitive_ops.mlir` | `affine_lowering_stress` | 0 | success | 679 ms |
| `seeds\real_official\spirv\IR_primitive_ops.mlir` | `scf_to_cf_stress` | 0 | success | 635 ms |
| `seeds\real_official\spirv\IR_primitive_ops.mlir` | `vector_lowering_stress` | 0 | success | 620 ms |
| `seeds\real_official\spirv\IR_primitive_ops.mlir` | `bufferization_probe` | 0 | success | 657 ms |
| `seeds\real_official\spirv\IR_primitive_ops.mlir` | `linalg_affine_probe` | 0 | success | 605 ms |
| `seeds\real_official\spirv\IR_primitive_ops.mlir` | `gpu_parallel_probe` | 0 | success | 649 ms |
| `seeds\real_official\spirv\IR_target.mlir` | `parse_verify` | 0 | success | 628 ms |
| `seeds\real_official\spirv\IR_target.mlir` | `canonicalize_cse_sccp` | 0 | success | 588 ms |
| `seeds\real_official\spirv\IR_target.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 634 ms |
| `seeds\real_official\spirv\IR_target.mlir` | `affine_lowering_stress` | 0 | success | 635 ms |
| `seeds\real_official\spirv\IR_target.mlir` | `scf_to_cf_stress` | 0 | success | 600 ms |
| `seeds\real_official\spirv\IR_target.mlir` | `vector_lowering_stress` | 0 | success | 621 ms |
| `seeds\real_official\spirv\IR_target.mlir` | `bufferization_probe` | 0 | success | 592 ms |
| `seeds\real_official\spirv\IR_target.mlir` | `linalg_affine_probe` | 0 | success | 615 ms |
| `seeds\real_official\spirv\IR_target.mlir` | `gpu_parallel_probe` | 0 | success | 584 ms |
| `seeds\real_official\tensor\canonicalize_extra.mlir` | `parse_verify` | 1 | unknown failure | 647 ms |
| `seeds\real_official\tensor\canonicalize_extra.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 622 ms |
| `seeds\real_official\tensor\canonicalize_extra.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 647 ms |
| `seeds\real_official\tensor\canonicalize_extra.mlir` | `affine_lowering_stress` | 1 | unknown failure | 651 ms |
| `seeds\real_official\tensor\canonicalize_extra.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 626 ms |
| `seeds\real_official\tensor\canonicalize_extra.mlir` | `vector_lowering_stress` | 1 | unknown failure | 669 ms |
| `seeds\real_official\tensor\canonicalize_extra.mlir` | `bufferization_probe` | 1 | unknown failure | 648 ms |
| `seeds\real_official\tensor\canonicalize_extra.mlir` | `linalg_affine_probe` | 1 | unknown failure | 672 ms |
| `seeds\real_official\tensor\canonicalize_extra.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 627 ms |
| `seeds\real_official\tensor\decompose_concat.mlir` | `parse_verify` | 0 | success | 634 ms |
| `seeds\real_official\tensor\decompose_concat.mlir` | `canonicalize_cse_sccp` | 0 | success | 622 ms |
| `seeds\real_official\tensor\decompose_concat.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 631 ms |
| `seeds\real_official\tensor\decompose_concat.mlir` | `affine_lowering_stress` | 0 | success | 602 ms |
| `seeds\real_official\tensor\decompose_concat.mlir` | `scf_to_cf_stress` | 0 | success | 764 ms |
| `seeds\real_official\tensor\decompose_concat.mlir` | `vector_lowering_stress` | 0 | success | 654 ms |
| `seeds\real_official\tensor\decompose_concat.mlir` | `bufferization_probe` | 0 | success | 601 ms |
| `seeds\real_official\tensor\decompose_concat.mlir` | `linalg_affine_probe` | 0 | success | 668 ms |
| `seeds\real_official\tensor\decompose_concat.mlir` | `gpu_parallel_probe` | 0 | success | 643 ms |
| `seeds\real_official\tensor\extract_from_collapse_shape.mlir` | `parse_verify` | 0 | success | 616 ms |
| `seeds\real_official\tensor\extract_from_collapse_shape.mlir` | `canonicalize_cse_sccp` | 0 | success | 639 ms |
| `seeds\real_official\tensor\extract_from_collapse_shape.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 636 ms |
| `seeds\real_official\tensor\extract_from_collapse_shape.mlir` | `affine_lowering_stress` | 0 | success | 656 ms |
| `seeds\real_official\tensor\extract_from_collapse_shape.mlir` | `scf_to_cf_stress` | 0 | success | 655 ms |
| `seeds\real_official\tensor\extract_from_collapse_shape.mlir` | `vector_lowering_stress` | 0 | success | 639 ms |
| `seeds\real_official\tensor\extract_from_collapse_shape.mlir` | `bufferization_probe` | 0 | success | 644 ms |
| `seeds\real_official\tensor\extract_from_collapse_shape.mlir` | `linalg_affine_probe` | 0 | success | 628 ms |
| `seeds\real_official\tensor\extract_from_collapse_shape.mlir` | `gpu_parallel_probe` | 0 | success | 602 ms |
| `seeds\real_official\tensor\fold_constant_extract_slice.mlir` | `parse_verify` | 1 | unknown failure | 603 ms |
| `seeds\real_official\tensor\fold_constant_extract_slice.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 640 ms |
| `seeds\real_official\tensor\fold_constant_extract_slice.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 630 ms |
| `seeds\real_official\tensor\fold_constant_extract_slice.mlir` | `affine_lowering_stress` | 1 | unknown failure | 656 ms |
| `seeds\real_official\tensor\fold_constant_extract_slice.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 649 ms |
| `seeds\real_official\tensor\fold_constant_extract_slice.mlir` | `vector_lowering_stress` | 1 | unknown failure | 651 ms |
| `seeds\real_official\tensor\fold_constant_extract_slice.mlir` | `bufferization_probe` | 1 | unknown failure | 666 ms |
| `seeds\real_official\tensor\fold_constant_extract_slice.mlir` | `linalg_affine_probe` | 1 | unknown failure | 624 ms |
| `seeds\real_official\tensor\fold_constant_extract_slice.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 640 ms |
| `seeds\real_official\tensor\int_range_inference.mlir` | `parse_verify` | 0 | success | 632 ms |
| `seeds\real_official\tensor\int_range_inference.mlir` | `canonicalize_cse_sccp` | 0 | success | 658 ms |
| `seeds\real_official\tensor\int_range_inference.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 634 ms |
| `seeds\real_official\tensor\int_range_inference.mlir` | `affine_lowering_stress` | 0 | success | 654 ms |
| `seeds\real_official\tensor\int_range_inference.mlir` | `scf_to_cf_stress` | 0 | success | 649 ms |
| `seeds\real_official\tensor\int_range_inference.mlir` | `vector_lowering_stress` | 0 | success | 607 ms |
| `seeds\real_official\tensor\int_range_inference.mlir` | `bufferization_probe` | 0 | success | 602 ms |
| `seeds\real_official\tensor\int_range_inference.mlir` | `linalg_affine_probe` | 0 | success | 692 ms |
| `seeds\real_official\tensor\int_range_inference.mlir` | `gpu_parallel_probe` | 0 | success | 661 ms |
| `seeds\real_official\tensor\ops_extra.mlir` | `parse_verify` | 0 | success | 658 ms |
| `seeds\real_official\tensor\ops_extra.mlir` | `canonicalize_cse_sccp` | 0 | success | 656 ms |
| `seeds\real_official\tensor\ops_extra.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 626 ms |
| `seeds\real_official\tensor\ops_extra.mlir` | `affine_lowering_stress` | 0 | success | 642 ms |
| `seeds\real_official\tensor\ops_extra.mlir` | `scf_to_cf_stress` | 0 | success | 627 ms |
| `seeds\real_official\tensor\ops_extra.mlir` | `vector_lowering_stress` | 0 | success | 666 ms |
| `seeds\real_official\tensor\ops_extra.mlir` | `bufferization_probe` | 1 | unknown failure | 621 ms |
| `seeds\real_official\tensor\ops_extra.mlir` | `linalg_affine_probe` | 0 | success | 630 ms |
| `seeds\real_official\tensor\ops_extra.mlir` | `gpu_parallel_probe` | 0 | success | 670 ms |
| `seeds\real_official\tensor\reify_shapes.mlir` | `parse_verify` | 0 | success | 649 ms |
| `seeds\real_official\tensor\reify_shapes.mlir` | `canonicalize_cse_sccp` | 0 | success | 594 ms |
| `seeds\real_official\tensor\reify_shapes.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 616 ms |
| `seeds\real_official\tensor\reify_shapes.mlir` | `affine_lowering_stress` | 0 | success | 615 ms |
| `seeds\real_official\tensor\reify_shapes.mlir` | `scf_to_cf_stress` | 0 | success | 675 ms |
| `seeds\real_official\tensor\reify_shapes.mlir` | `vector_lowering_stress` | 0 | success | 619 ms |
| `seeds\real_official\tensor\reify_shapes.mlir` | `bufferization_probe` | 0 | success | 623 ms |
| `seeds\real_official\tensor\reify_shapes.mlir` | `linalg_affine_probe` | 0 | success | 651 ms |
| `seeds\real_official\tensor\reify_shapes.mlir` | `gpu_parallel_probe` | 0 | success | 659 ms |
| `seeds\real_official\tosa\canonicalize.mlir` | `parse_verify` | 1 | unknown failure | 657 ms |
| `seeds\real_official\tosa\canonicalize.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 636 ms |
| `seeds\real_official\tosa\canonicalize.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 656 ms |
| `seeds\real_official\tosa\canonicalize.mlir` | `affine_lowering_stress` | 1 | unknown failure | 637 ms |
| `seeds\real_official\tosa\canonicalize.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 691 ms |
| `seeds\real_official\tosa\canonicalize.mlir` | `vector_lowering_stress` | 1 | unknown failure | 627 ms |
| `seeds\real_official\tosa\canonicalize.mlir` | `bufferization_probe` | 1 | unknown failure | 647 ms |
| `seeds\real_official\tosa\canonicalize.mlir` | `linalg_affine_probe` | 1 | unknown failure | 677 ms |
| `seeds\real_official\tosa\canonicalize.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 650 ms |
| `seeds\real_official\tosa\invalid.mlir` | `parse_verify` | 1 | parser | 722 ms |
| `seeds\real_official\tosa\invalid.mlir` | `canonicalize_cse_sccp` | 1 | parser | 770 ms |
| `seeds\real_official\tosa\invalid.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 733 ms |
| `seeds\real_official\tosa\invalid.mlir` | `affine_lowering_stress` | 1 | parser | 749 ms |
| `seeds\real_official\tosa\invalid.mlir` | `scf_to_cf_stress` | 1 | parser | 771 ms |
| `seeds\real_official\tosa\invalid.mlir` | `vector_lowering_stress` | 1 | parser | 731 ms |
| `seeds\real_official\tosa\invalid.mlir` | `bufferization_probe` | 1 | parser | 719 ms |
| `seeds\real_official\tosa\invalid.mlir` | `linalg_affine_probe` | 1 | parser | 710 ms |
| `seeds\real_official\tosa\invalid.mlir` | `gpu_parallel_probe` | 1 | parser | 737 ms |
| `seeds\real_official\tosa\ops.mlir` | `parse_verify` | 1 | unknown failure | 622 ms |
| `seeds\real_official\tosa\ops.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 657 ms |
| `seeds\real_official\tosa\ops.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 676 ms |
| `seeds\real_official\tosa\ops.mlir` | `affine_lowering_stress` | 1 | unknown failure | 641 ms |
| `seeds\real_official\tosa\ops.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 645 ms |
| `seeds\real_official\tosa\ops.mlir` | `vector_lowering_stress` | 1 | unknown failure | 618 ms |
| `seeds\real_official\tosa\ops.mlir` | `bufferization_probe` | 1 | unknown failure | 627 ms |
| `seeds\real_official\tosa\ops.mlir` | `linalg_affine_probe` | 1 | unknown failure | 664 ms |
| `seeds\real_official\tosa\ops.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 660 ms |
| `seeds\real_official\vector\bufferize_invalid.mlir` | `parse_verify` | 0 | success | 663 ms |
| `seeds\real_official\vector\bufferize_invalid.mlir` | `canonicalize_cse_sccp` | 0 | success | 656 ms |
| `seeds\real_official\vector\bufferize_invalid.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 670 ms |
| `seeds\real_official\vector\bufferize_invalid.mlir` | `affine_lowering_stress` | 0 | success | 665 ms |
| `seeds\real_official\vector\bufferize_invalid.mlir` | `scf_to_cf_stress` | 0 | success | 652 ms |
| `seeds\real_official\vector\bufferize_invalid.mlir` | `vector_lowering_stress` | 1 | parser | 604 ms |
| `seeds\real_official\vector\bufferize_invalid.mlir` | `bufferization_probe` | 1 | parser | 757 ms |
| `seeds\real_official\vector\bufferize_invalid.mlir` | `linalg_affine_probe` | 0 | success | 635 ms |
| `seeds\real_official\vector\bufferize_invalid.mlir` | `gpu_parallel_probe` | 0 | success | 633 ms |
| `seeds\real_official\vector\canonicalize_vector_to_elements.mlir` | `parse_verify` | 0 | success | 593 ms |
| `seeds\real_official\vector\canonicalize_vector_to_elements.mlir` | `canonicalize_cse_sccp` | 0 | success | 651 ms |
| `seeds\real_official\vector\canonicalize_vector_to_elements.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 667 ms |
| `seeds\real_official\vector\canonicalize_vector_to_elements.mlir` | `affine_lowering_stress` | 0 | success | 641 ms |
| `seeds\real_official\vector\canonicalize_vector_to_elements.mlir` | `scf_to_cf_stress` | 0 | success | 591 ms |
| `seeds\real_official\vector\canonicalize_vector_to_elements.mlir` | `vector_lowering_stress` | 0 | success | 630 ms |
| `seeds\real_official\vector\canonicalize_vector_to_elements.mlir` | `bufferization_probe` | 0 | success | 733 ms |
| `seeds\real_official\vector\canonicalize_vector_to_elements.mlir` | `linalg_affine_probe` | 0 | success | 645 ms |
| `seeds\real_official\vector\canonicalize_vector_to_elements.mlir` | `gpu_parallel_probe` | 0 | success | 607 ms |
| `seeds\real_official\vector\constant_fold.mlir` | `parse_verify` | 0 | success | 622 ms |
| `seeds\real_official\vector\constant_fold.mlir` | `canonicalize_cse_sccp` | 0 | success | 609 ms |
| `seeds\real_official\vector\constant_fold.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 599 ms |
| `seeds\real_official\vector\constant_fold.mlir` | `affine_lowering_stress` | 0 | success | 635 ms |
| `seeds\real_official\vector\constant_fold.mlir` | `scf_to_cf_stress` | 0 | success | 604 ms |
| `seeds\real_official\vector\constant_fold.mlir` | `vector_lowering_stress` | 0 | success | 595 ms |
| `seeds\real_official\vector\constant_fold.mlir` | `bufferization_probe` | 0 | success | 634 ms |
| `seeds\real_official\vector\constant_fold.mlir` | `linalg_affine_probe` | 0 | success | 658 ms |
| `seeds\real_official\vector\constant_fold.mlir` | `gpu_parallel_probe` | 0 | success | 627 ms |
| `seeds\real_official\vector\inlining.mlir` | `parse_verify` | 0 | success | 627 ms |
| `seeds\real_official\vector\inlining.mlir` | `canonicalize_cse_sccp` | 0 | success | 626 ms |
| `seeds\real_official\vector\inlining.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 656 ms |
| `seeds\real_official\vector\inlining.mlir` | `affine_lowering_stress` | 0 | success | 618 ms |
| `seeds\real_official\vector\inlining.mlir` | `scf_to_cf_stress` | 0 | success | 597 ms |
| `seeds\real_official\vector\inlining.mlir` | `vector_lowering_stress` | 0 | success | 640 ms |
| `seeds\real_official\vector\inlining.mlir` | `bufferization_probe` | 0 | success | 612 ms |
| `seeds\real_official\vector\inlining.mlir` | `linalg_affine_probe` | 0 | success | 639 ms |
| `seeds\real_official\vector\inlining.mlir` | `gpu_parallel_probe` | 0 | success | 585 ms |
| `seeds\real_official\vector\side_effects.mlir` | `parse_verify` | 0 | success | 632 ms |
| `seeds\real_official\vector\side_effects.mlir` | `canonicalize_cse_sccp` | 0 | success | 672 ms |
| `seeds\real_official\vector\side_effects.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 621 ms |
| `seeds\real_official\vector\side_effects.mlir` | `affine_lowering_stress` | 0 | success | 620 ms |
| `seeds\real_official\vector\side_effects.mlir` | `scf_to_cf_stress` | 0 | success | 644 ms |
| `seeds\real_official\vector\side_effects.mlir` | `vector_lowering_stress` | 0 | success | 631 ms |
| `seeds\real_official\vector\side_effects.mlir` | `bufferization_probe` | 0 | success | 675 ms |
| `seeds\real_official\vector\side_effects.mlir` | `linalg_affine_probe` | 0 | success | 656 ms |
| `seeds\real_official\vector\side_effects.mlir` | `gpu_parallel_probe` | 0 | success | 635 ms |
| `seeds\scf\if_region.mlir` | `parse_verify` | 0 | success | 611 ms |
| `seeds\scf\if_region.mlir` | `canonicalize_cse_sccp` | 0 | success | 635 ms |
| `seeds\scf\if_region.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 613 ms |
| `seeds\scf\if_region.mlir` | `affine_lowering_stress` | 0 | success | 639 ms |
| `seeds\scf\if_region.mlir` | `scf_to_cf_stress` | 0 | success | 602 ms |
| `seeds\scf\if_region.mlir` | `vector_lowering_stress` | 0 | success | 665 ms |
| `seeds\scf\if_region.mlir` | `bufferization_probe` | 0 | success | 648 ms |
| `seeds\scf\if_region.mlir` | `linalg_affine_probe` | 0 | success | 642 ms |
| `seeds\scf\if_region.mlir` | `gpu_parallel_probe` | 0 | success | 616 ms |
| `seeds\tosa\tosa_add.mlir` | `parse_verify` | 0 | success | 626 ms |
| `seeds\tosa\tosa_add.mlir` | `canonicalize_cse_sccp` | 0 | success | 627 ms |
| `seeds\tosa\tosa_add.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 655 ms |
| `seeds\tosa\tosa_add.mlir` | `affine_lowering_stress` | 0 | success | 619 ms |
| `seeds\tosa\tosa_add.mlir` | `scf_to_cf_stress` | 0 | success | 777 ms |
| `seeds\tosa\tosa_add.mlir` | `vector_lowering_stress` | 0 | success | 608 ms |
| `seeds\tosa\tosa_add.mlir` | `bufferization_probe` | 1 | unknown failure | 667 ms |
| `seeds\tosa\tosa_add.mlir` | `linalg_affine_probe` | 0 | success | 634 ms |
| `seeds\tosa\tosa_add.mlir` | `gpu_parallel_probe` | 0 | success | 639 ms |