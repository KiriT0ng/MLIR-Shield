# Seed 库概览

当前整理后的 seed 库用于支撑 demo、真实 issue 复现、官方测试样例回归和发现性 fuzz。项目上传版本保留这些输入文件，是为了保证门户展示、命令行 smoke test 和部分证据快照可以在仓库内直接对应到原始输入。

## 总量概览

- seed 总数：110
- generated：12
- issue：5
- official：93

## 按来源分类

| 来源 | 数量 | 说明 |
| --- | ---: | --- |
| generated | 12 | 项目内生成的基础样例和无真实 `mlir-opt` 环境时的演示样例。 |
| issue | 5 | 从公开 LLVM issue 中整理出的复现片段或最小复现。 |
| official | 93 | LLVM 官方 MLIR 测试文件，适合作为回归和版本差分 seed。 |

## 按目录分类

| 目录 | 数量 | 用途 |
| --- | ---: | --- |
| `seeds/affine` | 1 | Affine dialect 基础输入。 |
| `seeds/arith` | 2 | Arith / 常量折叠相关基础输入。 |
| `seeds/cf` | 1 | Control Flow 相关基础输入。 |
| `seeds/demo_failures` | 5 | mock/demo 模式下用于展示不同失败类别的样例。 |
| `seeds/issue_repros` | 5 | 公开 issue 复现输入。 |
| `seeds/linalg` | 1 | Linalg 相关基础输入。 |
| `seeds/real_official` | 93 | LLVM 官方 MLIR 测试样例。 |
| `seeds/scf` | 1 | SCF dialect 基础输入。 |

## 使用建议

- 首次运行使用 `seeds/demo_failures`，速度快且不依赖真实工具链。
- 本地已配置 `mlir-opt` 后，可使用 `seeds/issue_repros` 或 `seeds/real_official` 做真实验证。
- 需要查看完整来源时，参考 `data/seed_sources.json`。
