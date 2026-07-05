# LLVM #197158 MLIR 23 Current Validation

## Summary

LLVM issue #197158 was reproduced on the local `mlir-opt-23` development snapshot.

```text
tool: mlir-opt-23
version: Ubuntu LLVM version 23.0.0
pipeline: --mem2reg
seed: seeds/current_mlir23/llvm_197158_mem2reg_dbg_declare_use_after_erase.mlir
classification: memory/assertion
```

## Result

| Pipeline | Return | Category |
| --- | ---: | --- |
| parse_verify | 0 | success |
| mem2reg_dbg_declare_issue_197158 | 4294967295 | memory/assertion |

## Evidence

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0. Program arguments: mlir-opt-23 --mem2reg -o -
...
mlir::Type::getContext() const
mlir::verify(mlir::Operation*, bool)
```

Full artifacts:

```text
outputs/current_issues_mlir23/report.json
outputs/current_issues_mlir23/report.html
outputs/current_issues_mlir23/artifacts/
```
