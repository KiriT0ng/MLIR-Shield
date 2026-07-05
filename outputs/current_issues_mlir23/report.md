# MLIR Differential Report

- Seeds: 1
- Pipelines: 2
- Runs: 2
- Issues: 1

## Issues

### [high] pipeline divergence

- Seed: `seeds\current_mlir23\llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir`
- Summary: Some pipelines succeeded while others failed.

```text
pipeline | return_code | category | timed_out
--- | --- | --- | ---
parse_verify | 0 | success | false
mem2reg_dbg_declare_issue_197158 | 4294967295 | memory/assertion | false
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

- `memory/assertion:f7d55b8bae`: 1 runs, 1 seeds, category `memory/assertion`

## Runs

| Seed | Pipeline | Return | Category | Time |
| --- | --- | --- | --- | --- |
| `seeds\current_mlir23\llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `parse_verify` | 0 | success | 603 ms |
| `seeds\current_mlir23\llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir` | `mem2reg_dbg_declare_issue_197158` | 4294967295 | memory/assertion | 1795 ms |