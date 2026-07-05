# MLIR Differential Report

- Seeds: 60
- Pipelines: 11
- Runs: 660
- Issues: 20

## Issues

### [medium] all pipelines failed

- Seed: `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir`
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

- Seed: `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir`
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

- none: 0

- success: 610
- unknown failure: 50

### Issue kinds

- all pipelines failed: 3
- pipeline divergence: 17

### Failure clusters

- `unknown failure:54d1edada6`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:61d5e8421d`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:7086063fad`: 11 runs, 1 seeds, category `unknown failure`
- `unknown failure:058d2e5680`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:28d09c15c9`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:2e7280dd8d`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:4b1e822884`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:646ec2304b`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:71d27a310b`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:820b05ce07`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:af829c3f39`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:b38d15decf`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:b471f04234`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:c237f1ad2d`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:dcf45852ef`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:dd99e62b50`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:dea836dbff`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:e8a10ba194`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:f286995c6c`: 1 runs, 1 seeds, category `unknown failure`
- `unknown failure:feaf375ec5`: 1 runs, 1 seeds, category `unknown failure`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `parse_verify` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `canonicalize_convergence_probe` | 0 | success | 930 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `memref_alias_metadata` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `memref_llvm_lowering` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `vector_reduction_lowering` | 0 | success | 922 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `vector_to_scf_llvm` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 933 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `linalg_parallel_gpu` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `bufferization_deallocation` | 0 | success | 922 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `shape_reify_resolve` | 0 | success | 730 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_000.mlir` | `sparse_lowering_probe` | 0 | success | 930 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `parse_verify` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `canonicalize_convergence_probe` | 0 | success | 771 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `memref_alias_metadata` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `memref_llvm_lowering` | 0 | success | 822 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `vector_reduction_lowering` | 0 | success | 889 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `vector_to_scf_llvm` | 0 | success | 787 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `linalg_parallel_gpu` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `bufferization_deallocation` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `shape_reify_resolve` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_001.mlir` | `sparse_lowering_probe` | 0 | success | 839 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `parse_verify` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `canonicalize_convergence_probe` | 0 | success | 891 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `memref_alias_metadata` | 0 | success | 884 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `memref_llvm_lowering` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `vector_reduction_lowering` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `vector_to_scf_llvm` | 0 | success | 908 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 945 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `linalg_parallel_gpu` | 0 | success | 1094 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `bufferization_deallocation` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `shape_reify_resolve` | 0 | success | 791 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_002.mlir` | `sparse_lowering_probe` | 0 | success | 817 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `parse_verify` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `canonicalize_convergence_probe` | 0 | success | 862 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `memref_alias_metadata` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `memref_llvm_lowering` | 0 | success | 839 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `vector_reduction_lowering` | 0 | success | 836 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `vector_to_scf_llvm` | 0 | success | 791 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `linalg_parallel_gpu` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `bufferization_deallocation` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `shape_reify_resolve` | 0 | success | 911 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_003.mlir` | `sparse_lowering_probe` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `parse_verify` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `canonicalize_convergence_probe` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `memref_alias_metadata` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `memref_llvm_lowering` | 0 | success | 910 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `vector_reduction_lowering` | 0 | success | 891 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `vector_to_scf_llvm` | 0 | success | 905 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 914 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `linalg_parallel_gpu` | 0 | success | 921 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `bufferization_deallocation` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `shape_reify_resolve` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_004.mlir` | `sparse_lowering_probe` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `parse_verify` | 0 | success | 814 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `canonicalize_convergence_probe` | 0 | success | 817 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `memref_alias_metadata` | 0 | success | 821 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `memref_llvm_lowering` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `vector_reduction_lowering` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `vector_to_scf_llvm` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 908 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `linalg_parallel_gpu` | 0 | success | 919 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `bufferization_deallocation` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `shape_reify_resolve` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_005.mlir` | `sparse_lowering_probe` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `parse_verify` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `canonicalize_convergence_probe` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `memref_alias_metadata` | 0 | success | 818 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `memref_llvm_lowering` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `vector_reduction_lowering` | 0 | success | 746 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `vector_to_scf_llvm` | 0 | success | 804 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `linalg_parallel_gpu` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `bufferization_deallocation` | 0 | success | 822 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `shape_reify_resolve` | 0 | success | 702 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_006.mlir` | `sparse_lowering_probe` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `parse_verify` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `canonicalize_convergence_probe` | 0 | success | 806 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `memref_alias_metadata` | 0 | success | 850 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `memref_llvm_lowering` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `vector_reduction_lowering` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `vector_to_scf_llvm` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `linalg_parallel_gpu` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `bufferization_deallocation` | 0 | success | 891 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `shape_reify_resolve` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_007.mlir` | `sparse_lowering_probe` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `parse_verify` | 0 | success | 914 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `canonicalize_convergence_probe` | 0 | success | 925 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `memref_alias_metadata` | 0 | success | 839 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `memref_llvm_lowering` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `vector_reduction_lowering` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `vector_to_scf_llvm` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `linalg_parallel_gpu` | 0 | success | 659 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `bufferization_deallocation` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `shape_reify_resolve` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_008.mlir` | `sparse_lowering_probe` | 0 | success | 669 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `parse_verify` | 0 | success | 789 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `canonicalize_convergence_probe` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `memref_alias_metadata` | 0 | success | 794 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `memref_llvm_lowering` | 0 | success | 887 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `vector_reduction_lowering` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `vector_to_scf_llvm` | 0 | success | 628 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 816 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `linalg_parallel_gpu` | 0 | success | 812 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `bufferization_deallocation` | 0 | success | 915 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `shape_reify_resolve` | 0 | success | 816 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_009.mlir` | `sparse_lowering_probe` | 0 | success | 830 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `parse_verify` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `canonicalize_convergence_probe` | 0 | success | 840 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `memref_alias_metadata` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `memref_llvm_lowering` | 0 | success | 842 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `vector_reduction_lowering` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `vector_to_scf_llvm` | 0 | success | 756 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `linalg_parallel_gpu` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `bufferization_deallocation` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `shape_reify_resolve` | 0 | success | 840 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_010.mlir` | `sparse_lowering_probe` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `parse_verify` | 1 | unknown failure | 769 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 784 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `memref_alias_metadata` | 1 | unknown failure | 829 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 865 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 836 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 896 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 848 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 845 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `bufferization_deallocation` | 1 | unknown failure | 865 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `shape_reify_resolve` | 1 | unknown failure | 887 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_011.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 915 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `parse_verify` | 1 | unknown failure | 819 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 863 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `memref_alias_metadata` | 1 | unknown failure | 635 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 890 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 780 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 898 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 859 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 829 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `bufferization_deallocation` | 1 | unknown failure | 877 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `shape_reify_resolve` | 1 | unknown failure | 850 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_012.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 844 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `parse_verify` | 1 | unknown failure | 866 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `canonicalize_convergence_probe` | 1 | unknown failure | 855 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `memref_alias_metadata` | 1 | unknown failure | 741 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `memref_llvm_lowering` | 1 | unknown failure | 703 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `vector_reduction_lowering` | 1 | unknown failure | 704 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `vector_to_scf_llvm` | 1 | unknown failure | 730 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `tensor_linalg_loop_lowering` | 1 | unknown failure | 905 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `linalg_parallel_gpu` | 1 | unknown failure | 874 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `bufferization_deallocation` | 1 | unknown failure | 723 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `shape_reify_resolve` | 1 | unknown failure | 847 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_013.mlir` | `sparse_lowering_probe` | 1 | unknown failure | 854 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `parse_verify` | 0 | success | 789 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `canonicalize_convergence_probe` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `memref_alias_metadata` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `memref_llvm_lowering` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `vector_reduction_lowering` | 0 | success | 908 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `vector_to_scf_llvm` | 0 | success | 794 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `linalg_parallel_gpu` | 0 | success | 910 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `bufferization_deallocation` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `shape_reify_resolve` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_014.mlir` | `sparse_lowering_probe` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `parse_verify` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `canonicalize_convergence_probe` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `memref_alias_metadata` | 0 | success | 884 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `memref_llvm_lowering` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `vector_reduction_lowering` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `vector_to_scf_llvm` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `linalg_parallel_gpu` | 0 | success | 795 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `bufferization_deallocation` | 0 | success | 783 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `shape_reify_resolve` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_015.mlir` | `sparse_lowering_probe` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `parse_verify` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `canonicalize_convergence_probe` | 0 | success | 712 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `memref_alias_metadata` | 0 | success | 768 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `memref_llvm_lowering` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `vector_reduction_lowering` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `vector_to_scf_llvm` | 0 | success | 935 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `linalg_parallel_gpu` | 0 | success | 721 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `bufferization_deallocation` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `shape_reify_resolve` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_016.mlir` | `sparse_lowering_probe` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `parse_verify` | 0 | success | 920 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `canonicalize_convergence_probe` | 0 | success | 765 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `memref_alias_metadata` | 0 | success | 661 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `memref_llvm_lowering` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `vector_reduction_lowering` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `vector_to_scf_llvm` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 886 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `linalg_parallel_gpu` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `bufferization_deallocation` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `shape_reify_resolve` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_017.mlir` | `sparse_lowering_probe` | 0 | success | 842 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `parse_verify` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `canonicalize_convergence_probe` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `memref_alias_metadata` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `memref_llvm_lowering` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `vector_reduction_lowering` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `vector_to_scf_llvm` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `linalg_parallel_gpu` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `bufferization_deallocation` | 0 | success | 937 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `shape_reify_resolve` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_018.mlir` | `sparse_lowering_probe` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `parse_verify` | 0 | success | 783 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `canonicalize_convergence_probe` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `memref_alias_metadata` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `memref_llvm_lowering` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `vector_reduction_lowering` | 0 | success | 798 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `vector_to_scf_llvm` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `linalg_parallel_gpu` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `bufferization_deallocation` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `shape_reify_resolve` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_019.mlir` | `sparse_lowering_probe` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `parse_verify` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `canonicalize_convergence_probe` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `memref_alias_metadata` | 0 | success | 911 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `memref_llvm_lowering` | 0 | success | 900 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `vector_reduction_lowering` | 0 | success | 762 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `vector_to_scf_llvm` | 0 | success | 892 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 905 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `linalg_parallel_gpu` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `bufferization_deallocation` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `shape_reify_resolve` | 0 | success | 713 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_020.mlir` | `sparse_lowering_probe` | 0 | success | 782 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `parse_verify` | 0 | success | 816 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `canonicalize_convergence_probe` | 0 | success | 884 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `memref_alias_metadata` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `memref_llvm_lowering` | 0 | success | 958 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `vector_reduction_lowering` | 0 | success | 916 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `vector_to_scf_llvm` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 967 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `linalg_parallel_gpu` | 0 | success | 821 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `bufferization_deallocation` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `shape_reify_resolve` | 0 | success | 897 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_021.mlir` | `sparse_lowering_probe` | 0 | success | 812 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `parse_verify` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `canonicalize_convergence_probe` | 0 | success | 714 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `memref_alias_metadata` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `memref_llvm_lowering` | 0 | success | 930 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `vector_reduction_lowering` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `vector_to_scf_llvm` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 895 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `linalg_parallel_gpu` | 0 | success | 856 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `bufferization_deallocation` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `shape_reify_resolve` | 0 | success | 833 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_022.mlir` | `sparse_lowering_probe` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `parse_verify` | 0 | success | 765 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `canonicalize_convergence_probe` | 0 | success | 915 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `memref_alias_metadata` | 0 | success | 742 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `memref_llvm_lowering` | 0 | success | 791 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `vector_reduction_lowering` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `vector_to_scf_llvm` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `linalg_parallel_gpu` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `bufferization_deallocation` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `shape_reify_resolve` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_023.mlir` | `sparse_lowering_probe` | 0 | success | 773 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `parse_verify` | 0 | success | 814 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `canonicalize_convergence_probe` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `memref_alias_metadata` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `memref_llvm_lowering` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `vector_reduction_lowering` | 0 | success | 822 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `vector_to_scf_llvm` | 0 | success | 868 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 787 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `linalg_parallel_gpu` | 0 | success | 744 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `bufferization_deallocation` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `shape_reify_resolve` | 0 | success | 886 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_024.mlir` | `sparse_lowering_probe` | 0 | success | 688 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `parse_verify` | 0 | success | 722 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `canonicalize_convergence_probe` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `memref_alias_metadata` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `memref_llvm_lowering` | 0 | success | 925 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `vector_reduction_lowering` | 0 | success | 920 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `vector_to_scf_llvm` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `linalg_parallel_gpu` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `bufferization_deallocation` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `shape_reify_resolve` | 0 | success | 905 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_025.mlir` | `sparse_lowering_probe` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `parse_verify` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `canonicalize_convergence_probe` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `memref_alias_metadata` | 0 | success | 910 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `memref_llvm_lowering` | 0 | success | 911 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `vector_reduction_lowering` | 0 | success | 848 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `vector_to_scf_llvm` | 0 | success | 775 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `linalg_parallel_gpu` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `bufferization_deallocation` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `shape_reify_resolve` | 0 | success | 840 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_026.mlir` | `sparse_lowering_probe` | 0 | success | 787 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `parse_verify` | 0 | success | 817 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `canonicalize_convergence_probe` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `memref_alias_metadata` | 0 | success | 720 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `memref_llvm_lowering` | 0 | success | 681 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `vector_reduction_lowering` | 0 | success | 827 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `vector_to_scf_llvm` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 777 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `linalg_parallel_gpu` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `bufferization_deallocation` | 0 | success | 812 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `shape_reify_resolve` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_027.mlir` | `sparse_lowering_probe` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `parse_verify` | 0 | success | 790 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `canonicalize_convergence_probe` | 0 | success | 815 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `memref_alias_metadata` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `memref_llvm_lowering` | 0 | success | 819 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `vector_reduction_lowering` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `vector_to_scf_llvm` | 0 | success | 836 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 840 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `linalg_parallel_gpu` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `bufferization_deallocation` | 0 | success | 928 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `shape_reify_resolve` | 0 | success | 694 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_028.mlir` | `sparse_lowering_probe` | 0 | success | 891 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `parse_verify` | 0 | success | 781 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `canonicalize_convergence_probe` | 0 | success | 826 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `memref_alias_metadata` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `memref_llvm_lowering` | 0 | success | 797 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `vector_reduction_lowering` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `vector_to_scf_llvm` | 0 | success | 822 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `linalg_parallel_gpu` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `bufferization_deallocation` | 0 | success | 839 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `shape_reify_resolve` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_029.mlir` | `sparse_lowering_probe` | 0 | success | 830 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `parse_verify` | 0 | success | 906 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `canonicalize_convergence_probe` | 0 | success | 891 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `memref_alias_metadata` | 0 | success | 1151 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `memref_llvm_lowering` | 0 | success | 795 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `vector_reduction_lowering` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `vector_to_scf_llvm` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `linalg_parallel_gpu` | 0 | success | 926 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `bufferization_deallocation` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `shape_reify_resolve` | 0 | success | 807 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_030.mlir` | `sparse_lowering_probe` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `parse_verify` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `canonicalize_convergence_probe` | 0 | success | 750 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `memref_alias_metadata` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `memref_llvm_lowering` | 0 | success | 839 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `vector_reduction_lowering` | 0 | success | 927 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `vector_to_scf_llvm` | 0 | success | 752 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `linalg_parallel_gpu` | 0 | success | 818 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `bufferization_deallocation` | 0 | success | 917 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `shape_reify_resolve` | 0 | success | 653 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_031.mlir` | `sparse_lowering_probe` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `parse_verify` | 0 | success | 690 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `canonicalize_convergence_probe` | 0 | success | 874 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `memref_alias_metadata` | 0 | success | 861 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `memref_llvm_lowering` | 0 | success | 884 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `vector_reduction_lowering` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `vector_to_scf_llvm` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 777 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `linalg_parallel_gpu` | 0 | success | 822 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `bufferization_deallocation` | 0 | success | 821 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `shape_reify_resolve` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_032.mlir` | `sparse_lowering_probe` | 0 | success | 839 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `parse_verify` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `canonicalize_convergence_probe` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `memref_alias_metadata` | 0 | success | 928 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `memref_llvm_lowering` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `vector_reduction_lowering` | 0 | success | 831 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `vector_to_scf_llvm` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `linalg_parallel_gpu` | 0 | success | 824 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `bufferization_deallocation` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `shape_reify_resolve` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_033.mlir` | `sparse_lowering_probe` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `parse_verify` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `canonicalize_convergence_probe` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `memref_alias_metadata` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `memref_llvm_lowering` | 0 | success | 883 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `vector_reduction_lowering` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `vector_to_scf_llvm` | 0 | success | 888 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `linalg_parallel_gpu` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `bufferization_deallocation` | 0 | success | 829 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `shape_reify_resolve` | 0 | success | 759 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_034.mlir` | `sparse_lowering_probe` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `parse_verify` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `canonicalize_convergence_probe` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `memref_alias_metadata` | 0 | success | 830 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `memref_llvm_lowering` | 0 | success | 745 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `vector_reduction_lowering` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `vector_to_scf_llvm` | 0 | success | 753 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `linalg_parallel_gpu` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `bufferization_deallocation` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `shape_reify_resolve` | 0 | success | 1138 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_035.mlir` | `sparse_lowering_probe` | 0 | success | 770 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `parse_verify` | 0 | success | 814 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `canonicalize_convergence_probe` | 0 | success | 824 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `memref_alias_metadata` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `memref_llvm_lowering` | 0 | success | 772 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `vector_reduction_lowering` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `vector_to_scf_llvm` | 0 | success | 734 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 747 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `linalg_parallel_gpu` | 0 | success | 794 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `bufferization_deallocation` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `shape_reify_resolve` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus60\conversion_memreftollvm_memref_to_llvm_mlir__fn_036.mlir` | `sparse_lowering_probe` | 0 | success | 863 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `parse_verify` | 0 | success | 912 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `canonicalize_convergence_probe` | 0 | success | 829 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `memref_alias_metadata` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `memref_llvm_lowering` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `vector_reduction_lowering` | 0 | success | 806 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `vector_to_scf_llvm` | 0 | success | 700 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 921 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `linalg_parallel_gpu` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `bufferization_deallocation` | 1 | unknown failure | 855 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `shape_reify_resolve` | 0 | success | 761 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_000.mlir` | `sparse_lowering_probe` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `parse_verify` | 0 | success | 792 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `canonicalize_convergence_probe` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `memref_alias_metadata` | 0 | success | 911 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `memref_llvm_lowering` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `vector_reduction_lowering` | 0 | success | 913 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `vector_to_scf_llvm` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 945 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `linalg_parallel_gpu` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `bufferization_deallocation` | 1 | unknown failure | 823 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `shape_reify_resolve` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_001.mlir` | `sparse_lowering_probe` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `parse_verify` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `canonicalize_convergence_probe` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `memref_alias_metadata` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `memref_llvm_lowering` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `vector_reduction_lowering` | 0 | success | 910 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `vector_to_scf_llvm` | 0 | success | 736 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `linalg_parallel_gpu` | 0 | success | 884 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `bufferization_deallocation` | 1 | unknown failure | 902 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `shape_reify_resolve` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_002.mlir` | `sparse_lowering_probe` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `parse_verify` | 0 | success | 773 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `canonicalize_convergence_probe` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `memref_alias_metadata` | 0 | success | 754 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `memref_llvm_lowering` | 0 | success | 938 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `vector_reduction_lowering` | 0 | success | 852 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `vector_to_scf_llvm` | 0 | success | 726 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 859 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `linalg_parallel_gpu` | 0 | success | 903 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `bufferization_deallocation` | 1 | unknown failure | 836 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `shape_reify_resolve` | 0 | success | 788 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_003.mlir` | `sparse_lowering_probe` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `parse_verify` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `canonicalize_convergence_probe` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `memref_alias_metadata` | 0 | success | 828 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `memref_llvm_lowering` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `vector_reduction_lowering` | 0 | success | 844 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `vector_to_scf_llvm` | 0 | success | 719 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `linalg_parallel_gpu` | 0 | success | 816 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `bufferization_deallocation` | 1 | unknown failure | 866 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `shape_reify_resolve` | 0 | success | 811 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_004.mlir` | `sparse_lowering_probe` | 0 | success | 886 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `parse_verify` | 0 | success | 897 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `canonicalize_convergence_probe` | 0 | success | 834 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `memref_alias_metadata` | 0 | success | 878 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `memref_llvm_lowering` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `vector_reduction_lowering` | 0 | success | 875 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `vector_to_scf_llvm` | 0 | success | 926 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `linalg_parallel_gpu` | 0 | success | 929 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `bufferization_deallocation` | 1 | unknown failure | 845 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `shape_reify_resolve` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_005.mlir` | `sparse_lowering_probe` | 0 | success | 920 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `parse_verify` | 0 | success | 908 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `canonicalize_convergence_probe` | 0 | success | 836 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `memref_alias_metadata` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `memref_llvm_lowering` | 0 | success | 900 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `vector_reduction_lowering` | 0 | success | 817 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `vector_to_scf_llvm` | 0 | success | 921 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `linalg_parallel_gpu` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `bufferization_deallocation` | 1 | unknown failure | 814 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `shape_reify_resolve` | 0 | success | 821 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_006.mlir` | `sparse_lowering_probe` | 0 | success | 898 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `parse_verify` | 0 | success | 726 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `canonicalize_convergence_probe` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `memref_alias_metadata` | 0 | success | 783 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `memref_llvm_lowering` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `vector_reduction_lowering` | 0 | success | 782 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `vector_to_scf_llvm` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 903 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `linalg_parallel_gpu` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `bufferization_deallocation` | 1 | unknown failure | 854 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `shape_reify_resolve` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_007.mlir` | `sparse_lowering_probe` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `parse_verify` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `canonicalize_convergence_probe` | 0 | success | 897 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `memref_alias_metadata` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `memref_llvm_lowering` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `vector_reduction_lowering` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `vector_to_scf_llvm` | 0 | success | 944 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 915 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `linalg_parallel_gpu` | 0 | success | 816 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `bufferization_deallocation` | 1 | unknown failure | 790 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `shape_reify_resolve` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_008.mlir` | `sparse_lowering_probe` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `parse_verify` | 0 | success | 948 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `canonicalize_convergence_probe` | 0 | success | 923 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `memref_alias_metadata` | 0 | success | 869 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `memref_llvm_lowering` | 0 | success | 1064 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `vector_reduction_lowering` | 0 | success | 798 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `vector_to_scf_llvm` | 0 | success | 809 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `linalg_parallel_gpu` | 0 | success | 833 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `bufferization_deallocation` | 1 | unknown failure | 831 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `shape_reify_resolve` | 0 | success | 835 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_009.mlir` | `sparse_lowering_probe` | 0 | success | 850 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `parse_verify` | 0 | success | 866 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `canonicalize_convergence_probe` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `memref_alias_metadata` | 0 | success | 821 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `memref_llvm_lowering` | 0 | success | 831 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `vector_reduction_lowering` | 0 | success | 826 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `vector_to_scf_llvm` | 0 | success | 782 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `linalg_parallel_gpu` | 0 | success | 824 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `bufferization_deallocation` | 1 | unknown failure | 870 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `shape_reify_resolve` | 0 | success | 853 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_010.mlir` | `sparse_lowering_probe` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `parse_verify` | 0 | success | 798 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `canonicalize_convergence_probe` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `memref_alias_metadata` | 0 | success | 822 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `memref_llvm_lowering` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `vector_reduction_lowering` | 0 | success | 696 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `vector_to_scf_llvm` | 0 | success | 1044 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 816 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `linalg_parallel_gpu` | 0 | success | 913 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `bufferization_deallocation` | 1 | unknown failure | 849 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `shape_reify_resolve` | 0 | success | 833 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_011.mlir` | `sparse_lowering_probe` | 0 | success | 825 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `parse_verify` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `canonicalize_convergence_probe` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `memref_alias_metadata` | 0 | success | 877 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `memref_llvm_lowering` | 0 | success | 803 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `vector_reduction_lowering` | 0 | success | 847 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `vector_to_scf_llvm` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 855 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `linalg_parallel_gpu` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `bufferization_deallocation` | 1 | unknown failure | 903 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `shape_reify_resolve` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_012.mlir` | `sparse_lowering_probe` | 0 | success | 638 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `parse_verify` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `canonicalize_convergence_probe` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `memref_alias_metadata` | 0 | success | 872 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `memref_llvm_lowering` | 0 | success | 899 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `vector_reduction_lowering` | 0 | success | 930 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `vector_to_scf_llvm` | 0 | success | 729 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 858 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `linalg_parallel_gpu` | 0 | success | 726 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `bufferization_deallocation` | 1 | unknown failure | 907 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `shape_reify_resolve` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_013.mlir` | `sparse_lowering_probe` | 0 | success | 805 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `parse_verify` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `canonicalize_convergence_probe` | 0 | success | 741 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `memref_alias_metadata` | 0 | success | 843 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `memref_llvm_lowering` | 0 | success | 778 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `vector_reduction_lowering` | 0 | success | 890 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `vector_to_scf_llvm` | 0 | success | 933 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `linalg_parallel_gpu` | 0 | success | 915 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `bufferization_deallocation` | 1 | unknown failure | 801 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `shape_reify_resolve` | 0 | success | 906 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_014.mlir` | `sparse_lowering_probe` | 0 | success | 864 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `parse_verify` | 0 | success | 790 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `canonicalize_convergence_probe` | 0 | success | 823 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `memref_alias_metadata` | 0 | success | 916 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `memref_llvm_lowering` | 0 | success | 860 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `vector_reduction_lowering` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `vector_to_scf_llvm` | 0 | success | 841 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `linalg_parallel_gpu` | 0 | success | 846 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `bufferization_deallocation` | 0 | success | 882 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `shape_reify_resolve` | 0 | success | 820 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_015.mlir` | `sparse_lowering_probe` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `parse_verify` | 0 | success | 716 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `canonicalize_convergence_probe` | 0 | success | 857 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `memref_alias_metadata` | 0 | success | 821 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `memref_llvm_lowering` | 0 | success | 927 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `vector_reduction_lowering` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `vector_to_scf_llvm` | 0 | success | 773 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 832 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `linalg_parallel_gpu` | 0 | success | 804 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `bufferization_deallocation` | 1 | unknown failure | 856 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `shape_reify_resolve` | 0 | success | 881 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_016.mlir` | `sparse_lowering_probe` | 0 | success | 755 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `parse_verify` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `canonicalize_convergence_probe` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `memref_alias_metadata` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `memref_llvm_lowering` | 0 | success | 732 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `vector_reduction_lowering` | 0 | success | 749 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `vector_to_scf_llvm` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 845 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `linalg_parallel_gpu` | 0 | success | 636 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `bufferization_deallocation` | 0 | success | 793 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `shape_reify_resolve` | 0 | success | 763 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_017.mlir` | `sparse_lowering_probe` | 0 | success | 699 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `parse_verify` | 0 | success | 808 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `canonicalize_convergence_probe` | 0 | success | 751 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `memref_alias_metadata` | 0 | success | 779 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `memref_llvm_lowering` | 0 | success | 684 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `vector_reduction_lowering` | 0 | success | 925 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `vector_to_scf_llvm` | 0 | success | 686 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 909 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `linalg_parallel_gpu` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `bufferization_deallocation` | 1 | unknown failure | 828 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `shape_reify_resolve` | 0 | success | 889 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_018.mlir` | `sparse_lowering_probe` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `parse_verify` | 0 | success | 849 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `canonicalize_convergence_probe` | 0 | success | 854 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `memref_alias_metadata` | 0 | success | 837 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `memref_llvm_lowering` | 0 | success | 777 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `vector_reduction_lowering` | 0 | success | 907 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `vector_to_scf_llvm` | 0 | success | 785 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 890 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `linalg_parallel_gpu` | 0 | success | 851 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `bufferization_deallocation` | 0 | success | 870 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `shape_reify_resolve` | 0 | success | 740 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_019.mlir` | `sparse_lowering_probe` | 0 | success | 879 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `parse_verify` | 0 | success | 903 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `canonicalize_convergence_probe` | 0 | success | 935 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `memref_alias_metadata` | 0 | success | 840 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `memref_llvm_lowering` | 0 | success | 850 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `vector_reduction_lowering` | 0 | success | 871 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `vector_to_scf_llvm` | 0 | success | 757 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 796 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `linalg_parallel_gpu` | 0 | success | 813 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `bufferization_deallocation` | 0 | success | 865 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `shape_reify_resolve` | 0 | success | 876 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_020.mlir` | `sparse_lowering_probe` | 0 | success | 765 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `parse_verify` | 0 | success | 886 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `canonicalize_convergence_probe` | 0 | success | 867 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `memref_alias_metadata` | 0 | success | 761 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `memref_llvm_lowering` | 0 | success | 896 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `vector_reduction_lowering` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `vector_to_scf_llvm` | 0 | success | 739 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 803 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `linalg_parallel_gpu` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `bufferization_deallocation` | 0 | success | 893 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `shape_reify_resolve` | 0 | success | 892 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_021.mlir` | `sparse_lowering_probe` | 0 | success | 885 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `parse_verify` | 0 | success | 801 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `canonicalize_convergence_probe` | 0 | success | 830 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `memref_alias_metadata` | 0 | success | 902 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `memref_llvm_lowering` | 0 | success | 941 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `vector_reduction_lowering` | 0 | success | 935 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `vector_to_scf_llvm` | 0 | success | 904 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `tensor_linalg_loop_lowering` | 0 | success | 894 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `linalg_parallel_gpu` | 0 | success | 901 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `bufferization_deallocation` | 0 | success | 880 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `shape_reify_resolve` | 0 | success | 722 ms |
| `seeds\real_official_main23_functions_focus60\conversion_tosatolinalg_tosa_to_linalg_mlir__fn_022.mlir` | `sparse_lowering_probe` | 0 | success | 1024 ms |