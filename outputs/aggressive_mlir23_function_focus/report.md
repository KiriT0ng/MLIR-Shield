# MLIR Differential Report

- Seeds: 240
- Pipelines: 11
- Runs: 2640
- Issues: 47

## Issues

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir`
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

## Summary

### Run categories

### Invariant findings

- [info] `residual dialect after lowering`: `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` / `vector_to_scf_llvm`
  - A lowering pipeline completed but the output still contains high-level dialect(s): vector.
- [info] `residual dialect after lowering`: `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` / `vector_to_scf_llvm`
  - A lowering pipeline completed but the output still contains high-level dialect(s): vector.
- [info] `residual dialect after lowering`: `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` / `vector_to_scf_llvm`
  - A lowering pipeline completed but the output still contains high-level dialect(s): vector.
- [info] `residual dialect after lowering`: `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` / `vector_to_scf_llvm`
  - A lowering pipeline completed but the output still contains high-level dialect(s): vector.
- [info] `residual dialect after lowering`: `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` / `vector_to_scf_llvm`
  - A lowering pipeline completed but the output still contains high-level dialect(s): vector.

- success: 2563
- unknown failure: 77

### Issue kinds

- all pipelines failed: 3
- pipeline divergence: 44

### Failure clusters

- `unknown failure:54d1edada6`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:61d5e8421d`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:7086063fad`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:9e6710932d`: 6 runs, 6 seeds, category `unknown failure`
- `unknown failure:62f7e7f28c`: 2 runs, 2 seeds, category `unknown failure`
- `unknown failure:ac37bf0b34`: 2 runs, 2 seeds, category `unknown failure`
- `unknown failure:058d2e5680`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:12bf4848a5`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:177a09f64e`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:1d81c5d5d9`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:28d09c15c9`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:2e1160b4bd`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:2e7280dd8d`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:3488c3456b`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:425a3bdc6f`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:4b1e822884`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:5b5a3f63d8`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:646ec2304b`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:71d27a310b`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:74b5e80c75`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:820b05ce07`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:96cecb6633`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:9d42033aef`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:a6de77ade7`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:aa254f73d1`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:ae6a2556f6`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:af829c3f39`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:b38d15decf`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:b471f04234`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:c15c910100`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:c15c9e3999`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:c237f1ad2d`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:d5905da3d2`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:dcf45852ef`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:dd99e62b50`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:dea836dbff`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:e8a10ba194`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:ec9d8d595e`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:f286995c6c`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:feaf375ec5`: 1 runs, 1 seeds, category `unknown failure`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `parse_verify` | 0 | success | 655 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `canonicalize_convergence_probe` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `memref_alias_metadata` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `memref_llvm_lowering` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `vector_reduction_lowering` | 0 | success | 721 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `vector_to_scf_llvm` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 743 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `linalg_parallel_gpu` | 0 | success | 778 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `bufferization_deallocation` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `shape_reify_resolve` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `sparse_lowering_probe` | 0 | success | 726 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `parse_verify` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `canonicalize_convergence_probe` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `memref_alias_metadata` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `memref_llvm_lowering` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `vector_reduction_lowering` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `vector_to_scf_llvm` | 0 | success | 723 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 757 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `linalg_parallel_gpu` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `bufferization_deallocation` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `shape_reify_resolve` | 0 | success | 640 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `sparse_lowering_probe` | 0 | success | 648 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `parse_verify` | 0 | success | 754 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `canonicalize_convergence_probe` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `memref_alias_metadata` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `memref_llvm_lowering` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `vector_reduction_lowering` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `vector_to_scf_llvm` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `linalg_parallel_gpu` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `bufferization_deallocation` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `shape_reify_resolve` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `sparse_lowering_probe` | 0 | success | 701 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `parse_verify` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `canonicalize_convergence_probe` | 0 | success | 649 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `memref_alias_metadata` | 0 | success | 651 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `memref_llvm_lowering` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `vector_reduction_lowering` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `vector_to_scf_llvm` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `linalg_parallel_gpu` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `bufferization_deallocation` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `shape_reify_resolve` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `sparse_lowering_probe` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `parse_verify` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `canonicalize_convergence_probe` | 0 | success | 806 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `memref_alias_metadata` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `memref_llvm_lowering` | 0 | success | 806 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `vector_reduction_lowering` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `vector_to_scf_llvm` | 0 | success | 725 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 776 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `linalg_parallel_gpu` | 0 | success | 764 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `bufferization_deallocation` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `shape_reify_resolve` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `sparse_lowering_probe` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `parse_verify` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `canonicalize_convergence_probe` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `memref_alias_metadata` | 0 | success | 800 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `memref_llvm_lowering` | 0 | success | 802 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `vector_reduction_lowering` | 0 | success | 807 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `vector_to_scf_llvm` | 0 | success | 673 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 673 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `linalg_parallel_gpu` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `bufferization_deallocation` | 0 | success | 726 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `shape_reify_resolve` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `sparse_lowering_probe` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `parse_verify` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `canonicalize_convergence_probe` | 0 | success | 756 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `memref_alias_metadata` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `memref_llvm_lowering` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `vector_reduction_lowering` | 0 | success | 779 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `vector_to_scf_llvm` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `linalg_parallel_gpu` | 0 | success | 735 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `bufferization_deallocation` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `shape_reify_resolve` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `sparse_lowering_probe` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `parse_verify` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `canonicalize_convergence_probe` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `memref_alias_metadata` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `memref_llvm_lowering` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `vector_reduction_lowering` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `vector_to_scf_llvm` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `linalg_parallel_gpu` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `bufferization_deallocation` | 0 | success | 673 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `shape_reify_resolve` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `sparse_lowering_probe` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `parse_verify` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `canonicalize_convergence_probe` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `memref_alias_metadata` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `memref_llvm_lowering` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `vector_reduction_lowering` | 0 | success | 771 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `vector_to_scf_llvm` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `linalg_parallel_gpu` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `bufferization_deallocation` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `shape_reify_resolve` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `sparse_lowering_probe` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `parse_verify` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `canonicalize_convergence_probe` | 0 | success | 653 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `memref_alias_metadata` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `memref_llvm_lowering` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `vector_reduction_lowering` | 0 | success | 743 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `vector_to_scf_llvm` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `linalg_parallel_gpu` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `bufferization_deallocation` | 0 | success | 722 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `shape_reify_resolve` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `sparse_lowering_probe` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `parse_verify` | 0 | success | 620 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `canonicalize_convergence_probe` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `memref_alias_metadata` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `memref_llvm_lowering` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `vector_reduction_lowering` | 0 | success | 754 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `vector_to_scf_llvm` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 668 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `linalg_parallel_gpu` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `bufferization_deallocation` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `shape_reify_resolve` | 0 | success | 826 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `sparse_lowering_probe` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `parse_verify` | 1 | unknown failure | 658 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `memref_alias_metadata` | 1 | unknown failure | 670 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 657 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 649 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `bufferization_deallocation` | 1 | unknown failure | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `shape_reify_resolve` | 1 | unknown failure | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `parse_verify` | 1 | unknown failure | 864 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `memref_alias_metadata` | 1 | unknown failure | 747 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 780 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `bufferization_deallocation` | 1 | unknown failure | 668 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `shape_reify_resolve` | 1 | unknown failure | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `parse_verify` | 1 | unknown failure | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 807 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `memref_alias_metadata` | 1 | unknown failure | 827 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 738 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 776 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `bufferization_deallocation` | 1 | unknown failure | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `shape_reify_resolve` | 1 | unknown failure | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `parse_verify` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `canonicalize_convergence_probe` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `memref_alias_metadata` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `memref_llvm_lowering` | 0 | success | 657 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `vector_reduction_lowering` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `vector_to_scf_llvm` | 0 | success | 776 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `linalg_parallel_gpu` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `bufferization_deallocation` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `shape_reify_resolve` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `sparse_lowering_probe` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `parse_verify` | 0 | success | 830 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `canonicalize_convergence_probe` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `memref_alias_metadata` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `memref_llvm_lowering` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `vector_reduction_lowering` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `vector_to_scf_llvm` | 0 | success | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `linalg_parallel_gpu` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `bufferization_deallocation` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `shape_reify_resolve` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `sparse_lowering_probe` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `parse_verify` | 0 | success | 795 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `canonicalize_convergence_probe` | 0 | success | 670 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `memref_alias_metadata` | 0 | success | 766 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `memref_llvm_lowering` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `vector_reduction_lowering` | 0 | success | 776 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `vector_to_scf_llvm` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `linalg_parallel_gpu` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `bufferization_deallocation` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `shape_reify_resolve` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `sparse_lowering_probe` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `parse_verify` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `canonicalize_convergence_probe` | 0 | success | 634 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `memref_alias_metadata` | 0 | success | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `memref_llvm_lowering` | 0 | success | 657 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `vector_reduction_lowering` | 0 | success | 662 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `vector_to_scf_llvm` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `linalg_parallel_gpu` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `bufferization_deallocation` | 0 | success | 747 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `shape_reify_resolve` | 0 | success | 721 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `sparse_lowering_probe` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `parse_verify` | 0 | success | 654 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `canonicalize_convergence_probe` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `memref_alias_metadata` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `memref_llvm_lowering` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `vector_reduction_lowering` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `vector_to_scf_llvm` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `linalg_parallel_gpu` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `bufferization_deallocation` | 0 | success | 636 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `shape_reify_resolve` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `sparse_lowering_probe` | 0 | success | 642 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `parse_verify` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `canonicalize_convergence_probe` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `memref_alias_metadata` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `memref_llvm_lowering` | 0 | success | 670 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `vector_reduction_lowering` | 0 | success | 652 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `vector_to_scf_llvm` | 0 | success | 790 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 658 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `linalg_parallel_gpu` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `bufferization_deallocation` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `shape_reify_resolve` | 0 | success | 651 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `sparse_lowering_probe` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `parse_verify` | 0 | success | 795 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `canonicalize_convergence_probe` | 0 | success | 721 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `memref_alias_metadata` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `memref_llvm_lowering` | 0 | success | 663 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `vector_reduction_lowering` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `vector_to_scf_llvm` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `linalg_parallel_gpu` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `bufferization_deallocation` | 0 | success | 650 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `shape_reify_resolve` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `sparse_lowering_probe` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `parse_verify` | 0 | success | 649 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `canonicalize_convergence_probe` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `memref_alias_metadata` | 0 | success | 653 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `memref_llvm_lowering` | 0 | success | 768 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `vector_reduction_lowering` | 0 | success | 754 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `vector_to_scf_llvm` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `linalg_parallel_gpu` | 0 | success | 806 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `bufferization_deallocation` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `shape_reify_resolve` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `sparse_lowering_probe` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `parse_verify` | 0 | success | 821 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `canonicalize_convergence_probe` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `memref_alias_metadata` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `memref_llvm_lowering` | 0 | success | 638 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `vector_reduction_lowering` | 0 | success | 788 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `vector_to_scf_llvm` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `linalg_parallel_gpu` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `bufferization_deallocation` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `shape_reify_resolve` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `sparse_lowering_probe` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `parse_verify` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `canonicalize_convergence_probe` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `memref_alias_metadata` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `memref_llvm_lowering` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `vector_reduction_lowering` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `vector_to_scf_llvm` | 0 | success | 627 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 722 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `linalg_parallel_gpu` | 0 | success | 814 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `bufferization_deallocation` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `shape_reify_resolve` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `sparse_lowering_probe` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `parse_verify` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `canonicalize_convergence_probe` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `memref_alias_metadata` | 0 | success | 763 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `memref_llvm_lowering` | 0 | success | 829 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `vector_reduction_lowering` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `vector_to_scf_llvm` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `linalg_parallel_gpu` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `bufferization_deallocation` | 0 | success | 737 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `shape_reify_resolve` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `sparse_lowering_probe` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `parse_verify` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `canonicalize_convergence_probe` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `memref_alias_metadata` | 0 | success | 826 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `memref_llvm_lowering` | 0 | success | 804 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `vector_reduction_lowering` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `vector_to_scf_llvm` | 0 | success | 649 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 831 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `linalg_parallel_gpu` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `bufferization_deallocation` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `shape_reify_resolve` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `sparse_lowering_probe` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `parse_verify` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `canonicalize_convergence_probe` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `memref_alias_metadata` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `memref_llvm_lowering` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `vector_reduction_lowering` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `vector_to_scf_llvm` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `linalg_parallel_gpu` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `bufferization_deallocation` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `shape_reify_resolve` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `sparse_lowering_probe` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `parse_verify` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `canonicalize_convergence_probe` | 0 | success | 647 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `memref_alias_metadata` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `memref_llvm_lowering` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `vector_reduction_lowering` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `vector_to_scf_llvm` | 0 | success | 755 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `linalg_parallel_gpu` | 0 | success | 726 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `bufferization_deallocation` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `shape_reify_resolve` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `sparse_lowering_probe` | 0 | success | 722 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `parse_verify` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `canonicalize_convergence_probe` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `memref_alias_metadata` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `memref_llvm_lowering` | 0 | success | 662 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `vector_reduction_lowering` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `vector_to_scf_llvm` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `linalg_parallel_gpu` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `bufferization_deallocation` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `shape_reify_resolve` | 0 | success | 655 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `sparse_lowering_probe` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `parse_verify` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `canonicalize_convergence_probe` | 0 | success | 646 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `memref_alias_metadata` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `memref_llvm_lowering` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `vector_reduction_lowering` | 0 | success | 642 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `vector_to_scf_llvm` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `linalg_parallel_gpu` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `bufferization_deallocation` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `shape_reify_resolve` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `sparse_lowering_probe` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `parse_verify` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `canonicalize_convergence_probe` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `memref_alias_metadata` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `memref_llvm_lowering` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `vector_reduction_lowering` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `vector_to_scf_llvm` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `linalg_parallel_gpu` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `bufferization_deallocation` | 0 | success | 722 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `shape_reify_resolve` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `sparse_lowering_probe` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `parse_verify` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `canonicalize_convergence_probe` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `memref_alias_metadata` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `memref_llvm_lowering` | 0 | success | 753 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `vector_reduction_lowering` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `vector_to_scf_llvm` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `linalg_parallel_gpu` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `bufferization_deallocation` | 0 | success | 780 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `shape_reify_resolve` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `sparse_lowering_probe` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `parse_verify` | 0 | success | 701 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `canonicalize_convergence_probe` | 0 | success | 719 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `memref_alias_metadata` | 0 | success | 717 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `memref_llvm_lowering` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `vector_reduction_lowering` | 0 | success | 668 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `vector_to_scf_llvm` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `linalg_parallel_gpu` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `bufferization_deallocation` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `shape_reify_resolve` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `sparse_lowering_probe` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `parse_verify` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `canonicalize_convergence_probe` | 0 | success | 810 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `memref_alias_metadata` | 0 | success | 717 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `memref_llvm_lowering` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `vector_reduction_lowering` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `vector_to_scf_llvm` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 811 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `linalg_parallel_gpu` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `bufferization_deallocation` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `shape_reify_resolve` | 0 | success | 652 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `sparse_lowering_probe` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `parse_verify` | 0 | success | 663 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `canonicalize_convergence_probe` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `memref_alias_metadata` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `memref_llvm_lowering` | 0 | success | 648 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `vector_reduction_lowering` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `vector_to_scf_llvm` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 764 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `linalg_parallel_gpu` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `bufferization_deallocation` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `shape_reify_resolve` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `sparse_lowering_probe` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `parse_verify` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `canonicalize_convergence_probe` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `memref_alias_metadata` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `memref_llvm_lowering` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `vector_reduction_lowering` | 0 | success | 618 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `vector_to_scf_llvm` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 721 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `linalg_parallel_gpu` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `bufferization_deallocation` | 0 | success | 668 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `shape_reify_resolve` | 0 | success | 645 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `sparse_lowering_probe` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `parse_verify` | 0 | success | 639 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `canonicalize_convergence_probe` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `memref_alias_metadata` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `memref_llvm_lowering` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `vector_reduction_lowering` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `vector_to_scf_llvm` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 637 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `linalg_parallel_gpu` | 0 | success | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `bufferization_deallocation` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `shape_reify_resolve` | 0 | success | 667 ms |
| `seeds\real_official_main23_functions_focus\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `sparse_lowering_probe` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `parse_verify` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `canonicalize_convergence_probe` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `memref_alias_metadata` | 0 | success | 639 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `memref_llvm_lowering` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `vector_reduction_lowering` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `vector_to_scf_llvm` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `linalg_parallel_gpu` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `bufferization_deallocation` | 1 | unknown failure | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `shape_reify_resolve` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `sparse_lowering_probe` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `parse_verify` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `canonicalize_convergence_probe` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `memref_alias_metadata` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `memref_llvm_lowering` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `vector_reduction_lowering` | 0 | success | 718 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `vector_to_scf_llvm` | 0 | success | 653 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `linalg_parallel_gpu` | 0 | success | 746 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `bufferization_deallocation` | 1 | unknown failure | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `shape_reify_resolve` | 0 | success | 727 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `sparse_lowering_probe` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `parse_verify` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `canonicalize_convergence_probe` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `memref_alias_metadata` | 0 | success | 673 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `memref_llvm_lowering` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `vector_reduction_lowering` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `vector_to_scf_llvm` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 667 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `linalg_parallel_gpu` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `bufferization_deallocation` | 1 | unknown failure | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `shape_reify_resolve` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `sparse_lowering_probe` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `parse_verify` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `canonicalize_convergence_probe` | 0 | success | 654 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `memref_alias_metadata` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `memref_llvm_lowering` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `vector_reduction_lowering` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `vector_to_scf_llvm` | 0 | success | 756 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 721 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `linalg_parallel_gpu` | 0 | success | 775 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `bufferization_deallocation` | 1 | unknown failure | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `shape_reify_resolve` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `sparse_lowering_probe` | 0 | success | 813 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `parse_verify` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `canonicalize_convergence_probe` | 0 | success | 737 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `memref_alias_metadata` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `memref_llvm_lowering` | 0 | success | 719 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `vector_reduction_lowering` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `vector_to_scf_llvm` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `linalg_parallel_gpu` | 0 | success | 791 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `bufferization_deallocation` | 1 | unknown failure | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `shape_reify_resolve` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `sparse_lowering_probe` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `parse_verify` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `canonicalize_convergence_probe` | 0 | success | 726 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `memref_alias_metadata` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `memref_llvm_lowering` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `vector_reduction_lowering` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `vector_to_scf_llvm` | 0 | success | 662 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `linalg_parallel_gpu` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `bufferization_deallocation` | 1 | unknown failure | 840 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `shape_reify_resolve` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `sparse_lowering_probe` | 0 | success | 643 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `parse_verify` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `canonicalize_convergence_probe` | 0 | success | 650 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `memref_alias_metadata` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `memref_llvm_lowering` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `vector_reduction_lowering` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `vector_to_scf_llvm` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `linalg_parallel_gpu` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `bufferization_deallocation` | 1 | unknown failure | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `shape_reify_resolve` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `sparse_lowering_probe` | 0 | success | 762 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `parse_verify` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `canonicalize_convergence_probe` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `memref_alias_metadata` | 0 | success | 649 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `memref_llvm_lowering` | 0 | success | 752 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `vector_reduction_lowering` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `vector_to_scf_llvm` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `linalg_parallel_gpu` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `bufferization_deallocation` | 1 | unknown failure | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `shape_reify_resolve` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `sparse_lowering_probe` | 0 | success | 727 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `parse_verify` | 0 | success | 667 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `canonicalize_convergence_probe` | 0 | success | 727 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `memref_alias_metadata` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `memref_llvm_lowering` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `vector_reduction_lowering` | 0 | success | 654 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `vector_to_scf_llvm` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `linalg_parallel_gpu` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `bufferization_deallocation` | 1 | unknown failure | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `shape_reify_resolve` | 0 | success | 782 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `sparse_lowering_probe` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `parse_verify` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `canonicalize_convergence_probe` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `memref_alias_metadata` | 0 | success | 650 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `memref_llvm_lowering` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `vector_reduction_lowering` | 0 | success | 834 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `vector_to_scf_llvm` | 0 | success | 658 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `linalg_parallel_gpu` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `bufferization_deallocation` | 1 | unknown failure | 670 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `shape_reify_resolve` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `sparse_lowering_probe` | 0 | success | 777 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `parse_verify` | 0 | success | 797 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `canonicalize_convergence_probe` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `memref_alias_metadata` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `memref_llvm_lowering` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `vector_reduction_lowering` | 0 | success | 795 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `vector_to_scf_llvm` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `linalg_parallel_gpu` | 0 | success | 797 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `bufferization_deallocation` | 1 | unknown failure | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `shape_reify_resolve` | 0 | success | 510 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `sparse_lowering_probe` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `parse_verify` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `canonicalize_convergence_probe` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `memref_alias_metadata` | 0 | success | 653 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `memref_llvm_lowering` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `vector_reduction_lowering` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `vector_to_scf_llvm` | 0 | success | 723 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `linalg_parallel_gpu` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `bufferization_deallocation` | 1 | unknown failure | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `shape_reify_resolve` | 0 | success | 818 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `sparse_lowering_probe` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `parse_verify` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `canonicalize_convergence_probe` | 0 | success | 673 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `memref_alias_metadata` | 0 | success | 743 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `memref_llvm_lowering` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `vector_reduction_lowering` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `vector_to_scf_llvm` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `linalg_parallel_gpu` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `bufferization_deallocation` | 1 | unknown failure | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `shape_reify_resolve` | 0 | success | 735 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `sparse_lowering_probe` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `parse_verify` | 0 | success | 668 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `canonicalize_convergence_probe` | 0 | success | 655 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `memref_alias_metadata` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `memref_llvm_lowering` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `vector_reduction_lowering` | 0 | success | 626 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `vector_to_scf_llvm` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `linalg_parallel_gpu` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `bufferization_deallocation` | 1 | unknown failure | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `shape_reify_resolve` | 0 | success | 637 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `sparse_lowering_probe` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `parse_verify` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `canonicalize_convergence_probe` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `memref_alias_metadata` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `memref_llvm_lowering` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `vector_reduction_lowering` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `vector_to_scf_llvm` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 663 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `linalg_parallel_gpu` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `bufferization_deallocation` | 1 | unknown failure | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `shape_reify_resolve` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `sparse_lowering_probe` | 0 | success | 784 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `parse_verify` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `canonicalize_convergence_probe` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `memref_alias_metadata` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `memref_llvm_lowering` | 0 | success | 645 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `vector_reduction_lowering` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `vector_to_scf_llvm` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `linalg_parallel_gpu` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `bufferization_deallocation` | 0 | success | 638 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `shape_reify_resolve` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `sparse_lowering_probe` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `parse_verify` | 0 | success | 725 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `canonicalize_convergence_probe` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `memref_alias_metadata` | 0 | success | 725 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `memref_llvm_lowering` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `vector_reduction_lowering` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `vector_to_scf_llvm` | 0 | success | 701 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 727 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `linalg_parallel_gpu` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `bufferization_deallocation` | 1 | unknown failure | 779 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `shape_reify_resolve` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `sparse_lowering_probe` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `parse_verify` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `canonicalize_convergence_probe` | 0 | success | 725 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `memref_alias_metadata` | 0 | success | 651 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `memref_llvm_lowering` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `vector_reduction_lowering` | 0 | success | 647 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `vector_to_scf_llvm` | 0 | success | 657 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 842 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `linalg_parallel_gpu` | 0 | success | 647 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `bufferization_deallocation` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `shape_reify_resolve` | 0 | success | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `sparse_lowering_probe` | 0 | success | 799 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `parse_verify` | 0 | success | 836 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `canonicalize_convergence_probe` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `memref_alias_metadata` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `memref_llvm_lowering` | 0 | success | 632 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `vector_reduction_lowering` | 0 | success | 645 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `vector_to_scf_llvm` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `linalg_parallel_gpu` | 0 | success | 803 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `bufferization_deallocation` | 1 | unknown failure | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `shape_reify_resolve` | 0 | success | 771 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `sparse_lowering_probe` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `parse_verify` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `canonicalize_convergence_probe` | 0 | success | 754 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `memref_alias_metadata` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `memref_llvm_lowering` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `vector_reduction_lowering` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `vector_to_scf_llvm` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `linalg_parallel_gpu` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `bufferization_deallocation` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `shape_reify_resolve` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `sparse_lowering_probe` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `parse_verify` | 0 | success | 640 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `canonicalize_convergence_probe` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `memref_alias_metadata` | 0 | success | 763 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `memref_llvm_lowering` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `vector_reduction_lowering` | 0 | success | 812 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `vector_to_scf_llvm` | 0 | success | 738 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `linalg_parallel_gpu` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `bufferization_deallocation` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `shape_reify_resolve` | 0 | success | 650 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `sparse_lowering_probe` | 0 | success | 653 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `parse_verify` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `canonicalize_convergence_probe` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `memref_alias_metadata` | 0 | success | 722 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `memref_llvm_lowering` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `vector_reduction_lowering` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `vector_to_scf_llvm` | 0 | success | 743 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `linalg_parallel_gpu` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `bufferization_deallocation` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `shape_reify_resolve` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `sparse_lowering_probe` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `parse_verify` | 0 | success | 804 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `canonicalize_convergence_probe` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `memref_alias_metadata` | 0 | success | 755 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `memref_llvm_lowering` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `vector_reduction_lowering` | 0 | success | 875 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `vector_to_scf_llvm` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 755 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `linalg_parallel_gpu` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `bufferization_deallocation` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `shape_reify_resolve` | 0 | success | 861 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `sparse_lowering_probe` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `parse_verify` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `canonicalize_convergence_probe` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `memref_alias_metadata` | 0 | success | 670 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `memref_llvm_lowering` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `vector_reduction_lowering` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `vector_to_scf_llvm` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 673 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `linalg_parallel_gpu` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `bufferization_deallocation` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `shape_reify_resolve` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_023.mlir` | `sparse_lowering_probe` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `parse_verify` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `canonicalize_convergence_probe` | 0 | success | 726 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `memref_alias_metadata` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `memref_llvm_lowering` | 0 | success | 812 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `vector_reduction_lowering` | 0 | success | 747 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `vector_to_scf_llvm` | 0 | success | 756 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 797 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `linalg_parallel_gpu` | 0 | success | 807 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `bufferization_deallocation` | 1 | unknown failure | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `shape_reify_resolve` | 0 | success | 759 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_024.mlir` | `sparse_lowering_probe` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `parse_verify` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `canonicalize_convergence_probe` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `memref_alias_metadata` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `memref_llvm_lowering` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `vector_reduction_lowering` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `vector_to_scf_llvm` | 0 | success | 806 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 743 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `linalg_parallel_gpu` | 0 | success | 654 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `bufferization_deallocation` | 1 | unknown failure | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `shape_reify_resolve` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_025.mlir` | `sparse_lowering_probe` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `parse_verify` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `canonicalize_convergence_probe` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `memref_alias_metadata` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `memref_llvm_lowering` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `vector_reduction_lowering` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `vector_to_scf_llvm` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `linalg_parallel_gpu` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `bufferization_deallocation` | 1 | unknown failure | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `shape_reify_resolve` | 0 | success | 718 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_026.mlir` | `sparse_lowering_probe` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `parse_verify` | 0 | success | 663 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `canonicalize_convergence_probe` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `memref_alias_metadata` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `memref_llvm_lowering` | 0 | success | 729 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `vector_reduction_lowering` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `vector_to_scf_llvm` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `linalg_parallel_gpu` | 0 | success | 813 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `bufferization_deallocation` | 1 | unknown failure | 784 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `shape_reify_resolve` | 0 | success | 663 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_027.mlir` | `sparse_lowering_probe` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `parse_verify` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `canonicalize_convergence_probe` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `memref_alias_metadata` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `memref_llvm_lowering` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `vector_reduction_lowering` | 0 | success | 719 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `vector_to_scf_llvm` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `linalg_parallel_gpu` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `bufferization_deallocation` | 0 | success | 719 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `shape_reify_resolve` | 0 | success | 811 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_028.mlir` | `sparse_lowering_probe` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `parse_verify` | 0 | success | 747 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `canonicalize_convergence_probe` | 0 | success | 816 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `memref_alias_metadata` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `memref_llvm_lowering` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `vector_reduction_lowering` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `vector_to_scf_llvm` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 727 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `linalg_parallel_gpu` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `bufferization_deallocation` | 0 | success | 771 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `shape_reify_resolve` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_029.mlir` | `sparse_lowering_probe` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `parse_verify` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `canonicalize_convergence_probe` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `memref_alias_metadata` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `memref_llvm_lowering` | 0 | success | 723 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `vector_reduction_lowering` | 0 | success | 539 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `vector_to_scf_llvm` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `linalg_parallel_gpu` | 0 | success | 670 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `bufferization_deallocation` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `shape_reify_resolve` | 0 | success | 824 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_030.mlir` | `sparse_lowering_probe` | 0 | success | 784 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `parse_verify` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `canonicalize_convergence_probe` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `memref_alias_metadata` | 0 | success | 752 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `memref_llvm_lowering` | 0 | success | 752 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `vector_reduction_lowering` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `vector_to_scf_llvm` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `linalg_parallel_gpu` | 0 | success | 753 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `bufferization_deallocation` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `shape_reify_resolve` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_031.mlir` | `sparse_lowering_probe` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `parse_verify` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `canonicalize_convergence_probe` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `memref_alias_metadata` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `memref_llvm_lowering` | 0 | success | 727 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `vector_reduction_lowering` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `vector_to_scf_llvm` | 0 | success | 722 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 727 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `linalg_parallel_gpu` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `bufferization_deallocation` | 0 | success | 757 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `shape_reify_resolve` | 0 | success | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_032.mlir` | `sparse_lowering_probe` | 0 | success | 657 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `parse_verify` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `canonicalize_convergence_probe` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `memref_alias_metadata` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `memref_llvm_lowering` | 0 | success | 650 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `vector_reduction_lowering` | 0 | success | 747 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `vector_to_scf_llvm` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `linalg_parallel_gpu` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `bufferization_deallocation` | 0 | success | 774 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `shape_reify_resolve` | 0 | success | 667 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_033.mlir` | `sparse_lowering_probe` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `parse_verify` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `canonicalize_convergence_probe` | 0 | success | 725 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `memref_alias_metadata` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `memref_llvm_lowering` | 0 | success | 782 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `vector_reduction_lowering` | 0 | success | 800 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `vector_to_scf_llvm` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `linalg_parallel_gpu` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `bufferization_deallocation` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `shape_reify_resolve` | 0 | success | 761 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_034.mlir` | `sparse_lowering_probe` | 0 | success | 663 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `parse_verify` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `canonicalize_convergence_probe` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `memref_alias_metadata` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `memref_llvm_lowering` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `vector_reduction_lowering` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `vector_to_scf_llvm` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `linalg_parallel_gpu` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `bufferization_deallocation` | 0 | success | 812 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `shape_reify_resolve` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_035.mlir` | `sparse_lowering_probe` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `parse_verify` | 0 | success | 774 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `canonicalize_convergence_probe` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `memref_alias_metadata` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `memref_llvm_lowering` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `vector_reduction_lowering` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `vector_to_scf_llvm` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `linalg_parallel_gpu` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `bufferization_deallocation` | 1 | unknown failure | 662 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `shape_reify_resolve` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_036.mlir` | `sparse_lowering_probe` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `parse_verify` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `canonicalize_convergence_probe` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `memref_alias_metadata` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `memref_llvm_lowering` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `vector_reduction_lowering` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `vector_to_scf_llvm` | 0 | success | 729 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 757 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `linalg_parallel_gpu` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `bufferization_deallocation` | 1 | unknown failure | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `shape_reify_resolve` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_037.mlir` | `sparse_lowering_probe` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `parse_verify` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `canonicalize_convergence_probe` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `memref_alias_metadata` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `memref_llvm_lowering` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `vector_reduction_lowering` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `vector_to_scf_llvm` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `linalg_parallel_gpu` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `bufferization_deallocation` | 1 | unknown failure | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `shape_reify_resolve` | 0 | success | 638 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_038.mlir` | `sparse_lowering_probe` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `parse_verify` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `canonicalize_convergence_probe` | 0 | success | 723 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `memref_alias_metadata` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `memref_llvm_lowering` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `vector_reduction_lowering` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `vector_to_scf_llvm` | 0 | success | 651 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `linalg_parallel_gpu` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `bufferization_deallocation` | 1 | unknown failure | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `shape_reify_resolve` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_039.mlir` | `sparse_lowering_probe` | 0 | success | 668 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `parse_verify` | 0 | success | 630 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `canonicalize_convergence_probe` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `memref_alias_metadata` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `memref_llvm_lowering` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `vector_reduction_lowering` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `vector_to_scf_llvm` | 0 | success | 800 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `linalg_parallel_gpu` | 0 | success | 782 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `bufferization_deallocation` | 1 | unknown failure | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `shape_reify_resolve` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_040.mlir` | `sparse_lowering_probe` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `parse_verify` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `canonicalize_convergence_probe` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `memref_alias_metadata` | 0 | success | 813 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `memref_llvm_lowering` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `vector_reduction_lowering` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `vector_to_scf_llvm` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `linalg_parallel_gpu` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `bufferization_deallocation` | 1 | unknown failure | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `shape_reify_resolve` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_041.mlir` | `sparse_lowering_probe` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `parse_verify` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `canonicalize_convergence_probe` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `memref_alias_metadata` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `memref_llvm_lowering` | 0 | success | 652 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `vector_reduction_lowering` | 0 | success | 850 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `vector_to_scf_llvm` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `linalg_parallel_gpu` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `bufferization_deallocation` | 1 | unknown failure | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `shape_reify_resolve` | 0 | success | 654 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_042.mlir` | `sparse_lowering_probe` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `parse_verify` | 0 | success | 738 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `canonicalize_convergence_probe` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `memref_alias_metadata` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `memref_llvm_lowering` | 0 | success | 771 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `vector_reduction_lowering` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `vector_to_scf_llvm` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `linalg_parallel_gpu` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `bufferization_deallocation` | 1 | unknown failure | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `shape_reify_resolve` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_043.mlir` | `sparse_lowering_probe` | 0 | success | 722 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `parse_verify` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `canonicalize_convergence_probe` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `memref_alias_metadata` | 0 | success | 638 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `memref_llvm_lowering` | 0 | success | 604 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `vector_reduction_lowering` | 0 | success | 921 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `vector_to_scf_llvm` | 0 | success | 718 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `linalg_parallel_gpu` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `bufferization_deallocation` | 1 | unknown failure | 831 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `shape_reify_resolve` | 0 | success | 735 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_044.mlir` | `sparse_lowering_probe` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `parse_verify` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `canonicalize_convergence_probe` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `memref_alias_metadata` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `memref_llvm_lowering` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `vector_reduction_lowering` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `vector_to_scf_llvm` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `linalg_parallel_gpu` | 0 | success | 781 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `bufferization_deallocation` | 1 | unknown failure | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `shape_reify_resolve` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_045.mlir` | `sparse_lowering_probe` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `parse_verify` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `canonicalize_convergence_probe` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `memref_alias_metadata` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `memref_llvm_lowering` | 0 | success | 667 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `vector_reduction_lowering` | 0 | success | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `vector_to_scf_llvm` | 0 | success | 791 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `linalg_parallel_gpu` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `bufferization_deallocation` | 1 | unknown failure | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `shape_reify_resolve` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_046.mlir` | `sparse_lowering_probe` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `parse_verify` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `canonicalize_convergence_probe` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `memref_alias_metadata` | 0 | success | 648 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `memref_llvm_lowering` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `vector_reduction_lowering` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `vector_to_scf_llvm` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 642 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `linalg_parallel_gpu` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `bufferization_deallocation` | 1 | unknown failure | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `shape_reify_resolve` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_047.mlir` | `sparse_lowering_probe` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `parse_verify` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `canonicalize_convergence_probe` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `memref_alias_metadata` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `memref_llvm_lowering` | 0 | success | 799 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `vector_reduction_lowering` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `vector_to_scf_llvm` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 719 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `linalg_parallel_gpu` | 0 | success | 668 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `bufferization_deallocation` | 1 | unknown failure | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `shape_reify_resolve` | 0 | success | 824 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_049.mlir` | `sparse_lowering_probe` | 0 | success | 663 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `parse_verify` | 0 | success | 655 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `canonicalize_convergence_probe` | 0 | success | 624 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `memref_alias_metadata` | 0 | success | 670 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `memref_llvm_lowering` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `vector_reduction_lowering` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `vector_to_scf_llvm` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 655 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `linalg_parallel_gpu` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `bufferization_deallocation` | 1 | unknown failure | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `shape_reify_resolve` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_050.mlir` | `sparse_lowering_probe` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `parse_verify` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `canonicalize_convergence_probe` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `memref_alias_metadata` | 0 | success | 673 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `memref_llvm_lowering` | 0 | success | 783 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `vector_reduction_lowering` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `vector_to_scf_llvm` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `linalg_parallel_gpu` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `bufferization_deallocation` | 1 | unknown failure | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `shape_reify_resolve` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_051.mlir` | `sparse_lowering_probe` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `parse_verify` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `canonicalize_convergence_probe` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `memref_alias_metadata` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `memref_llvm_lowering` | 0 | success | 657 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `vector_reduction_lowering` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `vector_to_scf_llvm` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `linalg_parallel_gpu` | 0 | success | 663 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `bufferization_deallocation` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `shape_reify_resolve` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_052.mlir` | `sparse_lowering_probe` | 0 | success | 767 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `parse_verify` | 0 | success | 639 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `canonicalize_convergence_probe` | 0 | success | 645 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `memref_alias_metadata` | 0 | success | 788 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `memref_llvm_lowering` | 0 | success | 770 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `vector_reduction_lowering` | 0 | success | 625 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `vector_to_scf_llvm` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `linalg_parallel_gpu` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `bufferization_deallocation` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `shape_reify_resolve` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_053.mlir` | `sparse_lowering_probe` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `parse_verify` | 0 | success | 643 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `canonicalize_convergence_probe` | 0 | success | 667 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `memref_alias_metadata` | 0 | success | 625 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `memref_llvm_lowering` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `vector_reduction_lowering` | 0 | success | 758 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `vector_to_scf_llvm` | 0 | success | 826 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `linalg_parallel_gpu` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `bufferization_deallocation` | 0 | success | 642 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `shape_reify_resolve` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_054.mlir` | `sparse_lowering_probe` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `parse_verify` | 0 | success | 670 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `canonicalize_convergence_probe` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `memref_alias_metadata` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `memref_llvm_lowering` | 0 | success | 651 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `vector_reduction_lowering` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `vector_to_scf_llvm` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 729 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `linalg_parallel_gpu` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `bufferization_deallocation` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `shape_reify_resolve` | 0 | success | 673 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_055.mlir` | `sparse_lowering_probe` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `parse_verify` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `canonicalize_convergence_probe` | 0 | success | 654 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `memref_alias_metadata` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `memref_llvm_lowering` | 0 | success | 747 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `vector_reduction_lowering` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `vector_to_scf_llvm` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `linalg_parallel_gpu` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `bufferization_deallocation` | 0 | success | 719 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `shape_reify_resolve` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_056.mlir` | `sparse_lowering_probe` | 0 | success | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `parse_verify` | 0 | success | 794 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `canonicalize_convergence_probe` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `memref_alias_metadata` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `memref_llvm_lowering` | 0 | success | 632 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `vector_reduction_lowering` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `vector_to_scf_llvm` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 810 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `linalg_parallel_gpu` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `bufferization_deallocation` | 0 | success | 767 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `shape_reify_resolve` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_057.mlir` | `sparse_lowering_probe` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `parse_verify` | 0 | success | 629 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `canonicalize_convergence_probe` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `memref_alias_metadata` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `memref_llvm_lowering` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `vector_reduction_lowering` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `vector_to_scf_llvm` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 632 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `linalg_parallel_gpu` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `bufferization_deallocation` | 0 | success | 722 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `shape_reify_resolve` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_058.mlir` | `sparse_lowering_probe` | 0 | success | 764 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `parse_verify` | 0 | success | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `canonicalize_convergence_probe` | 0 | success | 727 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `memref_alias_metadata` | 0 | success | 622 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `memref_llvm_lowering` | 0 | success | 658 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `vector_reduction_lowering` | 0 | success | 729 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `vector_to_scf_llvm` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `linalg_parallel_gpu` | 0 | success | 725 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `bufferization_deallocation` | 0 | success | 667 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `shape_reify_resolve` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_059.mlir` | `sparse_lowering_probe` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `parse_verify` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `canonicalize_convergence_probe` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `memref_alias_metadata` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `memref_llvm_lowering` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `vector_reduction_lowering` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `vector_to_scf_llvm` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `linalg_parallel_gpu` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `bufferization_deallocation` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `shape_reify_resolve` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_060.mlir` | `sparse_lowering_probe` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `parse_verify` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `canonicalize_convergence_probe` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `memref_alias_metadata` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `memref_llvm_lowering` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `vector_reduction_lowering` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `vector_to_scf_llvm` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `linalg_parallel_gpu` | 0 | success | 725 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `bufferization_deallocation` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `shape_reify_resolve` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_061.mlir` | `sparse_lowering_probe` | 0 | success | 650 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `parse_verify` | 0 | success | 769 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `canonicalize_convergence_probe` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `memref_alias_metadata` | 0 | success | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `memref_llvm_lowering` | 0 | success | 637 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `vector_reduction_lowering` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `vector_to_scf_llvm` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `linalg_parallel_gpu` | 0 | success | 791 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `bufferization_deallocation` | 0 | success | 831 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `shape_reify_resolve` | 0 | success | 642 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_062.mlir` | `sparse_lowering_probe` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `parse_verify` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `canonicalize_convergence_probe` | 0 | success | 637 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `memref_alias_metadata` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `memref_llvm_lowering` | 0 | success | 800 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `vector_reduction_lowering` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `vector_to_scf_llvm` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `linalg_parallel_gpu` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `bufferization_deallocation` | 0 | success | 804 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `shape_reify_resolve` | 0 | success | 651 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_063.mlir` | `sparse_lowering_probe` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `parse_verify` | 0 | success | 649 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `canonicalize_convergence_probe` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `memref_alias_metadata` | 0 | success | 756 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `memref_llvm_lowering` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `vector_reduction_lowering` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `vector_to_scf_llvm` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `linalg_parallel_gpu` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `bufferization_deallocation` | 0 | success | 657 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `shape_reify_resolve` | 0 | success | 652 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_064.mlir` | `sparse_lowering_probe` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `parse_verify` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `canonicalize_convergence_probe` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `memref_alias_metadata` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `memref_llvm_lowering` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `vector_reduction_lowering` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `vector_to_scf_llvm` | 0 | success | 735 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 756 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `linalg_parallel_gpu` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `bufferization_deallocation` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `shape_reify_resolve` | 0 | success | 799 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_065.mlir` | `sparse_lowering_probe` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `parse_verify` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `canonicalize_convergence_probe` | 0 | success | 768 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `memref_alias_metadata` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `memref_llvm_lowering` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `vector_reduction_lowering` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `vector_to_scf_llvm` | 0 | success | 646 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `linalg_parallel_gpu` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `bufferization_deallocation` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `shape_reify_resolve` | 0 | success | 662 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_066.mlir` | `sparse_lowering_probe` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `parse_verify` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `canonicalize_convergence_probe` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `memref_alias_metadata` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `memref_llvm_lowering` | 0 | success | 753 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `vector_reduction_lowering` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `vector_to_scf_llvm` | 0 | success | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `linalg_parallel_gpu` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `bufferization_deallocation` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `shape_reify_resolve` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_067.mlir` | `sparse_lowering_probe` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `parse_verify` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `canonicalize_convergence_probe` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `memref_alias_metadata` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `memref_llvm_lowering` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `vector_reduction_lowering` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `vector_to_scf_llvm` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `linalg_parallel_gpu` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `bufferization_deallocation` | 1 | unknown failure | 784 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `shape_reify_resolve` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_068.mlir` | `sparse_lowering_probe` | 0 | success | 638 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `parse_verify` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `canonicalize_convergence_probe` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `memref_alias_metadata` | 0 | success | 649 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `memref_llvm_lowering` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `vector_reduction_lowering` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `vector_to_scf_llvm` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `linalg_parallel_gpu` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `bufferization_deallocation` | 1 | unknown failure | 650 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `shape_reify_resolve` | 0 | success | 658 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_069.mlir` | `sparse_lowering_probe` | 0 | success | 721 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `parse_verify` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `canonicalize_convergence_probe` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `memref_alias_metadata` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `memref_llvm_lowering` | 0 | success | 768 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `vector_reduction_lowering` | 0 | success | 757 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `vector_to_scf_llvm` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `linalg_parallel_gpu` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `bufferization_deallocation` | 1 | unknown failure | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `shape_reify_resolve` | 0 | success | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_070.mlir` | `sparse_lowering_probe` | 0 | success | 794 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `parse_verify` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `canonicalize_convergence_probe` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `memref_alias_metadata` | 0 | success | 754 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `memref_llvm_lowering` | 0 | success | 631 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `vector_reduction_lowering` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `vector_to_scf_llvm` | 0 | success | 758 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `linalg_parallel_gpu` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `bufferization_deallocation` | 1 | unknown failure | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `shape_reify_resolve` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_071.mlir` | `sparse_lowering_probe` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `parse_verify` | 0 | success | 644 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `canonicalize_convergence_probe` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `memref_alias_metadata` | 0 | success | 638 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `memref_llvm_lowering` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `vector_reduction_lowering` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `vector_to_scf_llvm` | 0 | success | 764 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 719 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `linalg_parallel_gpu` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `bufferization_deallocation` | 1 | unknown failure | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `shape_reify_resolve` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_072.mlir` | `sparse_lowering_probe` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `parse_verify` | 0 | success | 761 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `canonicalize_convergence_probe` | 0 | success | 813 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `memref_alias_metadata` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `memref_llvm_lowering` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `vector_reduction_lowering` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `vector_to_scf_llvm` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 718 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `linalg_parallel_gpu` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `bufferization_deallocation` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `shape_reify_resolve` | 0 | success | 634 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_073.mlir` | `sparse_lowering_probe` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `parse_verify` | 0 | success | 790 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `canonicalize_convergence_probe` | 0 | success | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `memref_alias_metadata` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `memref_llvm_lowering` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `vector_reduction_lowering` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `vector_to_scf_llvm` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 629 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `linalg_parallel_gpu` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `bufferization_deallocation` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `shape_reify_resolve` | 0 | success | 738 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_074.mlir` | `sparse_lowering_probe` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `parse_verify` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `canonicalize_convergence_probe` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `memref_alias_metadata` | 0 | success | 812 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `memref_llvm_lowering` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `vector_reduction_lowering` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `vector_to_scf_llvm` | 0 | success | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `linalg_parallel_gpu` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `bufferization_deallocation` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `shape_reify_resolve` | 0 | success | 802 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_075.mlir` | `sparse_lowering_probe` | 0 | success | 701 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `parse_verify` | 0 | success | 760 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `canonicalize_convergence_probe` | 0 | success | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `memref_alias_metadata` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `memref_llvm_lowering` | 0 | success | 726 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `vector_reduction_lowering` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `vector_to_scf_llvm` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 643 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `linalg_parallel_gpu` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `bufferization_deallocation` | 0 | success | 721 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `shape_reify_resolve` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_076.mlir` | `sparse_lowering_probe` | 0 | success | 794 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `parse_verify` | 0 | success | 797 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `canonicalize_convergence_probe` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `memref_alias_metadata` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `memref_llvm_lowering` | 0 | success | 750 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `vector_reduction_lowering` | 0 | success | 658 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `vector_to_scf_llvm` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 753 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `linalg_parallel_gpu` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `bufferization_deallocation` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `shape_reify_resolve` | 0 | success | 795 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_077.mlir` | `sparse_lowering_probe` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `parse_verify` | 0 | success | 787 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `canonicalize_convergence_probe` | 0 | success | 662 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `memref_alias_metadata` | 0 | success | 655 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `memref_llvm_lowering` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `vector_reduction_lowering` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `vector_to_scf_llvm` | 0 | success | 615 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 737 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `linalg_parallel_gpu` | 0 | success | 646 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `bufferization_deallocation` | 0 | success | 723 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `shape_reify_resolve` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_078.mlir` | `sparse_lowering_probe` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `parse_verify` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `canonicalize_convergence_probe` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `memref_alias_metadata` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `memref_llvm_lowering` | 0 | success | 798 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `vector_reduction_lowering` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `vector_to_scf_llvm` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `linalg_parallel_gpu` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `bufferization_deallocation` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `shape_reify_resolve` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_079.mlir` | `sparse_lowering_probe` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `parse_verify` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `canonicalize_convergence_probe` | 0 | success | 833 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `memref_alias_metadata` | 0 | success | 788 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `memref_llvm_lowering` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `vector_reduction_lowering` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `vector_to_scf_llvm` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `linalg_parallel_gpu` | 0 | success | 571 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `bufferization_deallocation` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `shape_reify_resolve` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_080.mlir` | `sparse_lowering_probe` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `parse_verify` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `canonicalize_convergence_probe` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `memref_alias_metadata` | 0 | success | 747 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `memref_llvm_lowering` | 0 | success | 645 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `vector_reduction_lowering` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `vector_to_scf_llvm` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `linalg_parallel_gpu` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `bufferization_deallocation` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `shape_reify_resolve` | 0 | success | 791 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_081.mlir` | `sparse_lowering_probe` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `parse_verify` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `canonicalize_convergence_probe` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `memref_alias_metadata` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `memref_llvm_lowering` | 0 | success | 829 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `vector_reduction_lowering` | 0 | success | 831 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `vector_to_scf_llvm` | 0 | success | 763 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `linalg_parallel_gpu` | 0 | success | 662 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `bufferization_deallocation` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `shape_reify_resolve` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_082.mlir` | `sparse_lowering_probe` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `parse_verify` | 0 | success | 746 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `canonicalize_convergence_probe` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `memref_alias_metadata` | 0 | success | 818 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `memref_llvm_lowering` | 0 | success | 900 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `vector_reduction_lowering` | 0 | success | 764 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `vector_to_scf_llvm` | 0 | success | 779 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `linalg_parallel_gpu` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `bufferization_deallocation` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `shape_reify_resolve` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_083.mlir` | `sparse_lowering_probe` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `parse_verify` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `canonicalize_convergence_probe` | 0 | success | 729 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `memref_alias_metadata` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `memref_llvm_lowering` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `vector_reduction_lowering` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `vector_to_scf_llvm` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 767 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `linalg_parallel_gpu` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `bufferization_deallocation` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `shape_reify_resolve` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_084.mlir` | `sparse_lowering_probe` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `parse_verify` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `canonicalize_convergence_probe` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `memref_alias_metadata` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `memref_llvm_lowering` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `vector_reduction_lowering` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `vector_to_scf_llvm` | 0 | success | 762 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `linalg_parallel_gpu` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `bufferization_deallocation` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `shape_reify_resolve` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_085.mlir` | `sparse_lowering_probe` | 0 | success | 632 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `parse_verify` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `canonicalize_convergence_probe` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `memref_alias_metadata` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `memref_llvm_lowering` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `vector_reduction_lowering` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `vector_to_scf_llvm` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 640 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `linalg_parallel_gpu` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `bufferization_deallocation` | 0 | success | 701 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `shape_reify_resolve` | 0 | success | 641 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_086.mlir` | `sparse_lowering_probe` | 0 | success | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `parse_verify` | 0 | success | 875 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `canonicalize_convergence_probe` | 0 | success | 784 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `memref_alias_metadata` | 0 | success | 687 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `memref_llvm_lowering` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `vector_reduction_lowering` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `vector_to_scf_llvm` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 738 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `linalg_parallel_gpu` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `bufferization_deallocation` | 0 | success | 757 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `shape_reify_resolve` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_087.mlir` | `sparse_lowering_probe` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `parse_verify` | 0 | success | 762 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `canonicalize_convergence_probe` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `memref_alias_metadata` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `memref_llvm_lowering` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `vector_reduction_lowering` | 0 | success | 754 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `vector_to_scf_llvm` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `linalg_parallel_gpu` | 0 | success | 528 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `bufferization_deallocation` | 0 | success | 735 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `shape_reify_resolve` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_088.mlir` | `sparse_lowering_probe` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `parse_verify` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `canonicalize_convergence_probe` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `memref_alias_metadata` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `memref_llvm_lowering` | 0 | success | 799 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `vector_reduction_lowering` | 0 | success | 786 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `vector_to_scf_llvm` | 0 | success | 910 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 889 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `linalg_parallel_gpu` | 0 | success | 912 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `bufferization_deallocation` | 0 | success | 951 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `shape_reify_resolve` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_089.mlir` | `sparse_lowering_probe` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `parse_verify` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `canonicalize_convergence_probe` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `memref_alias_metadata` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `memref_llvm_lowering` | 0 | success | 746 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `vector_reduction_lowering` | 0 | success | 824 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `vector_to_scf_llvm` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `linalg_parallel_gpu` | 0 | success | 903 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `bufferization_deallocation` | 0 | success | 936 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `shape_reify_resolve` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_090.mlir` | `sparse_lowering_probe` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `parse_verify` | 0 | success | 923 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `canonicalize_convergence_probe` | 0 | success | 752 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `memref_alias_metadata` | 0 | success | 812 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `memref_llvm_lowering` | 0 | success | 788 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `vector_reduction_lowering` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `vector_to_scf_llvm` | 0 | success | 912 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `linalg_parallel_gpu` | 0 | success | 830 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `bufferization_deallocation` | 1 | unknown failure | 922 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `shape_reify_resolve` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_091.mlir` | `sparse_lowering_probe` | 0 | success | 959 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `parse_verify` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `canonicalize_convergence_probe` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `memref_alias_metadata` | 0 | success | 833 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `memref_llvm_lowering` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `vector_reduction_lowering` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `vector_to_scf_llvm` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 935 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `linalg_parallel_gpu` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `bufferization_deallocation` | 1 | unknown failure | 772 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `shape_reify_resolve` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_092.mlir` | `sparse_lowering_probe` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `parse_verify` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `canonicalize_convergence_probe` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `memref_alias_metadata` | 0 | success | 892 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `memref_llvm_lowering` | 0 | success | 889 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `vector_reduction_lowering` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `vector_to_scf_llvm` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 913 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `linalg_parallel_gpu` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `bufferization_deallocation` | 1 | unknown failure | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `shape_reify_resolve` | 0 | success | 944 ms |
| `seeds\real_official_main23_functions_focus\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_093.mlir` | `sparse_lowering_probe` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `parse_verify` | 0 | success | 948 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `canonicalize_convergence_probe` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `memref_alias_metadata` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `memref_llvm_lowering` | 0 | success | 886 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `vector_reduction_lowering` | 0 | success | 1057 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `vector_to_scf_llvm` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `linalg_parallel_gpu` | 0 | success | 826 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `bufferization_deallocation` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `shape_reify_resolve` | 0 | success | 788 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_000.mlir` | `sparse_lowering_probe` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `parse_verify` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `canonicalize_convergence_probe` | 0 | success | 816 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `memref_alias_metadata` | 0 | success | 839 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `memref_llvm_lowering` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `vector_reduction_lowering` | 0 | success | 826 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `vector_to_scf_llvm` | 0 | success | 816 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `linalg_parallel_gpu` | 0 | success | 889 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `bufferization_deallocation` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `shape_reify_resolve` | 0 | success | 822 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_001.mlir` | `sparse_lowering_probe` | 0 | success | 929 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `parse_verify` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `canonicalize_convergence_probe` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `memref_alias_metadata` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `memref_llvm_lowering` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `vector_reduction_lowering` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `vector_to_scf_llvm` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 861 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `linalg_parallel_gpu` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `bufferization_deallocation` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `shape_reify_resolve` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_002.mlir` | `sparse_lowering_probe` | 0 | success | 833 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `parse_verify` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `canonicalize_convergence_probe` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `memref_alias_metadata` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `memref_llvm_lowering` | 0 | success | 889 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `vector_reduction_lowering` | 0 | success | 886 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `vector_to_scf_llvm` | 0 | success | 889 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `linalg_parallel_gpu` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `bufferization_deallocation` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `shape_reify_resolve` | 0 | success | 908 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_003.mlir` | `sparse_lowering_probe` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `parse_verify` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `canonicalize_convergence_probe` | 0 | success | 827 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `memref_alias_metadata` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `memref_llvm_lowering` | 0 | success | 827 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `vector_reduction_lowering` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `vector_to_scf_llvm` | 0 | success | 906 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `linalg_parallel_gpu` | 0 | success | 807 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `bufferization_deallocation` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `shape_reify_resolve` | 0 | success | 827 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_004.mlir` | `sparse_lowering_probe` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `parse_verify` | 0 | success | 875 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `canonicalize_convergence_probe` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `memref_alias_metadata` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `memref_llvm_lowering` | 0 | success | 875 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `vector_reduction_lowering` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `vector_to_scf_llvm` | 0 | success | 923 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `linalg_parallel_gpu` | 0 | success | 892 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `bufferization_deallocation` | 0 | success | 804 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `shape_reify_resolve` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_005.mlir` | `sparse_lowering_probe` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `parse_verify` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `canonicalize_convergence_probe` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `memref_alias_metadata` | 0 | success | 766 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `memref_llvm_lowering` | 0 | success | 924 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `vector_reduction_lowering` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `vector_to_scf_llvm` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 1081 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `linalg_parallel_gpu` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `bufferization_deallocation` | 0 | success | 903 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `shape_reify_resolve` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_006.mlir` | `sparse_lowering_probe` | 0 | success | 836 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `parse_verify` | 0 | success | 810 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `canonicalize_convergence_probe` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `memref_alias_metadata` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `memref_llvm_lowering` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `vector_reduction_lowering` | 0 | success | 798 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `vector_to_scf_llvm` | 0 | success | 593 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 897 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `linalg_parallel_gpu` | 0 | success | 890 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `bufferization_deallocation` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `shape_reify_resolve` | 0 | success | 836 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_007.mlir` | `sparse_lowering_probe` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `parse_verify` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `canonicalize_convergence_probe` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `memref_alias_metadata` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `memref_llvm_lowering` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `vector_reduction_lowering` | 0 | success | 912 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `vector_to_scf_llvm` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `linalg_parallel_gpu` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `bufferization_deallocation` | 0 | success | 811 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `shape_reify_resolve` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_008.mlir` | `sparse_lowering_probe` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `parse_verify` | 0 | success | 776 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `canonicalize_convergence_probe` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `memref_alias_metadata` | 0 | success | 784 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `memref_llvm_lowering` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `vector_reduction_lowering` | 0 | success | 850 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `vector_to_scf_llvm` | 0 | success | 776 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 767 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `linalg_parallel_gpu` | 0 | success | 769 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `bufferization_deallocation` | 0 | success | 800 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `shape_reify_resolve` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_009.mlir` | `sparse_lowering_probe` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `parse_verify` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `canonicalize_convergence_probe` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `memref_alias_metadata` | 0 | success | 903 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `memref_llvm_lowering` | 0 | success | 948 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `vector_reduction_lowering` | 0 | success | 773 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `vector_to_scf_llvm` | 0 | success | 771 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `linalg_parallel_gpu` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `bufferization_deallocation` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `shape_reify_resolve` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_010.mlir` | `sparse_lowering_probe` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `parse_verify` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `canonicalize_convergence_probe` | 0 | success | 760 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `memref_alias_metadata` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `memref_llvm_lowering` | 0 | success | 757 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `vector_reduction_lowering` | 0 | success | 649 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `vector_to_scf_llvm` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 850 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `linalg_parallel_gpu` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `bufferization_deallocation` | 0 | success | 884 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `shape_reify_resolve` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_011.mlir` | `sparse_lowering_probe` | 0 | success | 760 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `parse_verify` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `canonicalize_convergence_probe` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `memref_alias_metadata` | 0 | success | 914 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `memref_llvm_lowering` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `vector_reduction_lowering` | 0 | success | 769 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `vector_to_scf_llvm` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 840 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `linalg_parallel_gpu` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `bufferization_deallocation` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `shape_reify_resolve` | 0 | success | 781 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_012.mlir` | `sparse_lowering_probe` | 0 | success | 786 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `parse_verify` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `canonicalize_convergence_probe` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `memref_alias_metadata` | 0 | success | 675 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `memref_llvm_lowering` | 0 | success | 760 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `vector_reduction_lowering` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `vector_to_scf_llvm` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `linalg_parallel_gpu` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `bufferization_deallocation` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `shape_reify_resolve` | 0 | success | 831 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_013.mlir` | `sparse_lowering_probe` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `parse_verify` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `canonicalize_convergence_probe` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `memref_alias_metadata` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `memref_llvm_lowering` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `vector_reduction_lowering` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `vector_to_scf_llvm` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `linalg_parallel_gpu` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `bufferization_deallocation` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `shape_reify_resolve` | 0 | success | 800 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_014.mlir` | `sparse_lowering_probe` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `parse_verify` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `canonicalize_convergence_probe` | 0 | success | 822 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `memref_alias_metadata` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `memref_llvm_lowering` | 0 | success | 911 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `vector_reduction_lowering` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `vector_to_scf_llvm` | 0 | success | 811 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `linalg_parallel_gpu` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `bufferization_deallocation` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `shape_reify_resolve` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_015.mlir` | `sparse_lowering_probe` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `parse_verify` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `canonicalize_convergence_probe` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `memref_alias_metadata` | 0 | success | 806 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `memref_llvm_lowering` | 0 | success | 810 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `vector_reduction_lowering` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `vector_to_scf_llvm` | 0 | success | 767 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `linalg_parallel_gpu` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `bufferization_deallocation` | 0 | success | 903 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `shape_reify_resolve` | 0 | success | 827 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_016.mlir` | `sparse_lowering_probe` | 0 | success | 804 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `parse_verify` | 0 | success | 915 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `canonicalize_convergence_probe` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `memref_alias_metadata` | 0 | success | 800 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `memref_llvm_lowering` | 0 | success | 897 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `vector_reduction_lowering` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `vector_to_scf_llvm` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `linalg_parallel_gpu` | 0 | success | 912 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `bufferization_deallocation` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `shape_reify_resolve` | 0 | success | 752 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_017.mlir` | `sparse_lowering_probe` | 0 | success | 799 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `parse_verify` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `canonicalize_convergence_probe` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `memref_alias_metadata` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `memref_llvm_lowering` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `vector_reduction_lowering` | 0 | success | 831 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `vector_to_scf_llvm` | 0 | success | 948 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `linalg_parallel_gpu` | 0 | success | 920 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `bufferization_deallocation` | 0 | success | 795 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `shape_reify_resolve` | 0 | success | 789 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_018.mlir` | `sparse_lowering_probe` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `parse_verify` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `canonicalize_convergence_probe` | 0 | success | 762 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `memref_alias_metadata` | 0 | success | 912 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `memref_llvm_lowering` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `vector_reduction_lowering` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `vector_to_scf_llvm` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `linalg_parallel_gpu` | 0 | success | 861 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `bufferization_deallocation` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `shape_reify_resolve` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_019.mlir` | `sparse_lowering_probe` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `parse_verify` | 0 | success | 831 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `canonicalize_convergence_probe` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `memref_alias_metadata` | 0 | success | 797 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `memref_llvm_lowering` | 0 | success | 861 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `vector_reduction_lowering` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `vector_to_scf_llvm` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `linalg_parallel_gpu` | 0 | success | 806 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `bufferization_deallocation` | 0 | success | 906 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `shape_reify_resolve` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_020.mlir` | `sparse_lowering_probe` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `parse_verify` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `canonicalize_convergence_probe` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `memref_alias_metadata` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `memref_llvm_lowering` | 0 | success | 884 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `vector_reduction_lowering` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `vector_to_scf_llvm` | 0 | success | 903 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `linalg_parallel_gpu` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `bufferization_deallocation` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `shape_reify_resolve` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_021.mlir` | `sparse_lowering_probe` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `parse_verify` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `canonicalize_convergence_probe` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `memref_alias_metadata` | 0 | success | 925 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `memref_llvm_lowering` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `vector_reduction_lowering` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `vector_to_scf_llvm` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `linalg_parallel_gpu` | 0 | success | 798 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `bufferization_deallocation` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `shape_reify_resolve` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_022.mlir` | `sparse_lowering_probe` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `parse_verify` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `canonicalize_convergence_probe` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `memref_alias_metadata` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `memref_llvm_lowering` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `vector_reduction_lowering` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `vector_to_scf_llvm` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 771 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `linalg_parallel_gpu` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `bufferization_deallocation` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `shape_reify_resolve` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_023.mlir` | `sparse_lowering_probe` | 0 | success | 807 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `parse_verify` | 0 | success | 834 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `canonicalize_convergence_probe` | 0 | success | 811 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `memref_alias_metadata` | 0 | success | 826 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `memref_llvm_lowering` | 0 | success | 829 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `vector_reduction_lowering` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `vector_to_scf_llvm` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 803 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `linalg_parallel_gpu` | 0 | success | 795 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `bufferization_deallocation` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `shape_reify_resolve` | 0 | success | 810 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_024.mlir` | `sparse_lowering_probe` | 0 | success | 831 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `parse_verify` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `canonicalize_convergence_probe` | 0 | success | 840 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `memref_alias_metadata` | 0 | success | 830 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `memref_llvm_lowering` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `vector_reduction_lowering` | 0 | success | 842 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `vector_to_scf_llvm` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `linalg_parallel_gpu` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `bufferization_deallocation` | 0 | success | 842 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `shape_reify_resolve` | 0 | success | 767 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_025.mlir` | `sparse_lowering_probe` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `parse_verify` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `canonicalize_convergence_probe` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `memref_alias_metadata` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `memref_llvm_lowering` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `vector_reduction_lowering` | 0 | success | 789 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `vector_to_scf_llvm` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `linalg_parallel_gpu` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `bufferization_deallocation` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `shape_reify_resolve` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_026.mlir` | `sparse_lowering_probe` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `parse_verify` | 0 | success | 789 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `canonicalize_convergence_probe` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `memref_alias_metadata` | 0 | success | 652 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `memref_llvm_lowering` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `vector_reduction_lowering` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `vector_to_scf_llvm` | 0 | success | 911 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `linalg_parallel_gpu` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `bufferization_deallocation` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `shape_reify_resolve` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_027.mlir` | `sparse_lowering_probe` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `parse_verify` | 0 | success | 810 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `canonicalize_convergence_probe` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `memref_alias_metadata` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `memref_llvm_lowering` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `vector_reduction_lowering` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `vector_to_scf_llvm` | 0 | success | 766 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `linalg_parallel_gpu` | 0 | success | 829 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `bufferization_deallocation` | 0 | success | 824 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `shape_reify_resolve` | 0 | success | 889 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_028.mlir` | `sparse_lowering_probe` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `parse_verify` | 0 | success | 780 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `canonicalize_convergence_probe` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `memref_alias_metadata` | 0 | success | 836 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `memref_llvm_lowering` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `vector_reduction_lowering` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `vector_to_scf_llvm` | 0 | success | 824 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 906 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `linalg_parallel_gpu` | 0 | success | 806 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `bufferization_deallocation` | 0 | success | 834 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `shape_reify_resolve` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_029.mlir` | `sparse_lowering_probe` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `parse_verify` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `canonicalize_convergence_probe` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `memref_alias_metadata` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `memref_llvm_lowering` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `vector_reduction_lowering` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `vector_to_scf_llvm` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `linalg_parallel_gpu` | 0 | success | 803 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `bufferization_deallocation` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `shape_reify_resolve` | 0 | success | 817 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_030.mlir` | `sparse_lowering_probe` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `parse_verify` | 0 | success | 912 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `canonicalize_convergence_probe` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `memref_alias_metadata` | 0 | success | 922 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `memref_llvm_lowering` | 0 | success | 850 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `vector_reduction_lowering` | 0 | success | 913 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `vector_to_scf_llvm` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `linalg_parallel_gpu` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `bufferization_deallocation` | 0 | success | 834 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `shape_reify_resolve` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_031.mlir` | `sparse_lowering_probe` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `parse_verify` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `canonicalize_convergence_probe` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `memref_alias_metadata` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `memref_llvm_lowering` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `vector_reduction_lowering` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `vector_to_scf_llvm` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `linalg_parallel_gpu` | 0 | success | 769 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `bufferization_deallocation` | 0 | success | 933 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `shape_reify_resolve` | 0 | success | 788 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_032.mlir` | `sparse_lowering_probe` | 0 | success | 804 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `parse_verify` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `canonicalize_convergence_probe` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `memref_alias_metadata` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `memref_llvm_lowering` | 0 | success | 779 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `vector_reduction_lowering` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `vector_to_scf_llvm` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `linalg_parallel_gpu` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `bufferization_deallocation` | 0 | success | 960 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `shape_reify_resolve` | 0 | success | 908 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_033.mlir` | `sparse_lowering_probe` | 0 | success | 890 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `parse_verify` | 0 | success | 756 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `canonicalize_convergence_probe` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `memref_alias_metadata` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `memref_llvm_lowering` | 0 | success | 795 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `vector_reduction_lowering` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `vector_to_scf_llvm` | 0 | success | 914 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `linalg_parallel_gpu` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `bufferization_deallocation` | 0 | success | 934 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `shape_reify_resolve` | 0 | success | 827 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_034.mlir` | `sparse_lowering_probe` | 0 | success | 875 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `parse_verify` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `canonicalize_convergence_probe` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `memref_alias_metadata` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `memref_llvm_lowering` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `vector_reduction_lowering` | 0 | success | 784 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `vector_to_scf_llvm` | 0 | success | 906 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `linalg_parallel_gpu` | 0 | success | 900 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `bufferization_deallocation` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `shape_reify_resolve` | 0 | success | 886 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_035.mlir` | `sparse_lowering_probe` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `parse_verify` | 0 | success | 905 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `canonicalize_convergence_probe` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `memref_alias_metadata` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `memref_llvm_lowering` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `vector_reduction_lowering` | 0 | success | 890 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `vector_to_scf_llvm` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `linalg_parallel_gpu` | 0 | success | 900 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `bufferization_deallocation` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `shape_reify_resolve` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_036.mlir` | `sparse_lowering_probe` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `parse_verify` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `canonicalize_convergence_probe` | 0 | success | 786 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `memref_alias_metadata` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `memref_llvm_lowering` | 0 | success | 775 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `vector_reduction_lowering` | 0 | success | 944 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `vector_to_scf_llvm` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 814 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `linalg_parallel_gpu` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `bufferization_deallocation` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `shape_reify_resolve` | 0 | success | 811 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_037.mlir` | `sparse_lowering_probe` | 0 | success | 900 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `parse_verify` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `canonicalize_convergence_probe` | 0 | success | 918 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `memref_alias_metadata` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `memref_llvm_lowering` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `vector_reduction_lowering` | 0 | success | 834 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `vector_to_scf_llvm` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `linalg_parallel_gpu` | 0 | success | 807 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `bufferization_deallocation` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `shape_reify_resolve` | 0 | success | 938 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_038.mlir` | `sparse_lowering_probe` | 0 | success | 922 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `parse_verify` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `canonicalize_convergence_probe` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `memref_alias_metadata` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `memref_llvm_lowering` | 0 | success | 935 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `vector_reduction_lowering` | 0 | success | 875 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `vector_to_scf_llvm` | 0 | success | 875 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `linalg_parallel_gpu` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `bufferization_deallocation` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `shape_reify_resolve` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_039.mlir` | `sparse_lowering_probe` | 0 | success | 918 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `parse_verify` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `canonicalize_convergence_probe` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `memref_alias_metadata` | 0 | success | 818 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `memref_llvm_lowering` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `vector_reduction_lowering` | 0 | success | 861 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `vector_to_scf_llvm` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `linalg_parallel_gpu` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `bufferization_deallocation` | 0 | success | 850 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `shape_reify_resolve` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_040.mlir` | `sparse_lowering_probe` | 0 | success | 913 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `parse_verify` | 0 | success | 947 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `canonicalize_convergence_probe` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `memref_alias_metadata` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `memref_llvm_lowering` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `vector_reduction_lowering` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `vector_to_scf_llvm` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `linalg_parallel_gpu` | 0 | success | 839 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `bufferization_deallocation` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `shape_reify_resolve` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_041.mlir` | `sparse_lowering_probe` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `parse_verify` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `canonicalize_convergence_probe` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `memref_alias_metadata` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `memref_llvm_lowering` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `vector_reduction_lowering` | 0 | success | 840 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `vector_to_scf_llvm` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `linalg_parallel_gpu` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `bufferization_deallocation` | 0 | success | 791 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `shape_reify_resolve` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_042.mlir` | `sparse_lowering_probe` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `parse_verify` | 0 | success | 800 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `canonicalize_convergence_probe` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `memref_alias_metadata` | 0 | success | 811 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `memref_llvm_lowering` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `vector_reduction_lowering` | 0 | success | 833 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `vector_to_scf_llvm` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `linalg_parallel_gpu` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `bufferization_deallocation` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `shape_reify_resolve` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_043.mlir` | `sparse_lowering_probe` | 0 | success | 763 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `parse_verify` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `canonicalize_convergence_probe` | 0 | success | 916 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `memref_alias_metadata` | 0 | success | 786 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `memref_llvm_lowering` | 0 | success | 891 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `vector_reduction_lowering` | 0 | success | 824 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `vector_to_scf_llvm` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 803 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `linalg_parallel_gpu` | 0 | success | 906 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `bufferization_deallocation` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `shape_reify_resolve` | 0 | success | 1122 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_044.mlir` | `sparse_lowering_probe` | 0 | success | 910 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `parse_verify` | 0 | success | 755 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `canonicalize_convergence_probe` | 0 | success | 813 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `memref_alias_metadata` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `memref_llvm_lowering` | 0 | success | 774 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `vector_reduction_lowering` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `vector_to_scf_llvm` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `linalg_parallel_gpu` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `bufferization_deallocation` | 0 | success | 787 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `shape_reify_resolve` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_045.mlir` | `sparse_lowering_probe` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `parse_verify` | 0 | success | 784 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `canonicalize_convergence_probe` | 0 | success | 908 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `memref_alias_metadata` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `memref_llvm_lowering` | 0 | success | 948 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `vector_reduction_lowering` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `vector_to_scf_llvm` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `linalg_parallel_gpu` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `bufferization_deallocation` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `shape_reify_resolve` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_046.mlir` | `sparse_lowering_probe` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `parse_verify` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `canonicalize_convergence_probe` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `memref_alias_metadata` | 0 | success | 756 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `memref_llvm_lowering` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `vector_reduction_lowering` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `vector_to_scf_llvm` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 910 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `linalg_parallel_gpu` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `bufferization_deallocation` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `shape_reify_resolve` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_047.mlir` | `sparse_lowering_probe` | 0 | success | 897 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `parse_verify` | 0 | success | 900 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `canonicalize_convergence_probe` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `memref_alias_metadata` | 0 | success | 604 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `memref_llvm_lowering` | 0 | success | 812 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `vector_reduction_lowering` | 0 | success | 754 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `vector_to_scf_llvm` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 773 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `linalg_parallel_gpu` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `bufferization_deallocation` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `shape_reify_resolve` | 0 | success | 920 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_048.mlir` | `sparse_lowering_probe` | 0 | success | 781 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `parse_verify` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `canonicalize_convergence_probe` | 0 | success | 927 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `memref_alias_metadata` | 0 | success | 922 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `memref_llvm_lowering` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `vector_reduction_lowering` | 0 | success | 626 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `vector_to_scf_llvm` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `linalg_parallel_gpu` | 0 | success | 653 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `bufferization_deallocation` | 0 | success | 782 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `shape_reify_resolve` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_049.mlir` | `sparse_lowering_probe` | 0 | success | 768 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `parse_verify` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `canonicalize_convergence_probe` | 0 | success | 813 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `memref_alias_metadata` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `memref_llvm_lowering` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `vector_reduction_lowering` | 0 | success | 810 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `vector_to_scf_llvm` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 723 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `linalg_parallel_gpu` | 0 | success | 927 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `bufferization_deallocation` | 0 | success | 660 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `shape_reify_resolve` | 0 | success | 911 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_050.mlir` | `sparse_lowering_probe` | 0 | success | 922 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `parse_verify` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `canonicalize_convergence_probe` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `memref_alias_metadata` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `memref_llvm_lowering` | 0 | success | 927 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `vector_reduction_lowering` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `vector_to_scf_llvm` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `linalg_parallel_gpu` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `bufferization_deallocation` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `shape_reify_resolve` | 0 | success | 738 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_051.mlir` | `sparse_lowering_probe` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `parse_verify` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `canonicalize_convergence_probe` | 0 | success | 915 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `memref_alias_metadata` | 0 | success | 775 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `memref_llvm_lowering` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `vector_reduction_lowering` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `vector_to_scf_llvm` | 0 | success | 924 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `linalg_parallel_gpu` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `bufferization_deallocation` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `shape_reify_resolve` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_052.mlir` | `sparse_lowering_probe` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `parse_verify` | 0 | success | 735 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `canonicalize_convergence_probe` | 0 | success | 827 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `memref_alias_metadata` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `memref_llvm_lowering` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `vector_reduction_lowering` | 0 | success | 905 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `vector_to_scf_llvm` | 0 | success | 906 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `linalg_parallel_gpu` | 0 | success | 786 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `bufferization_deallocation` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `shape_reify_resolve` | 0 | success | 861 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_053.mlir` | `sparse_lowering_probe` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `parse_verify` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `canonicalize_convergence_probe` | 0 | success | 926 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `memref_alias_metadata` | 0 | success | 935 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `memref_llvm_lowering` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `vector_reduction_lowering` | 0 | success | 727 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `vector_to_scf_llvm` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `linalg_parallel_gpu` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `bufferization_deallocation` | 0 | success | 693 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `shape_reify_resolve` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_054.mlir` | `sparse_lowering_probe` | 0 | success | 927 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `parse_verify` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `canonicalize_convergence_probe` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `memref_alias_metadata` | 0 | success | 922 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `memref_llvm_lowering` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `vector_reduction_lowering` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `vector_to_scf_llvm` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `linalg_parallel_gpu` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `bufferization_deallocation` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `shape_reify_resolve` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_055.mlir` | `sparse_lowering_probe` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `parse_verify` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `canonicalize_convergence_probe` | 0 | success | 673 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `memref_alias_metadata` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `memref_llvm_lowering` | 0 | success | 754 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `vector_reduction_lowering` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `vector_to_scf_llvm` | 0 | success | 650 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 649 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `linalg_parallel_gpu` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `bufferization_deallocation` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `shape_reify_resolve` | 0 | success | 810 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_056.mlir` | `sparse_lowering_probe` | 0 | success | 886 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `parse_verify` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `canonicalize_convergence_probe` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `memref_alias_metadata` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `memref_llvm_lowering` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `vector_reduction_lowering` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `vector_to_scf_llvm` | 0 | success | 658 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 953 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `linalg_parallel_gpu` | 0 | success | 824 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `bufferization_deallocation` | 0 | success | 737 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `shape_reify_resolve` | 0 | success | 765 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_057.mlir` | `sparse_lowering_probe` | 0 | success | 783 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `parse_verify` | 0 | success | 829 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `canonicalize_convergence_probe` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `memref_alias_metadata` | 0 | success | 827 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `memref_llvm_lowering` | 0 | success | 778 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `vector_reduction_lowering` | 0 | success | 789 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `vector_to_scf_llvm` | 0 | success | 923 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `linalg_parallel_gpu` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `bufferization_deallocation` | 0 | success | 782 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `shape_reify_resolve` | 0 | success | 715 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_058.mlir` | `sparse_lowering_probe` | 0 | success | 875 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `parse_verify` | 0 | success | 928 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `canonicalize_convergence_probe` | 0 | success | 812 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `memref_alias_metadata` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `memref_llvm_lowering` | 0 | success | 738 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `vector_reduction_lowering` | 0 | success | 766 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `vector_to_scf_llvm` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 842 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `linalg_parallel_gpu` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `bufferization_deallocation` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `shape_reify_resolve` | 0 | success | 928 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_059.mlir` | `sparse_lowering_probe` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `parse_verify` | 0 | success | 755 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `canonicalize_convergence_probe` | 0 | success | 759 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `memref_alias_metadata` | 0 | success | 890 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `memref_llvm_lowering` | 0 | success | 842 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `vector_reduction_lowering` | 0 | success | 737 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `vector_to_scf_llvm` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `linalg_parallel_gpu` | 0 | success | 829 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `bufferization_deallocation` | 0 | success | 756 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `shape_reify_resolve` | 0 | success | 928 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_060.mlir` | `sparse_lowering_probe` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `parse_verify` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `canonicalize_convergence_probe` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `memref_alias_metadata` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `memref_llvm_lowering` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `vector_reduction_lowering` | 0 | success | 790 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `vector_to_scf_llvm` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 928 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `linalg_parallel_gpu` | 0 | success | 756 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `bufferization_deallocation` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `shape_reify_resolve` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_061.mlir` | `sparse_lowering_probe` | 0 | success | 861 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `parse_verify` | 0 | success | 916 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `canonicalize_convergence_probe` | 0 | success | 775 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `memref_alias_metadata` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `memref_llvm_lowering` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `vector_reduction_lowering` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `vector_to_scf_llvm` | 0 | success | 773 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `linalg_parallel_gpu` | 0 | success | 753 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `bufferization_deallocation` | 0 | success | 903 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `shape_reify_resolve` | 0 | success | 789 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_062.mlir` | `sparse_lowering_probe` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `parse_verify` | 0 | success | 840 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `canonicalize_convergence_probe` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `memref_alias_metadata` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `memref_llvm_lowering` | 0 | success | 789 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `vector_reduction_lowering` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `vector_to_scf_llvm` | 0 | success | 810 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 760 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `linalg_parallel_gpu` | 0 | success | 803 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `bufferization_deallocation` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `shape_reify_resolve` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_063.mlir` | `sparse_lowering_probe` | 0 | success | 799 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `parse_verify` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `canonicalize_convergence_probe` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `memref_alias_metadata` | 0 | success | 912 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `memref_llvm_lowering` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `vector_reduction_lowering` | 0 | success | 842 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `vector_to_scf_llvm` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 886 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `linalg_parallel_gpu` | 0 | success | 766 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `bufferization_deallocation` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `shape_reify_resolve` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_064.mlir` | `sparse_lowering_probe` | 0 | success | 804 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `parse_verify` | 0 | success | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `canonicalize_convergence_probe` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `memref_alias_metadata` | 0 | success | 762 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `memref_llvm_lowering` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `vector_reduction_lowering` | 0 | success | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `vector_to_scf_llvm` | 0 | success | 769 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 777 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `linalg_parallel_gpu` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `bufferization_deallocation` | 0 | success | 850 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `shape_reify_resolve` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_065.mlir` | `sparse_lowering_probe` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `parse_verify` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `canonicalize_convergence_probe` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `memref_alias_metadata` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `memref_llvm_lowering` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `vector_reduction_lowering` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `vector_to_scf_llvm` | 0 | success | 662 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `linalg_parallel_gpu` | 0 | success | 723 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `bufferization_deallocation` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `shape_reify_resolve` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_066.mlir` | `sparse_lowering_probe` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `parse_verify` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `canonicalize_convergence_probe` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `memref_alias_metadata` | 0 | success | 654 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `memref_llvm_lowering` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `vector_reduction_lowering` | 0 | success | 718 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `vector_to_scf_llvm` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 723 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `linalg_parallel_gpu` | 0 | success | 783 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `bufferization_deallocation` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `shape_reify_resolve` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_067.mlir` | `sparse_lowering_probe` | 0 | success | 729 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `parse_verify` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `canonicalize_convergence_probe` | 0 | success | 645 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `memref_alias_metadata` | 0 | success | 747 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `memref_llvm_lowering` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `vector_reduction_lowering` | 0 | success | 648 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `vector_to_scf_llvm` | 0 | success | 774 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 652 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `linalg_parallel_gpu` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `bufferization_deallocation` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `shape_reify_resolve` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_068.mlir` | `sparse_lowering_probe` | 0 | success | 754 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `parse_verify` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `canonicalize_convergence_probe` | 0 | success | 665 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `memref_alias_metadata` | 0 | success | 827 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `memref_llvm_lowering` | 0 | success | 670 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `vector_reduction_lowering` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `vector_to_scf_llvm` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `linalg_parallel_gpu` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `bufferization_deallocation` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `shape_reify_resolve` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_069.mlir` | `sparse_lowering_probe` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `parse_verify` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `canonicalize_convergence_probe` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `memref_alias_metadata` | 0 | success | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `memref_llvm_lowering` | 0 | success | 654 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `vector_reduction_lowering` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `vector_to_scf_llvm` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 650 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `linalg_parallel_gpu` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `bufferization_deallocation` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `shape_reify_resolve` | 0 | success | 654 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_070.mlir` | `sparse_lowering_probe` | 0 | success | 631 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `parse_verify` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `canonicalize_convergence_probe` | 0 | success | 652 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `memref_alias_metadata` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `memref_llvm_lowering` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `vector_reduction_lowering` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `vector_to_scf_llvm` | 0 | success | 620 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 648 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `linalg_parallel_gpu` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `bufferization_deallocation` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `shape_reify_resolve` | 0 | success | 668 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_071.mlir` | `sparse_lowering_probe` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `parse_verify` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `canonicalize_convergence_probe` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `memref_alias_metadata` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `memref_llvm_lowering` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `vector_reduction_lowering` | 0 | success | 629 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `vector_to_scf_llvm` | 0 | success | 748 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 639 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `linalg_parallel_gpu` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `bufferization_deallocation` | 0 | success | 646 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `shape_reify_resolve` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_072.mlir` | `sparse_lowering_probe` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `parse_verify` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `canonicalize_convergence_probe` | 0 | success | 719 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `memref_alias_metadata` | 0 | success | 833 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `memref_llvm_lowering` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `vector_reduction_lowering` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `vector_to_scf_llvm` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `linalg_parallel_gpu` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `bufferization_deallocation` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `shape_reify_resolve` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_073.mlir` | `sparse_lowering_probe` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `parse_verify` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `canonicalize_convergence_probe` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `memref_alias_metadata` | 0 | success | 697 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `memref_llvm_lowering` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `vector_reduction_lowering` | 0 | success | 652 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `vector_to_scf_llvm` | 0 | success | 657 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 769 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `linalg_parallel_gpu` | 0 | success | 664 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `bufferization_deallocation` | 0 | success | 752 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `shape_reify_resolve` | 0 | success | 970 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_074.mlir` | `sparse_lowering_probe` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `parse_verify` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `canonicalize_convergence_probe` | 0 | success | 704 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `memref_alias_metadata` | 0 | success | 727 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `memref_llvm_lowering` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `vector_reduction_lowering` | 0 | success | 685 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `vector_to_scf_llvm` | 0 | success | 800 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `linalg_parallel_gpu` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `bufferization_deallocation` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `shape_reify_resolve` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_075.mlir` | `sparse_lowering_probe` | 0 | success | 602 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `parse_verify` | 0 | success | 532 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `canonicalize_convergence_probe` | 0 | success | 652 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `memref_alias_metadata` | 0 | success | 747 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `memref_llvm_lowering` | 0 | success | 672 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `vector_reduction_lowering` | 0 | success | 655 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `vector_to_scf_llvm` | 0 | success | 735 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `linalg_parallel_gpu` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `bufferization_deallocation` | 0 | success | 784 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `shape_reify_resolve` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_076.mlir` | `sparse_lowering_probe` | 0 | success | 667 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `parse_verify` | 0 | success | 692 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `canonicalize_convergence_probe` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `memref_alias_metadata` | 0 | success | 638 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `memref_llvm_lowering` | 0 | success | 774 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `vector_reduction_lowering` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `vector_to_scf_llvm` | 0 | success | 763 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `linalg_parallel_gpu` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `bufferization_deallocation` | 0 | success | 633 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `shape_reify_resolve` | 0 | success | 657 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_077.mlir` | `sparse_lowering_probe` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `parse_verify` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `canonicalize_convergence_probe` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `memref_alias_metadata` | 0 | success | 746 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `memref_llvm_lowering` | 0 | success | 649 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `vector_reduction_lowering` | 0 | success | 755 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `vector_to_scf_llvm` | 0 | success | 757 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 755 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `linalg_parallel_gpu` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `bufferization_deallocation` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `shape_reify_resolve` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_078.mlir` | `sparse_lowering_probe` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `parse_verify` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `canonicalize_convergence_probe` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `memref_alias_metadata` | 0 | success | 886 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `memref_llvm_lowering` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `vector_reduction_lowering` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `vector_to_scf_llvm` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `linalg_parallel_gpu` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `bufferization_deallocation` | 0 | success | 936 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `shape_reify_resolve` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_079.mlir` | `sparse_lowering_probe` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `parse_verify` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `canonicalize_convergence_probe` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `memref_alias_metadata` | 0 | success | 707 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `memref_llvm_lowering` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `vector_reduction_lowering` | 0 | success | 760 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `vector_to_scf_llvm` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `linalg_parallel_gpu` | 0 | success | 755 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `bufferization_deallocation` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `shape_reify_resolve` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_080.mlir` | `sparse_lowering_probe` | 0 | success | 752 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `parse_verify` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `canonicalize_convergence_probe` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `memref_alias_metadata` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `memref_llvm_lowering` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `vector_reduction_lowering` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `vector_to_scf_llvm` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `linalg_parallel_gpu` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `bufferization_deallocation` | 0 | success | 738 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `shape_reify_resolve` | 0 | success | 875 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_081.mlir` | `sparse_lowering_probe` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `parse_verify` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `canonicalize_convergence_probe` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `memref_alias_metadata` | 0 | success | 790 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `memref_llvm_lowering` | 0 | success | 836 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `vector_reduction_lowering` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `vector_to_scf_llvm` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `linalg_parallel_gpu` | 0 | success | 710 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `bufferization_deallocation` | 0 | success | 834 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `shape_reify_resolve` | 0 | success | 813 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_082.mlir` | `sparse_lowering_probe` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `parse_verify` | 0 | success | 759 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `canonicalize_convergence_probe` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `memref_alias_metadata` | 0 | success | 757 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `memref_llvm_lowering` | 0 | success | 777 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `vector_reduction_lowering` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `vector_to_scf_llvm` | 0 | success | 989 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `linalg_parallel_gpu` | 0 | success | 905 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `bufferization_deallocation` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `shape_reify_resolve` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_083.mlir` | `sparse_lowering_probe` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `parse_verify` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `canonicalize_convergence_probe` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `memref_alias_metadata` | 0 | success | 794 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `memref_llvm_lowering` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `vector_reduction_lowering` | 0 | success | 889 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `vector_to_scf_llvm` | 0 | success | 917 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 769 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `linalg_parallel_gpu` | 0 | success | 842 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `bufferization_deallocation` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `shape_reify_resolve` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_084.mlir` | `sparse_lowering_probe` | 0 | success | 798 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `parse_verify` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `canonicalize_convergence_probe` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `memref_alias_metadata` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `memref_llvm_lowering` | 0 | success | 831 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `vector_reduction_lowering` | 0 | success | 817 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `vector_to_scf_llvm` | 0 | success | 941 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 917 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `linalg_parallel_gpu` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `bufferization_deallocation` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `shape_reify_resolve` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_085.mlir` | `sparse_lowering_probe` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `parse_verify` | 0 | success | 747 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `canonicalize_convergence_probe` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `memref_alias_metadata` | 0 | success | 906 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `memref_llvm_lowering` | 0 | success | 900 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `vector_reduction_lowering` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `vector_to_scf_llvm` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 903 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `linalg_parallel_gpu` | 0 | success | 765 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `bufferization_deallocation` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `shape_reify_resolve` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_086.mlir` | `sparse_lowering_probe` | 0 | success | 834 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `parse_verify` | 0 | success | 946 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `canonicalize_convergence_probe` | 0 | success | 711 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `memref_alias_metadata` | 0 | success | 698 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `memref_llvm_lowering` | 0 | success | 771 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `vector_reduction_lowering` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `vector_to_scf_llvm` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 731 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `linalg_parallel_gpu` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `bufferization_deallocation` | 0 | success | 830 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `shape_reify_resolve` | 0 | success | 788 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_087.mlir` | `sparse_lowering_probe` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `parse_verify` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `canonicalize_convergence_probe` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `memref_alias_metadata` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `memref_llvm_lowering` | 0 | success | 908 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `vector_reduction_lowering` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `vector_to_scf_llvm` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `linalg_parallel_gpu` | 0 | success | 757 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `bufferization_deallocation` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `shape_reify_resolve` | 0 | success | 770 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_088.mlir` | `sparse_lowering_probe` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `parse_verify` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `canonicalize_convergence_probe` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `memref_alias_metadata` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `memref_llvm_lowering` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `vector_reduction_lowering` | 0 | success | 691 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `vector_to_scf_llvm` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 725 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `linalg_parallel_gpu` | 0 | success | 676 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `bufferization_deallocation` | 0 | success | 657 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `shape_reify_resolve` | 0 | success | 797 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_089.mlir` | `sparse_lowering_probe` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `parse_verify` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `canonicalize_convergence_probe` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `memref_alias_metadata` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `memref_llvm_lowering` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `vector_reduction_lowering` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `vector_to_scf_llvm` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `linalg_parallel_gpu` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `bufferization_deallocation` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `shape_reify_resolve` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_090.mlir` | `sparse_lowering_probe` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `parse_verify` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `canonicalize_convergence_probe` | 0 | success | 695 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `memref_alias_metadata` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `memref_llvm_lowering` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `vector_reduction_lowering` | 0 | success | 708 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `vector_to_scf_llvm` | 0 | success | 788 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 719 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `linalg_parallel_gpu` | 0 | success | 674 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `bufferization_deallocation` | 0 | success | 673 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `shape_reify_resolve` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_091.mlir` | `sparse_lowering_probe` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `parse_verify` | 0 | success | 683 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `canonicalize_convergence_probe` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `memref_alias_metadata` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `memref_llvm_lowering` | 0 | success | 703 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `vector_reduction_lowering` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `vector_to_scf_llvm` | 0 | success | 651 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 813 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `linalg_parallel_gpu` | 0 | success | 668 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `bufferization_deallocation` | 0 | success | 773 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `shape_reify_resolve` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_092.mlir` | `sparse_lowering_probe` | 0 | success | 775 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `parse_verify` | 0 | success | 650 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `canonicalize_convergence_probe` | 0 | success | 622 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `memref_alias_metadata` | 0 | success | 723 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `memref_llvm_lowering` | 0 | success | 705 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `vector_reduction_lowering` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `vector_to_scf_llvm` | 0 | success | 644 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 803 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `linalg_parallel_gpu` | 0 | success | 803 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `bufferization_deallocation` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `shape_reify_resolve` | 0 | success | 652 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_093.mlir` | `sparse_lowering_probe` | 0 | success | 680 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `parse_verify` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `canonicalize_convergence_probe` | 0 | success | 656 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `memref_alias_metadata` | 0 | success | 735 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `memref_llvm_lowering` | 0 | success | 647 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `vector_reduction_lowering` | 0 | success | 784 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `vector_to_scf_llvm` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `linalg_parallel_gpu` | 0 | success | 775 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `bufferization_deallocation` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `shape_reify_resolve` | 0 | success | 721 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_094.mlir` | `sparse_lowering_probe` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `parse_verify` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `canonicalize_convergence_probe` | 0 | success | 752 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `memref_alias_metadata` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `memref_llvm_lowering` | 0 | success | 709 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `vector_reduction_lowering` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `vector_to_scf_llvm` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `linalg_parallel_gpu` | 0 | success | 724 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `bufferization_deallocation` | 0 | success | 821 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `shape_reify_resolve` | 0 | success | 800 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_095.mlir` | `sparse_lowering_probe` | 0 | success | 769 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `parse_verify` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `canonicalize_convergence_probe` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `memref_alias_metadata` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `memref_llvm_lowering` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `vector_reduction_lowering` | 0 | success | 775 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `vector_to_scf_llvm` | 0 | success | 927 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `linalg_parallel_gpu` | 0 | success | 891 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `bufferization_deallocation` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `shape_reify_resolve` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_096.mlir` | `sparse_lowering_probe` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `parse_verify` | 0 | success | 775 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `canonicalize_convergence_probe` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `memref_alias_metadata` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `memref_llvm_lowering` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `vector_reduction_lowering` | 0 | success | 760 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `vector_to_scf_llvm` | 0 | success | 723 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `linalg_parallel_gpu` | 0 | success | 777 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `bufferization_deallocation` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `shape_reify_resolve` | 0 | success | 940 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_097.mlir` | `sparse_lowering_probe` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `parse_verify` | 0 | success | 948 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `canonicalize_convergence_probe` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `memref_alias_metadata` | 0 | success | 917 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `memref_llvm_lowering` | 0 | success | 721 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `vector_reduction_lowering` | 0 | success | 850 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `vector_to_scf_llvm` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 908 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `linalg_parallel_gpu` | 0 | success | 779 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `bufferization_deallocation` | 0 | success | 735 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `shape_reify_resolve` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_098.mlir` | `sparse_lowering_probe` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `parse_verify` | 0 | success | 767 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `canonicalize_convergence_probe` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `memref_alias_metadata` | 0 | success | 915 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `memref_llvm_lowering` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `vector_reduction_lowering` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `vector_to_scf_llvm` | 0 | success | 791 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `linalg_parallel_gpu` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `bufferization_deallocation` | 0 | success | 919 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `shape_reify_resolve` | 0 | success | 927 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_099.mlir` | `sparse_lowering_probe` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `parse_verify` | 0 | success | 917 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `canonicalize_convergence_probe` | 0 | success | 941 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `memref_alias_metadata` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `memref_llvm_lowering` | 0 | success | 774 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `vector_reduction_lowering` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `vector_to_scf_llvm` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 755 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `linalg_parallel_gpu` | 0 | success | 811 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `bufferization_deallocation` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `shape_reify_resolve` | 0 | success | 746 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_100.mlir` | `sparse_lowering_probe` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `parse_verify` | 0 | success | 836 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `canonicalize_convergence_probe` | 0 | success | 920 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `memref_alias_metadata` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `memref_llvm_lowering` | 0 | success | 914 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `vector_reduction_lowering` | 0 | success | 807 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `vector_to_scf_llvm` | 0 | success | 926 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `linalg_parallel_gpu` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `bufferization_deallocation` | 0 | success | 969 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `shape_reify_resolve` | 0 | success | 758 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_101.mlir` | `sparse_lowering_probe` | 0 | success | 912 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `parse_verify` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `canonicalize_convergence_probe` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `memref_alias_metadata` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `memref_llvm_lowering` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `vector_reduction_lowering` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `vector_to_scf_llvm` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 928 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `linalg_parallel_gpu` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `bufferization_deallocation` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `shape_reify_resolve` | 0 | success | 817 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_102.mlir` | `sparse_lowering_probe` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `parse_verify` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `canonicalize_convergence_probe` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `memref_alias_metadata` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `memref_llvm_lowering` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `vector_reduction_lowering` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `vector_to_scf_llvm` | 0 | success | 806 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 889 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `linalg_parallel_gpu` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `bufferization_deallocation` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `shape_reify_resolve` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_103.mlir` | `sparse_lowering_probe` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `parse_verify` | 0 | success | 931 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `canonicalize_convergence_probe` | 0 | success | 829 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `memref_alias_metadata` | 0 | success | 838 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `memref_llvm_lowering` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `vector_reduction_lowering` | 0 | success | 934 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `vector_to_scf_llvm` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `linalg_parallel_gpu` | 0 | success | 670 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `bufferization_deallocation` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `shape_reify_resolve` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_104.mlir` | `sparse_lowering_probe` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `parse_verify` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `canonicalize_convergence_probe` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `memref_alias_metadata` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `memref_llvm_lowering` | 0 | success | 666 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `vector_reduction_lowering` | 0 | success | 829 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `vector_to_scf_llvm` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 678 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `linalg_parallel_gpu` | 0 | success | 663 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `bufferization_deallocation` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `shape_reify_resolve` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_105.mlir` | `sparse_lowering_probe` | 0 | success | 733 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `parse_verify` | 0 | success | 667 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `canonicalize_convergence_probe` | 0 | success | 679 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `memref_alias_metadata` | 0 | success | 677 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `memref_llvm_lowering` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `vector_reduction_lowering` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `vector_to_scf_llvm` | 0 | success | 671 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 753 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `linalg_parallel_gpu` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `bufferization_deallocation` | 0 | success | 827 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `shape_reify_resolve` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_106.mlir` | `sparse_lowering_probe` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `parse_verify` | 0 | success | 789 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `canonicalize_convergence_probe` | 0 | success | 934 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `memref_alias_metadata` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `memref_llvm_lowering` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `vector_reduction_lowering` | 0 | success | 948 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `vector_to_scf_llvm` | 0 | success | 767 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 811 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `linalg_parallel_gpu` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `bufferization_deallocation` | 0 | success | 682 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `shape_reify_resolve` | 0 | success | 764 ms |
| `seeds\real_official_main23_functions_focus\conversion_vectortollvm_vector_to_llvm_mlir__fn_107.mlir` | `sparse_lowering_probe` | 0 | success | 804 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `parse_verify` | 0 | success | 913 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `canonicalize_convergence_probe` | 0 | success | 728 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `memref_alias_metadata` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `memref_llvm_lowering` | 0 | success | 905 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `vector_reduction_lowering` | 0 | success | 918 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `vector_to_scf_llvm` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 701 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `linalg_parallel_gpu` | 0 | success | 925 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `bufferization_deallocation` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `shape_reify_resolve` | 0 | success | 910 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_000.mlir` | `sparse_lowering_probe` | 0 | success | 817 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `parse_verify` | 0 | success | 913 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `canonicalize_convergence_probe` | 0 | success | 873 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `memref_alias_metadata` | 0 | success | 761 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `memref_llvm_lowering` | 0 | success | 706 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `vector_reduction_lowering` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `vector_to_scf_llvm` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `linalg_parallel_gpu` | 0 | success | 890 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `bufferization_deallocation` | 0 | success | 689 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `shape_reify_resolve` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus\dialect_affine_supervectorize_vectorize_1d_mlir__fn_001.mlir` | `sparse_lowering_probe` | 0 | success | 804 ms |