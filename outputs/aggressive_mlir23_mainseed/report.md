# MLIR Differential Report

- Seeds: 41
- Pipelines: 11
- Runs: 451
- Issues: 32

## Issues

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_convergence_probe | 1 | parser | false
memref_alias_metadata | 1 | parser | false
memref_llvm_lowering | 1 | parser | false
vector_reduction_lowering | 1 | parser | false
vector_to_scf_llvm | 1 | parser | false
tensor_linalg_loop_lowering | 1 | parser | false
linalg_parallel_gpu | 1 | parser | false
bufferization_deallocation | 1 | parser | false
shape_reify_resolve | 1 | parser | false
sparse_lowering_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_convergence_probe | 1 | dialect registration | false
memref_alias_metadata | 1 | dialect registration | false
memref_llvm_lowering | 1 | dialect registration | false
vector_reduction_lowering | 1 | dialect registration | false
vector_to_scf_llvm | 1 | dialect registration | false
tensor_linalg_loop_lowering | 1 | dialect registration | false
linalg_parallel_gpu | 1 | dialect registration | false
bufferization_deallocation | 1 | dialect registration | false
shape_reify_resolve | 1 | dialect registration | false
sparse_lowering_probe | 1 | dialect registration | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_convergence_probe | 1 | parser | false
memref_alias_metadata | 1 | parser | false
memref_llvm_lowering | 1 | parser | false
vector_reduction_lowering | 1 | parser | false
vector_to_scf_llvm | 1 | parser | false
tensor_linalg_loop_lowering | 1 | parser | false
linalg_parallel_gpu | 1 | parser | false
bufferization_deallocation | 1 | parser | false
shape_reify_resolve | 1 | parser | false
sparse_lowering_probe | 1 | parser | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_convergence_probe | 0 | success | false
memref_alias_metadata | 0 | success | false
memref_llvm_lowering | 0 | success | false
vector_reduction_lowering | 0 | success | false
vector_to_scf_llvm | 0 | success | false
tensor_linalg_loop_lowering | 0 | success | false
linalg_parallel_gpu | 0 | success | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 0 | success | false
sparse_lowering_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_convergence_probe | 1 | dialect registration | false
memref_alias_metadata | 1 | dialect registration | false
memref_llvm_lowering | 1 | dialect registration | false
vector_reduction_lowering | 1 | dialect registration | false
vector_to_scf_llvm | 1 | dialect registration | false
tensor_linalg_loop_lowering | 1 | dialect registration | false
linalg_parallel_gpu | 1 | dialect registration | false
bufferization_deallocation | 1 | dialect registration | false
shape_reify_resolve | 1 | dialect registration | false
sparse_lowering_probe | 1 | dialect registration | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_convergence_probe | 0 | success | false
memref_alias_metadata | 0 | success | false
memref_llvm_lowering | 0 | success | false
vector_reduction_lowering | 0 | success | false
vector_to_scf_llvm | 0 | success | false
tensor_linalg_loop_lowering | 0 | success | false
linalg_parallel_gpu | 0 | success | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 0 | success | false
sparse_lowering_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_convergence_probe | 1 | dialect registration | false
memref_alias_metadata | 1 | dialect registration | false
memref_llvm_lowering | 1 | dialect registration | false
vector_reduction_lowering | 1 | dialect registration | false
vector_to_scf_llvm | 1 | dialect registration | false
tensor_linalg_loop_lowering | 1 | dialect registration | false
linalg_parallel_gpu | 1 | dialect registration | false
bufferization_deallocation | 1 | dialect registration | false
shape_reify_resolve | 1 | dialect registration | false
sparse_lowering_probe | 1 | dialect registration | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_convergence_probe | 0 | success | false
memref_alias_metadata | 0 | success | false
memref_llvm_lowering | 0 | success | false
vector_reduction_lowering | 0 | success | false
vector_to_scf_llvm | 0 | success | false
tensor_linalg_loop_lowering | 0 | success | false
linalg_parallel_gpu | 0 | success | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 0 | success | false
sparse_lowering_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_convergence_probe | 0 | success | false
memref_alias_metadata | 0 | success | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 0 | success | false
vector_to_scf_llvm | 0 | success | false
tensor_linalg_loop_lowering | 0 | success | false
linalg_parallel_gpu | 0 | success | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 0 | success | false
sparse_lowering_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_convergence_probe | 0 | success | false
memref_alias_metadata | 0 | success | false
memref_llvm_lowering | 0 | success | false
vector_reduction_lowering | 0 | success | false
vector_to_scf_llvm | 0 | success | false
tensor_linalg_loop_lowering | 0 | success | false
linalg_parallel_gpu | 0 | success | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 0 | success | false
sparse_lowering_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_convergence_probe | 1 | dialect registration | false
memref_alias_metadata | 1 | dialect registration | false
memref_llvm_lowering | 1 | dialect registration | false
vector_reduction_lowering | 1 | dialect registration | false
vector_to_scf_llvm | 1 | dialect registration | false
tensor_linalg_loop_lowering | 1 | dialect registration | false
linalg_parallel_gpu | 1 | dialect registration | false
bufferization_deallocation | 1 | dialect registration | false
shape_reify_resolve | 1 | dialect registration | false
sparse_lowering_probe | 1 | dialect registration | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_convergence_probe | 0 | success | false
memref_alias_metadata | 0 | success | false
memref_llvm_lowering | 0 | success | false
vector_reduction_lowering | 0 | success | false
vector_to_scf_llvm | 0 | success | false
tensor_linalg_loop_lowering | 0 | success | false
linalg_parallel_gpu | 0 | success | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 0 | success | false
sparse_lowering_probe | 0 | success | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_convergence_probe | 0 | success | false
memref_alias_metadata | 0 | success | false
memref_llvm_lowering | 0 | success | false
vector_reduction_lowering | 0 | success | false
vector_to_scf_llvm | 0 | success | false
tensor_linalg_loop_lowering | 0 | success | false
linalg_parallel_gpu | 0 | success | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 0 | success | false
sparse_lowering_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir`
- Summary: All pipelines failed. Categories: unknown failure.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | unknown failure | false
canonicalize_convergence_probe | 1 | unknown failure | false
memref_alias_metadata | 1 | unknown failure | false
memref_llvm_lowering | 1 | unknown failure | false
vector_reduction_lowering | 1 | unknown failure | false
vector_to_scf_llvm | 1 | unknown failure | false
tensor_linalg_loop_lowering | 1 | unknown failure | false
linalg_parallel_gpu | 1 | unknown failure | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 1 | unknown failure | false
sparse_lowering_probe | 1 | unknown failure | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_convergence_probe | 1 | dialect registration | false
memref_alias_metadata | 1 | dialect registration | false
memref_llvm_lowering | 1 | dialect registration | false
vector_reduction_lowering | 1 | dialect registration | false
vector_to_scf_llvm | 1 | dialect registration | false
tensor_linalg_loop_lowering | 1 | dialect registration | false
linalg_parallel_gpu | 1 | dialect registration | false
bufferization_deallocation | 1 | dialect registration | false
shape_reify_resolve | 1 | dialect registration | false
sparse_lowering_probe | 1 | dialect registration | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_convergence_probe | 0 | success | false
memref_alias_metadata | 0 | success | false
memref_llvm_lowering | 0 | success | false
vector_reduction_lowering | 0 | success | false
vector_to_scf_llvm | 0 | success | false
tensor_linalg_loop_lowering | 0 | success | false
linalg_parallel_gpu | 0 | success | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 0 | success | false
sparse_lowering_probe | 0 | success | false
```

