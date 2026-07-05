# 版本差分实验

- Tools: mlir-opt-15, mlir-opt-22
- Cases: 4

## 判定摘要

| Case | Status |
| --- | --- |
| MIN-001 LLVM #75811 minimized GPU parallel lowering crash | `fixed-or-version-resolved` |
| MIN-002 Discovery shape.fold_div canonicalize crash candidate | `fixed-or-version-resolved` |
| MIN-003 LLVM #61085 minimized TOSA/Linalg/Affine crash | `pipeline-incompatible-on-newer` |
| MIN-004 MLIR 22 current memref.subview dim canonicalize crash | `newer-version-hard-failure` |

## 详细结果

### MIN-001 LLVM #75811 minimized GPU parallel lowering crash

- Seed: `outputs/minimized/llvm_75811_gpu_parallel_probe.min.mlir`
- Source: https://github.com/llvm/llvm-project/issues/75811

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:eab4d4b02a` | 1424 ms |
| `mlir-opt-22` | 0 | `success` | `` | 104 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-parallel-loops-to-gpu --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x7902535043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so....
```

#### mlir-opt-22 excerpt

```text
module {
  func.func @main() {
    return
  }
}
```

### MIN-002 Discovery shape.fold_div canonicalize crash candidate

- Seed: `outputs/minimized/shape_fold_div_canonicalize.min.mlir`
- Source: LLVM official mlir/test/Dialect/Shape/fold-div.mlir

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:1b5140366a` | 1296 ms |
| `mlir-opt-22` | 0 | `success` | `` | 107 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --canonicalize --cse --sccp --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x76e4e09043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_Z...
```

#### mlir-opt-22 excerpt

```text
module {
  func.func @fold_div_index_neg_rhs() -> index {
    %c0 = arith.constant 0 : index
    %0 = shape.div %c0, %c0 : index, index -> index
    return %0 : index
  }
}
```

### MIN-003 LLVM #61085 minimized TOSA/Linalg/Affine crash

- Seed: `outputs/minimized/llvm_61085_tosa_linalg_affine.min.mlir`
- Source: https://github.com/llvm/llvm-project/issues/61085

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:c42721cfdd` | 1290 ms |
| `mlir-opt-22` | 1 | `unknown failure` | `unknown failure:6165fe2999` | 185 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --pass-pipeline=func.func(tosa-to-arith) --linalg-bufferize --pass-pipeline=func.func(tosa-to-linalg) --convert-linalg-to-affine-loops -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintS...
```

#### mlir-opt-22 excerpt

```text
mlir-opt-22: Unknown command line argument '--linalg-bufferize'.  Try: 'mlir-opt-22 --help'
mlir-opt-22: Did you mean '--linalg-detensorize'?
```

### MIN-004 MLIR 22 current memref.subview dim canonicalize crash

- Seed: `outputs/minimized/mlir22_memref_canonicalize_current.chunk.min.mlir`
- Source: Discovery with mlir-opt-22 over LLVM official memref/canonicalize.mlir

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | 1 | `unknown failure` | `unknown failure:46357f23b4` | 48 ms |
| `mlir-opt-22` | -1 | `memory/assertion` | `memory/assertion:dc1cf21e24` | 1349 ms |

#### mlir-opt-15 excerpt

```text
<stdin>:2:29: error: expected attribute value
    %arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index) -> index {
                            ^
```

#### mlir-opt-22 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-22 --canonicalize --cse --sccp --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.22.1 0x000075b4244b33a6 llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 54
1  libLLVM.so.22....
```
