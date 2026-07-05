# 版本差分实验

- Tools: mlir-opt-15, mlir-opt-22
- Cases: 9

## 判定摘要

| Case | Status |
| --- | --- |
| P0-001 gpu_parallel_probe / llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir / memory/assertion:eab4d4b02a | `still-fails-different-mode` |
| P0-002 linalg_affine_probe / fill_tensor.mlir / memory/assertion:b22341475e | `fixed-or-version-resolved` |
| P0-003 canonicalize_cse_sccp / fold_div.mlir / memory/assertion:1b5140366a | `fixed-or-version-resolved` |
| P0-004 symbol_dce_inliner_canonicalize / fold_div.mlir / memory/assertion:d71f5288fe | `fixed-or-version-resolved` |
| P0-005 affine_lowering_stress / fold_div.mlir / memory/assertion:557b77397b | `fixed-or-version-resolved` |
| P0-006 scf_to_cf_stress / fold_div.mlir / memory/assertion:ff5f72ebfd | `fixed-or-version-resolved` |
| P0-007 vector_lowering_stress / fold_div.mlir / memory/assertion:1b6ed177c5 | `fixed-or-version-resolved` |
| P0-008 bufferization_probe / fold_div.mlir / memory/assertion:4c45f29ec2 | `fixed-or-version-resolved` |
| P0-009 linalg_affine_probe / fold_div.mlir / memory/assertion:15c58d956b | `fixed-or-version-resolved` |

## 详细结果

### P0-001 gpu_parallel_probe / llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir / memory/assertion:eab4d4b02a

- Seed: `seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir`
- Source: Discovery P0 candidate

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:eab4d4b02a` | 1459 ms |
| `mlir-opt-22` | 1 | `unknown failure` | `unknown failure:1d2c7dea60` | 104 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-parallel-loops-to-gpu --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x70f9273043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so....
```

#### mlir-opt-22 excerpt

```text
<stdin>:12:5: error: 'scf.parallel' op expects body to terminate with 'scf.reduce'
    scf.parallel (%arg0) = (%c0_6) to (%c1) step (%c1_7) {
    ^
<stdin>:12:5: note: see current operation:
"scf.parallel"(%3, %4, %5) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
^bb0(%arg0: index):
  %6 = "arith.constant"() <{value = 0 : index}> : () -> index
  %7 = "arith.constant"() <{value = 1 : index}> : () -> index
```

### P0-002 linalg_affine_probe / fill_tensor.mlir / memory/assertion:b22341475e

- Seed: `seeds\linalg\fill_tensor.mlir`
- Source: Discovery P0 candidate

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:b22341475e` | 1291 ms |
| `mlir-opt-22` | 0 | `success` | `` | 104 ms |

#### mlir-opt-15 excerpt

```text
LLVM ERROR: out of memory
Allocation failed
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-linalg-to-affine-loops --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x77aa2...
```

#### mlir-opt-22 excerpt

```text
module {
  func.func @fill_tensor(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<4xf32>) -> tensor<4xf32>
    return %0 : tensor<4xf32>
  }
}
```

### P0-003 canonicalize_cse_sccp / fold_div.mlir / memory/assertion:1b5140366a

- Seed: `seeds\real_official\shape\fold_div.mlir`
- Source: Discovery P0 candidate

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:1b5140366a` | 1294 ms |
| `mlir-opt-22` | 0 | `success` | `` | 111 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --canonicalize --cse --sccp --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x7897447043b1]
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

### P0-004 symbol_dce_inliner_canonicalize / fold_div.mlir / memory/assertion:d71f5288fe

- Seed: `seeds\real_official\shape\fold_div.mlir`
- Source: Discovery P0 candidate

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:d71f5288fe` | 1292 ms |
| `mlir-opt-22` | 0 | `success` | `` | 112 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --symbol-dce --inline --canonicalize --cse -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x70ce093043b1]
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

### P0-005 affine_lowering_stress / fold_div.mlir / memory/assertion:557b77397b

- Seed: `seeds\real_official\shape\fold_div.mlir`
- Source: Discovery P0 candidate

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:557b77397b` | 1277 ms |
| `mlir-opt-22` | 0 | `success` | `` | 106 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --lower-affine --canonicalize --cse -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x7046217043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3...
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

### P0-006 scf_to_cf_stress / fold_div.mlir / memory/assertion:ff5f72ebfd

- Seed: `seeds\real_official\shape\fold_div.mlir`
- Source: Discovery P0 candidate

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:ff5f72ebfd` | 1272 ms |
| `mlir-opt-22` | 0 | `success` | `` | 98 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-scf-to-cf --canonicalize --cse -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x7aa28d1043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4...
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

### P0-007 vector_lowering_stress / fold_div.mlir / memory/assertion:1b6ed177c5

- Seed: `seeds\real_official\shape\fold_div.mlir`
- Source: Discovery P0 candidate

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:1b6ed177c5` | 1290 ms |
| `mlir-opt-22` | 0 | `success` | `` | 107 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-vector-to-scf --convert-vector-to-llvm --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x770fcbd043b1]
/lib/x86_64-linux-g...
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

### P0-008 bufferization_probe / fold_div.mlir / memory/assertion:4c45f29ec2

- Seed: `seeds\real_official\shape\fold_div.mlir`
- Source: Discovery P0 candidate

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:4c45f29ec2` | 1285 ms |
| `mlir-opt-22` | 0 | `success` | `` | 103 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --one-shot-bufferize --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x755d671043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3...
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

### P0-009 linalg_affine_probe / fold_div.mlir / memory/assertion:15c58d956b

- Seed: `seeds\real_official\shape\fold_div.mlir`
- Source: Discovery P0 candidate

| Tool | Return | Category | Signature | Time |
| --- | ---: | --- | --- | ---: |
| `mlir-opt-15` | -1 | `memory/assertion` | `memory/assertion:15c58d956b` | 1272 ms |
| `mlir-opt-22` | 0 | `success` | `` | 107 ms |

#### mlir-opt-15 excerpt

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-linalg-to-affine-loops --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x70c725b043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so...
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
