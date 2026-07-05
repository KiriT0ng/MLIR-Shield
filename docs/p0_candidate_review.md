# P0 候选复核报告

- 来源报告：`outputs\discovery\report.json`
- P0 候选数量：9

P0 只保留 crash/assertion/timeout 一类高价值候选。下一步需要确认它们是否由无效 seed、版本不兼容、测试文件注释残留或真实 pass bug 导致。

## 复核规则

1. 先看 `parse_verify` 是否失败；如果基础解析失败，通常不是 pass 新问题。
2. 如果只有某条 lowering/stress pipeline 崩溃，优先做最小化。
3. 如果同一 seed 在多条 pipeline 崩溃，优先检查 seed 是否包含旧版 MLIR 不支持的语法。
4. 最小化后仍稳定触发 `PLEASE submit a bug report`、`LLVM ERROR`、`Stack dump` 的，进入项目发现清单。

## `memory/assertion:eab4d4b02a`

- 计数：2
- 示例 seed：`seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir`
- 示例 pipeline：`gpu_parallel_probe`
- 复现命令：`python scripts\ssh_mlir_opt.py seeds\issue_repros\llvm_75811_scf_parallel_to_gpu_destroyed_use.mlir --convert-parallel-loops-to-gpu --canonicalize -o -`
- 建议操作：最小化后在配置好的本地或可选 SSH 工具链上复核。

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-parallel-loops-to-gpu --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x72e63ed043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys17RunSignalHandlersEv+0xee)[0x72e63ed020fe]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(+0xf...
```

## `memory/assertion:15c58d956b`

- 计数：1
- 示例 seed：`seeds\real_official\shape\fold_div.mlir`
- 示例 pipeline：`linalg_affine_probe`
- 复现命令：`python scripts\ssh_mlir_opt.py seeds\real_official\shape\fold_div.mlir --convert-linalg-to-affine-loops --canonicalize -o -`
- 建议操作：最小化后在配置好的本地或可选 SSH 工具链上复核。

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-linalg-to-affine-loops --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x7320f15043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys17RunSignalHandlersEv+0xee)[0x7320f15020fe]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(+0x...
```

## `memory/assertion:1b5140366a`

- 计数：1
- 示例 seed：`seeds\real_official\shape\fold_div.mlir`
- 示例 pipeline：`canonicalize_cse_sccp`
- 复现命令：`python scripts\ssh_mlir_opt.py seeds\real_official\shape\fold_div.mlir --canonicalize --cse --sccp --canonicalize -o -`
- 建议操作：最小化后在配置好的本地或可选 SSH 工具链上复核。

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --canonicalize --cse --sccp --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x71ad1ef043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys17RunSignalHandlersEv+0xee)[0x71ad1ef020fe]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(+0xf048d...
```

## `memory/assertion:1b6ed177c5`

- 计数：1
- 示例 seed：`seeds\real_official\shape\fold_div.mlir`
- 示例 pipeline：`vector_lowering_stress`
- 复现命令：`python scripts\ssh_mlir_opt.py seeds\real_official\shape\fold_div.mlir --convert-vector-to-scf --convert-vector-to-llvm --canonicalize -o -`
- 建议操作：最小化后在配置好的本地或可选 SSH 工具链上复核。

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-vector-to-scf --convert-vector-to-llvm --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x78b8395043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys17RunSignalHandlersEv+0xee)[0x78b8395020fe]
/lib/x86_64-linux-gnu/lib...
```

## `memory/assertion:4c45f29ec2`

- 计数：1
- 示例 seed：`seeds\real_official\shape\fold_div.mlir`
- 示例 pipeline：`bufferization_probe`
- 复现命令：`python scripts\ssh_mlir_opt.py seeds\real_official\shape\fold_div.mlir --one-shot-bufferize --canonicalize -o -`
- 建议操作：最小化后在配置好的本地或可选 SSH 工具链上复核。

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --one-shot-bufferize --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x7b49eb7043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys17RunSignalHandlersEv+0xee)[0x7b49eb7020fe]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(+0xf048d6)[0x7b...
```

## `memory/assertion:557b77397b`

- 计数：1
- 示例 seed：`seeds\real_official\shape\fold_div.mlir`
- 示例 pipeline：`affine_lowering_stress`
- 复现命令：`python scripts\ssh_mlir_opt.py seeds\real_official\shape\fold_div.mlir --lower-affine --canonicalize --cse -o -`
- 建议操作：最小化后在配置好的本地或可选 SSH 工具链上复核。

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --lower-affine --canonicalize --cse -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x70543dd043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys17RunSignalHandlersEv+0xee)[0x70543dd020fe]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(+0xf048d6)[0x70...
```

## `memory/assertion:b22341475e`

- 计数：1
- 示例 seed：`seeds\linalg\fill_tensor.mlir`
- 示例 pipeline：`linalg_affine_probe`
- 复现命令：`python scripts\ssh_mlir_opt.py seeds\linalg\fill_tensor.mlir --convert-linalg-to-affine-loops --canonicalize -o -`
- 建议操作：最小化后在配置好的本地或可选 SSH 工具链上复核。

```text
LLVM ERROR: out of memory
Allocation failed
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-linalg-to-affine-loops --canonicalize -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x7f2c741043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys17RunSignalHandlersEv+0xee)[0x7f2c741020fe]
```

## `memory/assertion:d71f5288fe`

- 计数：1
- 示例 seed：`seeds\real_official\shape\fold_div.mlir`
- 示例 pipeline：`symbol_dce_inliner_canonicalize`
- 复现命令：`python scripts\ssh_mlir_opt.py seeds\real_official\shape\fold_div.mlir --symbol-dce --inline --canonicalize --cse -o -`
- 建议操作：最小化后在配置好的本地或可选 SSH 工具链上复核。

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --symbol-dce --inline --canonicalize --cse -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x7e1b58f043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys17RunSignalHandlersEv+0xee)[0x7e1b58f020fe]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(+0xf048d...
```

## `memory/assertion:ff5f72ebfd`

- 计数：1
- 示例 seed：`seeds\real_official\shape\fold_div.mlir`
- 示例 pipeline：`scf_to_cf_stress`
- 复现命令：`python scripts\ssh_mlir_opt.py seeds\real_official\shape\fold_div.mlir --convert-scf-to-cf --canonicalize --cse -o -`
- 建议操作：最小化后在配置好的本地或可选 SSH 工具链上复核。

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.
Stack dump:
0.	Program arguments: mlir-opt-15 --convert-scf-to-cf --canonicalize --cse -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys15PrintStackTraceERNS_11raw_ostreamEi+0x31)[0x7818f79043b1]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(_ZN4llvm3sys17RunSignalHandlersEv+0xee)[0x7818f79020fe]
/lib/x86_64-linux-gnu/libLLVM-15.so.1(+0xf048d6)...
```
