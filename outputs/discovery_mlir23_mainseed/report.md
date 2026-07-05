# MLIR Differential Report

- Seeds: 41
- Pipelines: 9
- Runs: 369
- Issues: 30

## Issues

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir`
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

- Seed: `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir`
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

- Seed: `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir`
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

- Seed: `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir`
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

- Seed: `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir`
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

## Summary

### Run categories

### Invariant findings

- none: 0

- dialect registration: 54
- parser: 27
- success: 155
- unknown failure: 133

### Issue kinds

- all pipelines failed: 23
- pipeline divergence: 7

### Failure clusters

- `dialect registration:165f8c8cdc`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:5675d85771`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:6bcb510095`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:8523af7899`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:a07e7213b9`: 9 runs, 1 seeds, category `dialect registration`
- `dialect registration:d15586f9c6`: 9 runs, 1 seeds, category `dialect registration`
- `parser:733e5feab7`: 9 runs, 1 seeds, category `parser`
- `parser:b96e904ec2`: 9 runs, 1 seeds, category `parser`
- `parser:d7ba518c5b`: 9 runs, 1 seeds, category `parser`
- `unknown failure:06408e1018`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:4388dcd47e`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:46478f3ba4`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:51d054ac6b`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:522284f4e1`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:6b31adcfd3`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:8302b25eef`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:94d6bcc4c2`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:9c3fd2e541`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:b49442f678`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:b7cf09258b`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:c52fd71a63`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:f41c9f13e2`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:fda53070e7`: 9 runs, 1 seeds, category `unknown failure`
- `unknown failure:0188fd1f67`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:117d9981ac`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:47d2295468`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:53cfe7a06b`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:9bd714644a`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:d05b082e92`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:df3a919d4f`: 1 runs, 1 seeds, category `unknown failure`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `parse_verify` | 0 | success | 597 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 568 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 579 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `affine_lowering_stress` | 0 | success | 582 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 562 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `vector_lowering_stress` | 0 | success | 612 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `bufferization_probe` | 0 | success | 594 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `linalg_affine_probe` | 0 | success | 611 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 626 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `parse_verify` | 1 | parser | 583 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `canonicalize_cse_sccp` | 1 | parser | 571 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 569 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `affine_lowering_stress` | 1 | parser | 595 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `scf_to_cf_stress` | 1 | parser | 579 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `vector_lowering_stress` | 1 | parser | 577 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `bufferization_probe` | 1 | parser | 564 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `linalg_affine_probe` | 1 | parser | 593 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `gpu_parallel_probe` | 1 | parser | 568 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `parse_verify` | 0 | success | 594 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 585 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 619 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `affine_lowering_stress` | 0 | success | 596 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 615 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `vector_lowering_stress` | 0 | success | 626 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `bufferization_probe` | 0 | success | 613 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `linalg_affine_probe` | 0 | success | 598 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 587 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `parse_verify` | 1 | dialect registration | 571 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 576 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 569 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `affine_lowering_stress` | 1 | dialect registration | 548 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 542 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `vector_lowering_stress` | 1 | dialect registration | 577 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `bufferization_probe` | 1 | dialect registration | 599 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `linalg_affine_probe` | 1 | dialect registration | 581 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 588 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `parse_verify` | 1 | parser | 607 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `canonicalize_cse_sccp` | 1 | parser | 685 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 598 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `affine_lowering_stress` | 1 | parser | 584 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `scf_to_cf_stress` | 1 | parser | 606 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `vector_lowering_stress` | 1 | parser | 589 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `bufferization_probe` | 1 | parser | 586 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `linalg_affine_probe` | 1 | parser | 591 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `gpu_parallel_probe` | 1 | parser | 596 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `parse_verify` | 1 | unknown failure | 582 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 621 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 613 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 588 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 567 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 562 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 562 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 557 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `parse_verify` | 1 | unknown failure | 594 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 559 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 575 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 584 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 594 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 564 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 581 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 569 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 588 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `parse_verify` | 1 | unknown failure | 618 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 587 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 562 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 562 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 583 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 588 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 569 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 570 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 588 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `parse_verify` | 0 | success | 573 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 584 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 586 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `affine_lowering_stress` | 0 | success | 593 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 599 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `vector_lowering_stress` | 0 | success | 610 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `bufferization_probe` | 0 | success | 594 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `linalg_affine_probe` | 0 | success | 585 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 594 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `parse_verify` | 0 | success | 574 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 602 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 585 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `affine_lowering_stress` | 0 | success | 590 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 591 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `vector_lowering_stress` | 0 | success | 610 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `bufferization_probe` | 0 | success | 584 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `linalg_affine_probe` | 0 | success | 622 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 604 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `parse_verify` | 0 | success | 602 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 615 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 667 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `affine_lowering_stress` | 0 | success | 654 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 629 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `vector_lowering_stress` | 0 | success | 630 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 597 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `linalg_affine_probe` | 0 | success | 633 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 626 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `parse_verify` | 1 | dialect registration | 579 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 589 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 555 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `affine_lowering_stress` | 1 | dialect registration | 593 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 591 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `vector_lowering_stress` | 1 | dialect registration | 586 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `bufferization_probe` | 1 | dialect registration | 557 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `linalg_affine_probe` | 1 | dialect registration | 580 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 590 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `parse_verify` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 590 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 567 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 590 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 573 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 574 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 582 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 581 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `parse_verify` | 0 | success | 571 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 578 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 601 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `affine_lowering_stress` | 0 | success | 580 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 604 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `vector_lowering_stress` | 0 | success | 583 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `bufferization_probe` | 0 | success | 583 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `linalg_affine_probe` | 0 | success | 608 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 583 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `parse_verify` | 1 | dialect registration | 564 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 562 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 590 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `affine_lowering_stress` | 1 | dialect registration | 576 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 567 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `vector_lowering_stress` | 1 | dialect registration | 600 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `bufferization_probe` | 1 | dialect registration | 589 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `linalg_affine_probe` | 1 | dialect registration | 563 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 572 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `parse_verify` | 1 | unknown failure | 604 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 577 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 587 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 594 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 600 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 550 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 495 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 573 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `parse_verify` | 0 | success | 640 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 604 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 590 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `affine_lowering_stress` | 0 | success | 615 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 583 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `vector_lowering_stress` | 0 | success | 590 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `bufferization_probe` | 0 | success | 588 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `linalg_affine_probe` | 0 | success | 571 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 579 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `parse_verify` | 1 | unknown failure | 582 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 570 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 575 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 579 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 605 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 579 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 578 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `parse_verify` | 1 | unknown failure | 585 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 582 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 588 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 573 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 599 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 591 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 570 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 564 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `parse_verify` | 1 | unknown failure | 578 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 573 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 606 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 582 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 596 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 585 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 603 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 595 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 592 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `parse_verify` | 1 | unknown failure | 586 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 578 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 570 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 613 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 632 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 571 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 571 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 555 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 580 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `parse_verify` | 0 | success | 591 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 611 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 599 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `affine_lowering_stress` | 0 | success | 580 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 578 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `vector_lowering_stress` | 0 | success | 595 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `bufferization_probe` | 0 | success | 628 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `linalg_affine_probe` | 0 | success | 604 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 578 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `parse_verify` | 0 | success | 598 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 612 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 608 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `affine_lowering_stress` | 0 | success | 609 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 561 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `vector_lowering_stress` | 0 | success | 619 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `bufferization_probe` | 0 | success | 596 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `linalg_affine_probe` | 0 | success | 599 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 588 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `parse_verify` | 0 | success | 555 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 586 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 572 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `affine_lowering_stress` | 0 | success | 596 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 580 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `vector_lowering_stress` | 0 | success | 581 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `bufferization_probe` | 0 | success | 581 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `linalg_affine_probe` | 0 | success | 599 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 590 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `parse_verify` | 1 | unknown failure | 569 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 579 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 570 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 580 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 613 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 605 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 573 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 596 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 590 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `parse_verify` | 1 | unknown failure | 610 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 584 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 564 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 633 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 603 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 605 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 592 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 584 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 600 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `parse_verify` | 0 | success | 591 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 595 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 590 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `affine_lowering_stress` | 0 | success | 611 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 607 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `vector_lowering_stress` | 0 | success | 586 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 596 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `linalg_affine_probe` | 0 | success | 592 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 589 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `parse_verify` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 567 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 578 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 573 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 591 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 588 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 599 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 596 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 563 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `parse_verify` | 1 | dialect registration | 601 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 570 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 610 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `affine_lowering_stress` | 1 | dialect registration | 593 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 599 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `vector_lowering_stress` | 1 | dialect registration | 589 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `bufferization_probe` | 1 | dialect registration | 601 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `linalg_affine_probe` | 1 | dialect registration | 592 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 581 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `parse_verify` | 0 | success | 556 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 582 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 571 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `affine_lowering_stress` | 0 | success | 585 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 592 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `vector_lowering_stress` | 0 | success | 582 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `bufferization_probe` | 0 | success | 600 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `linalg_affine_probe` | 0 | success | 597 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 606 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `parse_verify` | 0 | success | 556 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 601 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 566 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `affine_lowering_stress` | 0 | success | 606 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 583 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `vector_lowering_stress` | 0 | success | 576 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 583 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `linalg_affine_probe` | 0 | success | 590 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 579 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `parse_verify` | 0 | success | 603 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 600 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 587 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `affine_lowering_stress` | 0 | success | 595 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 573 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `vector_lowering_stress` | 0 | success | 585 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 579 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `linalg_affine_probe` | 0 | success | 579 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 591 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `parse_verify` | 1 | unknown failure | 572 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 607 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 580 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 602 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 609 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 588 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 605 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 590 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `parse_verify` | 0 | success | 583 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 578 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 602 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `affine_lowering_stress` | 0 | success | 586 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 603 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `vector_lowering_stress` | 0 | success | 645 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `bufferization_probe` | 0 | success | 617 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `linalg_affine_probe` | 0 | success | 617 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 610 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `parse_verify` | 1 | unknown failure | 577 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `canonicalize_cse_sccp` | 1 | unknown failure | 584 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | unknown failure | 591 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `affine_lowering_stress` | 1 | unknown failure | 588 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `scf_to_cf_stress` | 1 | unknown failure | 588 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `vector_lowering_stress` | 1 | unknown failure | 580 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `linalg_affine_probe` | 1 | unknown failure | 594 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `gpu_parallel_probe` | 1 | unknown failure | 570 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `parse_verify` | 1 | dialect registration | 575 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 578 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 604 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `affine_lowering_stress` | 1 | dialect registration | 619 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 600 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `vector_lowering_stress` | 1 | dialect registration | 560 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `bufferization_probe` | 1 | dialect registration | 576 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `linalg_affine_probe` | 1 | dialect registration | 601 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 571 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `parse_verify` | 0 | success | 598 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 616 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 629 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `affine_lowering_stress` | 0 | success | 645 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 602 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `vector_lowering_stress` | 0 | success | 636 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 580 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `linalg_affine_probe` | 0 | success | 603 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 641 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `parse_verify` | 0 | success | 632 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 637 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 602 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `affine_lowering_stress` | 0 | success | 600 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 634 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `vector_lowering_stress` | 0 | success | 581 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `bufferization_probe` | 1 | unknown failure | 580 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `linalg_affine_probe` | 0 | success | 599 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 663 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `parse_verify` | 1 | dialect registration | 601 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `canonicalize_cse_sccp` | 1 | dialect registration | 590 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | dialect registration | 592 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `affine_lowering_stress` | 1 | dialect registration | 581 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `scf_to_cf_stress` | 1 | dialect registration | 598 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `vector_lowering_stress` | 1 | dialect registration | 585 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `bufferization_probe` | 1 | dialect registration | 598 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `linalg_affine_probe` | 1 | dialect registration | 625 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `gpu_parallel_probe` | 1 | dialect registration | 590 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `parse_verify` | 1 | parser | 643 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `canonicalize_cse_sccp` | 1 | parser | 692 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 1 | parser | 664 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `affine_lowering_stress` | 1 | parser | 664 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `scf_to_cf_stress` | 1 | parser | 664 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `vector_lowering_stress` | 1 | parser | 638 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `bufferization_probe` | 1 | parser | 663 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `linalg_affine_probe` | 1 | parser | 671 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `gpu_parallel_probe` | 1 | parser | 679 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `parse_verify` | 0 | success | 599 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `canonicalize_cse_sccp` | 0 | success | 612 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `symbol_dce_inliner_canonicalize` | 0 | success | 585 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `affine_lowering_stress` | 0 | success | 590 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `scf_to_cf_stress` | 0 | success | 603 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `vector_lowering_stress` | 0 | success | 608 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `bufferization_probe` | 0 | success | 592 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `linalg_affine_probe` | 0 | success | 593 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `gpu_parallel_probe` | 0 | success | 614 ms |