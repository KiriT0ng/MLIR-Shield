# MLIR Differential Report

- Seeds: 1
- Pipelines: 5
- Runs: 5
- Issues: 1

## Issues

### [high] pipeline divergence

- Seed: `seeds\min004_isolation_3.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize | 0 | success | false
cse | 0 | success | false
canonicalize_cse | 3221225477 | memory/assertion | false
symbol_dce_canonicalize | 3221225477 | memory/assertion | false
```

## Summary

### Run categories

### Invariant findings

- none: 0

- memory/assertion: 2
- success: 3

### Issue kinds

- pipeline divergence: 1

### Failure clusters

- `memory/assertion:686452065c`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:b3d7a4342c`: 1 runs, 1 seeds, category `memory/assertion`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\min004_isolation_3.mlir` | `parse_verify` | 0 | success | 35 ms |
| `seeds\min004_isolation_3.mlir` | `canonicalize` | 0 | success | 30 ms |
| `seeds\min004_isolation_3.mlir` | `cse` | 0 | success | 29 ms |
| `seeds\min004_isolation_3.mlir` | `canonicalize_cse` | 3221225477 | memory/assertion | 87 ms |
| `seeds\min004_isolation_3.mlir` | `symbol_dce_canonicalize` | 3221225477 | memory/assertion | 83 ms |