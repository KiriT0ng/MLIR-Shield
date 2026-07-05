# MLIR Differential Report

- Seeds: 1
- Pipelines: 2
- Runs: 2
- Issues: 1

## Issues

### [high] pipeline divergence

- Seed: `seeds\original_candidates\orig_001_inliner_nested_region_returned_func.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify_allow_unregistered | 0 | success | false
inline_allow_unregistered | 4294967295 | memory/assertion | false
```

## Summary

### Run categories

### Invariant findings

- none: 0

- memory/assertion: 1
- success: 1

### Issue kinds

- pipeline divergence: 1

### Failure clusters

- `memory/assertion:d34961e10d`: 1 runs, 1 seeds, category `memory/assertion`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\original_candidates\orig_001_inliner_nested_region_returned_func.mlir` | `parse_verify_allow_unregistered` | 0 | success | 710 ms |
| `seeds\original_candidates\orig_001_inliner_nested_region_returned_func.mlir` | `inline_allow_unregistered` | 4294967295 | memory/assertion | 2035 ms |