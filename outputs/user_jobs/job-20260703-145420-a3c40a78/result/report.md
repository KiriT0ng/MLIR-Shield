# MLIR Differential Report

- Seeds: 1
- Pipelines: 9
- Runs: 9
- Issues: 1

## Issues

### [high] pipeline divergence

- Seed: `seeds\min004_real_e2e.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize | 3221225477 | memory/assertion | false
cse | 0 | success | false
canonicalize_cse | 3221225477 | memory/assertion | false
symbol_dce_canonicalize | 3221225477 | memory/assertion | false
canonicalize_sccp_cse | 3221225477 | memory/assertion | false
canonicalize_cse_sccp_canonicalize | 3221225477 | memory/assertion | false
lower_affine | 0 | success | false
convert_scf_to_cf | 0 | success | false
```

## Summary

### Run categories

### Invariant findings

- none: 0

- memory/assertion: 5
- success: 4

### Issue kinds

- pipeline divergence: 1

### Failure clusters

- `memory/assertion:57dde53318`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:686452065c`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:b3d7a4342c`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:d221229090`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:eb21419775`: 1 runs, 1 seeds, category `memory/assertion`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\min004_real_e2e.mlir` | `parse_verify` | 0 | success | 30 ms |
| `seeds\min004_real_e2e.mlir` | `canonicalize` | 3221225477 | memory/assertion | 83 ms |
| `seeds\min004_real_e2e.mlir` | `cse` | 0 | success | 29 ms |
| `seeds\min004_real_e2e.mlir` | `canonicalize_cse` | 3221225477 | memory/assertion | 74 ms |
| `seeds\min004_real_e2e.mlir` | `symbol_dce_canonicalize` | 3221225477 | memory/assertion | 80 ms |
| `seeds\min004_real_e2e.mlir` | `canonicalize_sccp_cse` | 3221225477 | memory/assertion | 75 ms |
| `seeds\min004_real_e2e.mlir` | `canonicalize_cse_sccp_canonicalize` | 3221225477 | memory/assertion | 76 ms |
| `seeds\min004_real_e2e.mlir` | `lower_affine` | 0 | success | 35 ms |
| `seeds\min004_real_e2e.mlir` | `convert_scf_to_cf` | 0 | success | 28 ms |