# MIN-004 案例报告：MLIR 22 memref.subview dim canonicalize hard failure

## 1. 案例定位

MIN-004 是本项目目前最适合作为答辩核心展示的“发现闭环”案例。它不是历史 issue 的简单复现，而是由 Discovery 流程在 MLIR 22 工具链上，从 LLVM 官方 memref/canonicalize 测试种子中触发、分类、最小化并版本差分得到的 hard failure 候选。

2026-05-31 复核结论：该最小复现在 apt.llvm.org 的 MLIR 23 development snapshot 上未复现 hard failure，`mlir-opt-23` 返回 0 并将函数优化为直接返回 `%arg1`。因此，MIN-004 更准确的表述应是“MLIR 22 hard failure，已在更新开发快照中修复或优化路径改变”，不应继续表述为“最新版本仍存在”。

这个案例体现了系统的完整闭环：

1. 从真实官方 seed 进入测试语料库。
2. 使用多 pass stress pipeline 执行差分发现。
3. 通过失败分类识别 hard failure。
4. 使用最小化流程把原始大文件压缩为 8 行复现。
5. 对 MLIR 15、MLIR 22 和 MLIR 23 snapshot 做版本差分，确认其在 MLIR 22 上触发，在更新快照中未复现。

## 2. 复现信息

案例编号：MIN-004

最小复现文件：

```text
outputs/minimized/mlir22_memref_canonicalize_current.chunk.min.mlir
```

触发 pipeline：

```bash
mlir-opt-22 --canonicalize --cse --sccp --canonicalize -o -
```

最小 IR：

```mlir
func.func @no_crash_dim_of_ambiguous_subview(
    %arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index) -> index {
  %c1 = arith.constant 1 : index
  %subview = memref.subview %arg0[0, 0, 0] [1, %arg1, 1] [1, 1, 1]
      : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<1x?xf32, strided<[?, ?], offset: ?>>
  %dim = memref.dim %subview, %c1 : memref<1x?xf32, strided<[?, ?], offset: ?>>
  return %dim : index
}
```

## 3. 发现路径

原始来源：LLVM 官方 memref canonicalize 测试种子。

项目内来源文件：

```text
seeds/real_official/memref/canonicalize_extra.mlir
```

发现流程：

1. 将 LLVM 官方 MLIR 测试样例导入 `seeds/real_official/`。
2. 使用 `configs/pipelines_discovery.json` 中的 stress pipeline 执行全量 Discovery。
3. 在 MLIR 22 环境中记录 hard failure。
4. 使用 `scripts/minimize_seed.py` 做行级 delta minimization。
5. 使用 `scripts/minimize_mlir_chunks.py` 做函数/块级进一步压缩。
6. 得到 8 行最小复现。

规模变化：

```text
原始官方种子约 1236 行 -> 初步最小化 61 行 -> 块级最小化 8 行
```

## 4. 版本差分结论

MLIR 22：

```text
hard failure / stack dump
```

MLIR 15：

```text
parser/attribute incompatibility
```

解释：MLIR 15 无法解析该新版本 memref layout 语法，因此不能直接证明 MLIR 15 不受影响。但这仍然说明 MIN-004 是与当前 MLIR 22 语法和优化路径相关的候选问题，而不是单纯历史版本遗留的复现结果。

MLIR 23 development snapshot：

```text
resolved-or-not-reproduced / return code 0
```

运行结果：

```mlir
module {
  func.func @no_crash_dim_of_ambiguous_subview(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index) -> index {
    return %arg1 : index
  }
}
```

解释：`mlir-opt-23` 来自 apt.llvm.org 的 LLVM/MLIR development snapshot，版本显示为 `Ubuntu LLVM version 23.0.0`。该结果说明 MIN-004 在更新快照中已经不再触发 hard failure，可能是相关 canonicalization 逻辑被修复，也可能是优化路径发生了变化。项目已将本次验证产物保存到 `outputs/current_validation/`。

## 5. 安全与工程价值

该问题位于编译器基础设施的中间表示优化阶段，影响面不是单一应用逻辑，而是可能影响使用 MLIR 作为编译后端或中间优化层的上层系统。hard failure 类型问题的风险包括：

- 编译服务或模型编译任务异常中断。
- CI、自动化编译平台或在线编译服务被特定 IR 输入触发拒绝服务。
- 上层框架难以定位问题来源，因为错误发生在底层 pass 组合中。
- pass 组合复杂时，人工构造触发样例成本高，适合自动化差分系统发现。

## 6. 答辩展示建议

演示时不建议先展示大量日志，建议按下面顺序讲：

1. 展示网页首页的“核心成果看板”。
2. 点击 `Minimized Repros`，定位 MIN-004。
3. 打开最小 MLIR 文件，强调只有 8 行。
4. 展示版本差分结论：MLIR 22 hard failure，MLIR 15 无法走到同一路径，MLIR 23 snapshot 不再复现。
5. 总结它为什么体现“发现 -> 最小化 -> 版本验证 -> 回归证据”的完整能力，而不是“复现历史 issue”。

## 7. 后续验证

如果后续准备向 LLVM 上游提交 issue，建议先确认 MLIR 22 所属 release 分支是否仍维护；若主线已经修复，更适合将 MIN-004 作为回归测试和发现能力案例，而不是作为未修复漏洞提交。

- 完整 stderr stack trace。
- MLIR 22 精确版本号。
- 是否存在更短的 pass pipeline。
- 是否可从 `--canonicalize` 单 pass 触发，或必须由组合 pipeline 触发。
