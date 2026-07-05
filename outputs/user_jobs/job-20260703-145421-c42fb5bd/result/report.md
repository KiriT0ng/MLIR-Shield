# MLIR Differential Report

- Seeds: 1
- Pipelines: 5
- Runs: 5
- Issues: 1

## Issues

### [high] pipeline divergence

- Seed: `seeds\min004_isolation_1.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
canonicalize | 3221225477 | memory/assertion | false
cse | 0 | success | false
canonicalize_cse | 3221225477 | memory/assertion | false
symbol_dce_canonicalize | 3221225477 | memory/assertion | false
```

## Summary

### Run categories

### Invariant findings

- none: 0

- memory/assertion: 3
- success: 2

### Issue kinds

- pipeline divergence: 1

### Failure clusters

- `memory/assertion:686452065c`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:b3d7a4342c`: 1 runs, 1 seeds, category `memory/assertion`
- `memory/assertion:eb21419775`: 1 runs, 1 seeds, category `memory/assertion`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\min004_isolation_1.mlir` | `parse_verify` | 0 | success | 30 ms |
| `seeds\min004_isolation_1.mlir` | `canonicalize` | 3221225477 | memory/assertion | 81 ms |
| `seeds\min004_isolation_1.mlir` | `cse` | 0 | success | 28 ms |
| `seeds\min004_isolation_1.mlir` | `canonicalize_cse` | 3221225477 | memory/assertion | 74 ms |
| `seeds\min004_isolation_1.mlir` | `symbol_dce_canonicalize` | 3221225477 | memory/assertion | 75 ms |