# 真实 Seed 来源说明

当前 seed 库分三类：

| 类型 | 目录 | 用途 |
| --- | --- | --- |
| generated | `seeds/arith`、`seeds/affine`、`seeds/demo_failures` 等 | 本地生成的基础样例和无 MLIR 环境演示样例 |
| official | `seeds/real_official` | LLVM 官方 MLIR 测试文件，适合作为 regression seed |
| issue | `seeds/issue_repros` | LLVM GitHub issue 中公开的最小复现或复现片段 |

完整来源清单见：

```text
data/seed_sources.json
```

## 已导入的 issue 复现

- LLVM issue #60569：unregistered dependent dialect 加载问题。
- LLVM issue #75811：`convert-parallel-loops-to-gpu` 在 nested `scf.parallel` 中触发 destroyed-use 崩溃。
- LLVM issue #82382：`parallel-loops-to-gpu` 相关 pipeline 在 linalg conv2d lowering 中崩溃。
- LLVM issue #119868：`test-linalg-elementwise-fusion-patterns=fuse-multiuse-producer` 触发 `op->use_empty()` assertion。
- LLVM issue #168179：自定义 `simple_vector.stride_read` lowering pipeline 崩溃复现。

## 使用方式

运行全部 seed 的 mock 基线：

```powershell
python run.py --mock
```

运行 issue 复现集合：

```powershell
python run.py --issues
```

注意：部分 issue 复现依赖 LLVM test-only pass、特定 LLVM commit 或自定义 dialect。它们被保留为真实来源样例，但不保证在任意本机 `mlir-opt` 版本上都能复现原始崩溃。