### [high] pipeline divergence

- Seed: `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize_convergence_probe | 0 | success | false
memref_alias_metadata | 0 | success | false
memref_llvm_lowering | 0 | success | false
vector_reduction_lowering | 0 | success | false
vector_to_scf_llvm | 0 | success | false
tensor_linalg_loop_lowering | 0 | success | false
linalg_parallel_gpu | 0 | success | false
bufferization_deallocation | 1 | unknown failure | false
shape_reify_resolve | 0 | success | false
sparse_lowering_probe | 0 | success | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir`
- Summary: All pipelines failed. Categories: dialect registration.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | dialect registration | false
canonicalize_convergence_probe | 1 | dialect registration | false
memref_alias_metadata | 1 | dialect registration | false
memref_llvm_lowering | 1 | dialect registration | false
vector_reduction_lowering | 1 | dialect registration | false
vector_to_scf_llvm | 1 | dialect registration | false
tensor_linalg_loop_lowering | 1 | dialect registration | false
linalg_parallel_gpu | 1 | dialect registration | false
bufferization_deallocation | 1 | dialect registration | false
shape_reify_resolve | 1 | dialect registration | false
sparse_lowering_probe | 1 | dialect registration | false
```

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir`
- Summary: All pipelines failed. Categories: parser.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 1 | parser | false
canonicalize_convergence_probe | 1 | parser | false
memref_alias_metadata | 1 | parser | false
memref_llvm_lowering | 1 | parser | false
vector_reduction_lowering | 1 | parser | false
vector_to_scf_llvm | 1 | parser | false
tensor_linalg_loop_lowering | 1 | parser | false
linalg_parallel_gpu | 1 | parser | false
bufferization_deallocation | 1 | parser | false
shape_reify_resolve | 1 | parser | false
sparse_lowering_probe | 1 | parser | false
```

## Summary

### Run categories

### Invariant findings

- none: 0

- dialect registration: 66
- parser: 33
- success: 188
- unknown failure: 164

### Issue kinds

- all pipelines failed: 23
- pipeline divergence: 9

### Failure clusters

- `dialect registration:165f8c8cdc`: 11 runs, 1 seeds, category `dialect registration`
- `dialect registration:5675d85771`: 11 runs, 1 seeds, category `dialect registration`
- `dialect registration:6bcb510095`: 11 runs, 1 seeds, category `dialect registration`
- `dialect registration:8523af7899`: 11 runs, 1 seeds, category `dialect registration`
- `dialect registration:a07e7213b9`: 11 runs, 1 seeds, category `dialect registration`
- `dialect registration:d15586f9c6`: 11 runs, 1 seeds, category `dialect registration`
- `parser:733e5feab7`: 11 runs, 1 seeds, category `parser`
- `parser:b96e904ec2`: 11 runs, 1 seeds, category `parser`
- `parser:d7ba518c5b`: 11 runs, 1 seeds, category `parser`
- `unknown failure:06408e1018`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:4388dcd47e`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:46478f3ba4`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:51d054ac6b`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:522284f4e1`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:6b31adcfd3`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:8302b25eef`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:94d6bcc4c2`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:9c3fd2e541`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:b49442f678`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:b7cf09258b`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:c52fd71a63`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:f41c9f13e2`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:fda53070e7`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:0188fd1f67`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:117d9981ac`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:3d68942e79`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:47d2295468`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:8c0dc5472b`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:9bd714644a`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:c17179f7a2`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:d05b082e92`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:d83e70aa4e`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:df3a919d4f`: 1 runs, 1 seeds, category `unknown failure`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `parse_verify` | 0 | success | 680 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 648 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `memref_alias_metadata` | 0 | success | 602 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 604 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 590 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 606 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 592 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 590 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `bufferization_deallocation` | 0 | success | 624 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `shape_reify_resolve` | 0 | success | 597 ms |
| `seeds\real_official_main23\conversion_arithtollvm_arith_to_llvm_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 599 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `parse_verify` | 1 | parser | 597 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `canonicalize_convergence_probe` | 1 | parser | 618 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `memref_alias_metadata` | 1 | parser | 614 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `memref_llvm_lowering` | 1 | parser | 576 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `vector_reduction_lowering` | 1 | parser | 592 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `vector_to_scf_llvm` | 1 | parser | 619 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | parser | 617 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `linalg_parallel_gpu` | 1 | parser | 643 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `bufferization_deallocation` | 1 | parser | 601 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `shape_reify_resolve` | 1 | parser | 637 ms |
| `seeds\real_official_main23\conversion_functollvm_convert_funcs_mlir.mlir` | `sparse_lowering_probe` | 1 | parser | 631 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `parse_verify` | 0 | success | 626 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 633 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `memref_alias_metadata` | 0 | success | 660 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 631 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 618 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 652 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 654 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 665 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `bufferization_deallocation` | 0 | success | 635 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `shape_reify_resolve` | 0 | success | 643 ms |
| `seeds\real_official_main23\conversion_memreftollvm_memref_to_llvm_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 672 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `parse_verify` | 1 | dialect registration | 634 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `canonicalize_convergence_probe` | 1 | dialect registration | 620 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `memref_alias_metadata` | 1 | dialect registration | 600 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `memref_llvm_lowering` | 1 | dialect registration | 612 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `vector_reduction_lowering` | 1 | dialect registration | 591 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `vector_to_scf_llvm` | 1 | dialect registration | 633 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | dialect registration | 607 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `linalg_parallel_gpu` | 1 | dialect registration | 622 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `bufferization_deallocation` | 1 | dialect registration | 599 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `shape_reify_resolve` | 1 | dialect registration | 621 ms |
| `seeds\real_official_main23\conversion_scftocontrolflow_convert_to_cfg_mlir.mlir` | `sparse_lowering_probe` | 1 | dialect registration | 610 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `parse_verify` | 1 | parser | 592 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `canonicalize_convergence_probe` | 1 | parser | 584 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `memref_alias_metadata` | 1 | parser | 586 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `memref_llvm_lowering` | 1 | parser | 600 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `vector_reduction_lowering` | 1 | parser | 618 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `vector_to_scf_llvm` | 1 | parser | 607 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | parser | 609 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `linalg_parallel_gpu` | 1 | parser | 602 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `bufferization_deallocation` | 1 | parser | 619 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `shape_reify_resolve` | 1 | parser | 616 ms |
| `seeds\real_official_main23\conversion_tosatolinalg_tosa_to_linalg_mlir.mlir` | `sparse_lowering_probe` | 1 | parser | 584 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `parse_verify` | 1 | unknown failure | 634 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 642 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 601 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 587 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 613 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 597 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 609 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 649 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 602 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 598 ms |
| `seeds\real_official_main23\conversion_vectortollvm_vector_to_llvm_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 611 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `parse_verify` | 1 | unknown failure | 622 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 737 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 589 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 673 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 622 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 639 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 616 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 651 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 633 ms |
| `seeds\real_official_main23\dialect_affine_affine_data_copy_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 602 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `parse_verify` | 1 | unknown failure | 640 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 587 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 678 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 606 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 617 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 622 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 608 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 652 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 592 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 640 ms |
| `seeds\real_official_main23\dialect_affine_affine_loop_invariant_code_motion_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 644 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `parse_verify` | 0 | success | 614 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 609 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `memref_alias_metadata` | 0 | success | 617 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 653 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 678 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 649 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 626 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 626 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `bufferization_deallocation` | 0 | success | 686 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `shape_reify_resolve` | 0 | success | 688 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_1d_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 634 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `parse_verify` | 0 | success | 634 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 623 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `memref_alias_metadata` | 0 | success | 631 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 616 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 610 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 636 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 609 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 616 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `bufferization_deallocation` | 0 | success | 586 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `shape_reify_resolve` | 0 | success | 614 ms |
| `seeds\real_official_main23\dialect_affine_supervectorize_vectorize_2d_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 625 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `parse_verify` | 0 | success | 673 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 679 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `memref_alias_metadata` | 0 | success | 677 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 1046 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 690 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 690 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 686 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 692 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 660 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `shape_reify_resolve` | 0 | success | 711 ms |
| `seeds\real_official_main23\dialect_arith_canonicalize_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 681 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `parse_verify` | 1 | dialect registration | 645 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `canonicalize_convergence_probe` | 1 | dialect registration | 632 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `memref_alias_metadata` | 1 | dialect registration | 608 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `memref_llvm_lowering` | 1 | dialect registration | 657 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `vector_reduction_lowering` | 1 | dialect registration | 617 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `vector_to_scf_llvm` | 1 | dialect registration | 617 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | dialect registration | 672 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `linalg_parallel_gpu` | 1 | dialect registration | 619 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `bufferization_deallocation` | 1 | dialect registration | 637 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `shape_reify_resolve` | 1 | dialect registration | 611 ms |
| `seeds\real_official_main23\dialect_arith_int_range_interface_mlir.mlir` | `sparse_lowering_probe` | 1 | dialect registration | 599 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `parse_verify` | 1 | unknown failure | 656 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 581 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 600 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 631 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 643 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 647 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 622 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 610 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 631 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 615 ms |
| `seeds\real_official_main23\dialect_arith_int_range_opts_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 657 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `parse_verify` | 0 | success | 617 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 620 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `memref_alias_metadata` | 0 | success | 623 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 608 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 630 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 619 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 632 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 651 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 626 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `shape_reify_resolve` | 0 | success | 623 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_allow_return_allocs_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 569 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `parse_verify` | 1 | dialect registration | 598 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `canonicalize_convergence_probe` | 1 | dialect registration | 631 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `memref_alias_metadata` | 1 | dialect registration | 567 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `memref_llvm_lowering` | 1 | dialect registration | 640 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `vector_reduction_lowering` | 1 | dialect registration | 624 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `vector_to_scf_llvm` | 1 | dialect registration | 650 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | dialect registration | 594 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `linalg_parallel_gpu` | 1 | dialect registration | 606 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `bufferization_deallocation` | 1 | dialect registration | 618 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `shape_reify_resolve` | 1 | dialect registration | 621 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_bufferize_analysis_mlir.mlir` | `sparse_lowering_probe` | 1 | dialect registration | 588 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `parse_verify` | 1 | unknown failure | 648 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 647 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 623 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 613 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 611 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 638 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 627 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 594 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 767 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 615 ms |
| `seeds\real_official_main23\dialect_bufferization_transforms_one_shot_module_bufferize_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 753 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `parse_verify` | 0 | success | 633 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 640 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `memref_alias_metadata` | 0 | success | 636 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 658 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 649 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 643 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 595 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 648 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 657 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `shape_reify_resolve` | 0 | success | 629 ms |
| `seeds\real_official_main23\dialect_gpu_canonicalize_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 660 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `parse_verify` | 1 | unknown failure | 600 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 608 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 617 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 664 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 581 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 618 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 631 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 667 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 642 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 627 ms |
| `seeds\real_official_main23\dialect_linalg_canonicalize_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 636 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `parse_verify` | 1 | unknown failure | 620 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 620 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 594 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 580 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 670 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 635 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 604 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 632 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 616 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 636 ms |
| `seeds\real_official_main23\dialect_linalg_fusion_elementwise_ops_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 607 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `parse_verify` | 1 | unknown failure | 618 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 593 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 604 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 641 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 630 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 609 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 615 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 633 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 646 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 612 ms |
| `seeds\real_official_main23\dialect_linalg_generalize_named_ops_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 616 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `parse_verify` | 1 | unknown failure | 722 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 623 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 709 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 595 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 607 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 584 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 603 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 619 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 628 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 617 ms |
| `seeds\real_official_main23\dialect_linalg_inline_scalar_operands_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 609 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `parse_verify` | 0 | success | 588 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 652 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `memref_alias_metadata` | 0 | success | 663 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 687 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 625 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 651 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 662 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 617 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `bufferization_deallocation` | 0 | success | 666 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `shape_reify_resolve` | 0 | success | 626 ms |
| `seeds\real_official_main23\dialect_linalg_loops_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 633 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `parse_verify` | 0 | success | 678 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 666 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `memref_alias_metadata` | 0 | success | 647 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 731 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 659 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 640 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 624 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 629 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 629 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `shape_reify_resolve` | 0 | success | 639 ms |
| `seeds\real_official_main23\dialect_memref_canonicalize_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 636 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `parse_verify` | 0 | success | 590 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 616 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `memref_alias_metadata` | 0 | success | 604 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 610 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 597 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 591 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 607 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 612 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `bufferization_deallocation` | 0 | success | 615 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `shape_reify_resolve` | 0 | success | 624 ms |
| `seeds\real_official_main23\dialect_memref_expand_ops_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 653 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `parse_verify` | 1 | unknown failure | 629 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 622 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 632 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 604 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 659 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 612 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 607 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 632 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 609 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 618 ms |
| `seeds\real_official_main23\dialect_memref_fold_memref_alias_ops_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 672 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `parse_verify` | 1 | unknown failure | 600 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 685 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 633 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 659 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 644 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 640 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 635 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 645 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 643 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 616 ms |
| `seeds\real_official_main23\dialect_scf_canonicalize_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 637 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `parse_verify` | 0 | success | 591 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 681 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `memref_alias_metadata` | 0 | success | 677 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 635 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 720 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 673 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 650 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 759 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 629 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `shape_reify_resolve` | 0 | success | 613 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_canonicalization_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 658 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `parse_verify` | 1 | unknown failure | 656 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 665 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 638 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 607 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 669 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 638 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 662 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 634 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 626 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 624 ms |
| `seeds\real_official_main23\dialect_scf_for_loop_peeling_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 595 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `parse_verify` | 1 | dialect registration | 675 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `canonicalize_convergence_probe` | 1 | dialect registration | 610 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `memref_alias_metadata` | 1 | dialect registration | 632 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `memref_llvm_lowering` | 1 | dialect registration | 596 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `vector_reduction_lowering` | 1 | dialect registration | 603 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `vector_to_scf_llvm` | 1 | dialect registration | 599 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | dialect registration | 559 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `linalg_parallel_gpu` | 1 | dialect registration | 632 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `bufferization_deallocation` | 1 | dialect registration | 613 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `shape_reify_resolve` | 1 | dialect registration | 645 ms |
| `seeds\real_official_main23\dialect_shape_canonicalize_mlir.mlir` | `sparse_lowering_probe` | 1 | dialect registration | 643 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `parse_verify` | 0 | success | 632 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 648 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `memref_alias_metadata` | 0 | success | 637 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 585 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 613 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 641 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 603 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 606 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `bufferization_deallocation` | 0 | success | 618 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `shape_reify_resolve` | 0 | success | 599 ms |
| `seeds\real_official_main23\dialect_shape_fold_div_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 606 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `parse_verify` | 0 | success | 637 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 625 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `memref_alias_metadata` | 0 | success | 617 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 657 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 637 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 601 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 598 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 616 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 604 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `shape_reify_resolve` | 0 | success | 597 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_buffer_initialization_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 605 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `parse_verify` | 0 | success | 594 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 617 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `memref_alias_metadata` | 0 | success | 621 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 644 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 658 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 576 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 627 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 612 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 608 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `shape_reify_resolve` | 0 | success | 622 ms |
| `seeds\real_official_main23\dialect_sparsetensor_codegen_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 630 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `parse_verify` | 1 | unknown failure | 596 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 617 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 665 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 605 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 647 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 635 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 638 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 596 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 597 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 609 ms |
| `seeds\real_official_main23\dialect_tensor_canonicalize_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 614 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `parse_verify` | 0 | success | 624 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 598 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `memref_alias_metadata` | 0 | success | 621 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 624 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 653 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 632 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 607 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 589 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `bufferization_deallocation` | 0 | success | 634 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `shape_reify_resolve` | 0 | success | 641 ms |
| `seeds\real_official_main23\dialect_tensor_decompose_concat_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 614 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `parse_verify` | 1 | unknown failure | 620 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 653 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `memref_alias_metadata` | 1 | unknown failure | 586 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 645 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 612 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 638 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 632 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 598 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 597 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `shape_reify_resolve` | 1 | unknown failure | 588 ms |
| `seeds\real_official_main23\dialect_tensor_fold_into_pack_and_unpack_mlir.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 601 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `parse_verify` | 1 | dialect registration | 595 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `canonicalize_convergence_probe` | 1 | dialect registration | 581 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `memref_alias_metadata` | 1 | dialect registration | 558 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `memref_llvm_lowering` | 1 | dialect registration | 604 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `vector_reduction_lowering` | 1 | dialect registration | 620 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `vector_to_scf_llvm` | 1 | dialect registration | 634 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | dialect registration | 678 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `linalg_parallel_gpu` | 1 | dialect registration | 628 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `bufferization_deallocation` | 1 | dialect registration | 618 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `shape_reify_resolve` | 1 | dialect registration | 665 ms |
| `seeds\real_official_main23\dialect_tensor_fold_tensor_subset_ops_mlir.mlir` | `sparse_lowering_probe` | 1 | dialect registration | 618 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `parse_verify` | 0 | success | 628 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 663 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `memref_alias_metadata` | 0 | success | 605 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 729 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 784 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 683 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 638 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 650 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 633 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `shape_reify_resolve` | 0 | success | 615 ms |
| `seeds\real_official_main23\dialect_tosa_canonicalize_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 606 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `parse_verify` | 0 | success | 635 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 701 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `memref_alias_metadata` | 0 | success | 666 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 749 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 637 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 663 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 694 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 697 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `bufferization_deallocation` | 1 | unknown failure | 619 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `shape_reify_resolve` | 0 | success | 676 ms |
| `seeds\real_official_main23\dialect_tosa_ops_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 663 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `parse_verify` | 1 | dialect registration | 682 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `canonicalize_convergence_probe` | 1 | dialect registration | 666 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `memref_alias_metadata` | 1 | dialect registration | 787 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `memref_llvm_lowering` | 1 | dialect registration | 656 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `vector_reduction_lowering` | 1 | dialect registration | 602 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `vector_to_scf_llvm` | 1 | dialect registration | 589 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | dialect registration | 779 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `linalg_parallel_gpu` | 1 | dialect registration | 622 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `bufferization_deallocation` | 1 | dialect registration | 665 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `shape_reify_resolve` | 1 | dialect registration | 624 ms |
| `seeds\real_official_main23\dialect_vector_canonicalize_mlir.mlir` | `sparse_lowering_probe` | 1 | dialect registration | 651 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `parse_verify` | 1 | parser | 690 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `canonicalize_convergence_probe` | 1 | parser | 693 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `memref_alias_metadata` | 1 | parser | 708 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `memref_llvm_lowering` | 1 | parser | 743 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `vector_reduction_lowering` | 1 | parser | 744 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `vector_to_scf_llvm` | 1 | parser | 731 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `tensor_linalg_loop_lowering` | 1 | parser | 659 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `linalg_parallel_gpu` | 1 | parser | 707 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `bufferization_deallocation` | 1 | parser | 704 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `shape_reify_resolve` | 1 | parser | 721 ms |
| `seeds\real_official_main23\dialect_vector_invalid_mlir.mlir` | `sparse_lowering_probe` | 1 | parser | 786 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `parse_verify` | 0 | success | 669 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `canonicalize_convergence_probe` | 0 | success | 646 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `memref_alias_metadata` | 0 | success | 615 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `memref_llvm_lowering` | 0 | success | 630 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `vector_reduction_lowering` | 0 | success | 664 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `vector_to_scf_llvm` | 0 | success | 674 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 698 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `linalg_parallel_gpu` | 0 | success | 630 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `bufferization_deallocation` | 0 | success | 627 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `shape_reify_resolve` | 0 | success | 622 ms |
| `seeds\real_official_main23\dialect_vector_vector_transfer_full_partial_split_mlir.mlir` | `sparse_lowering_probe` | 0 | success | 621 ms |