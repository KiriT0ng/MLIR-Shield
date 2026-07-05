# MIN-004 当前版本验证

## 结论

未复现 hard failure

## 运行信息

- Tool: `mlir-opt-23`
- Return code: `0`
- Classification: `resolved-or-not-reproduced`
- Elapsed: `580.33 ms`
- Seed: `outputs/minimized/mlir22_memref_canonicalize_current.chunk.min.mlir`
- Args: `--canonicalize --cse --sccp --canonicalize -o -`

## stdout 摘要

```mlir
module {
  func.func @no_crash_dim_of_ambiguous_subview(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index) -> index {
    return %arg1 : index
  }
}


```

## stderr 摘要

```text

```
