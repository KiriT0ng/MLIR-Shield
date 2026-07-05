# 面向 MLIR Pass / Dialect 的差分一致性与安全验证框架

## 项目定位

本项目面向 MLIR 编译基础设施，构建一个多路径 pass pipeline 差分测试工具。它将同一份 MLIR seed 输入到多条理论上等价或近似等价的变换路径中，自动观察 parser、verifier、dialect 注册、类型合法性、rewrite 逻辑和 assertion/crash 等异常表现。

项目目标不是重新实现 MLIR verifier，而是做一个自动化测试框架，用差分一致性发现隐藏缺陷和安全风险。

## 当前基础版能力

- Seed 扫描：自动读取 `seeds/` 目录下的 `.mlir` 文件。
- 来源追踪：通过 `data/seed_sources.json` 标注 generated、official、issue 三类来源。
- Pipeline 调度：读取 `configs/pipelines.json` 或 demo 配置。
- 执行器：真实模式调用 `mlir-opt`，demo/mock 模式用于无 MLIR 环境演示。
- 结果采集：记录 return code、stdout、stderr、耗时和中间产物。
- 差分比较：识别同一 seed 下部分 pipeline 成功、部分 pipeline 失败的分歧。
- 安全分类：初步归类 parser、verifier、dialect registration、type legality、rewrite、memory/assertion、timeout。
- 报告输出：生成 JSON、Markdown、HTML 三种报告。
- Web 展示：提供本地网站，集中展示 seed 分类、pipeline 配置、风险统计和问题详情。

## 模块结构

```text
run.py                    命令行入口
mlirdiff/cli.py           参数解析和主流程
mlirdiff/config.py        pipeline 配置加载
mlirdiff/engine.py        调度执行 mlir-opt 或 mock executor
mlirdiff/classifier.py    stderr/stdout 风险分类
mlirdiff/diffing.py       pipeline 差分分析
mlirdiff/report.py        JSON/Markdown/HTML 报告生成
configs/                 pipeline 配置
seeds/                   MLIR seed 样例
outputs/                 运行产物和报告
web/                     本地 Web 控制台
```

## 演示步骤

当前机器如果没有 `mlir-opt`，可以先运行 demo 模式：

```powershell
python run.py --demo
```

demo 模式会模拟一条 verifier 失败路径，生成风险报告：

```text
outputs/demo/report.html
```

如果已经安装 MLIR 工具链，并且 `mlir-opt` 在 PATH 中：

```powershell
python run.py
```

也可以指定 `mlir-opt` 路径：

```powershell
python run.py --mlir-opt C:\path\to\mlir-opt.exe
```

也可以启动 Web 控制台：

```powershell
python web/server.py
```

访问：

```text
http://127.0.0.1:8765
```

## 后续优化计划

1. 继续扩充 seed 库，按 `tosa`、`linalg`、`affine`、mixed dialect 分类。
2. 增加更复杂的 pass pipeline，例如 lowering、bufferize、LLVM dialect 转换。
3. 继续引入真实 bug/issue 最小复现样例，形成可展示的漏洞案例库。
4. 改进 IR 结构差分，不只比较文本，还比较 operation、type、region 结构。
5. Web 可视化界面继续增强，增加上传 seed、选择 pipeline 和历史报告对比。
