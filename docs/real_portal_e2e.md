# 真实门户 E2E 与隔离验证

## 验证目标

MLIRShield 的用户门户不仅提供静态展示，还可以接收用户上传的 MLIR 输入，调用真实 MLIR/LLVM 工具链完成预设 pipeline 检查，并生成可追溯的历史记录、结构化 JSON、Markdown 与 HTML 报告。本材料记录 MIN-004 最小复现样例在门户路径上的端到端执行情况。

## 执行环境

- 工具链：`<MSYS2_ROOT>/mingw64/bin/mlir-opt.exe`
- 版本：LLVM/MLIR 22.1.8
- 用户接口：`/api/user/analyze`
- 结果目录：`outputs/user_jobs/<job-id>/`
- 证据图：`outputs/materials/real_portal_e2e.png`
- 证据 JSON：`outputs/competition_evidence/real_user_portal_e2e.json`

## 关键结果

| 项目 | 结果 |
| --- | --- |
| 主任务 | `job-20260703-145420-a3c40a78` |
| 检查深度 | 深度检查 |
| Pipeline 数 | 9 |
| Run 数 | 9 |
| 内部异常分类 | 5 |
| 风险等级 | high |
| Windows 返回码 | `3221225477` (`0xC0000005`) |
| 连续异常任务 | 3 个任务均完成并保留历史记录 |

## 隔离与可用性设计

门户每次请求都会创建独立 job 目录，输入文件、运行产物和报告文件互不覆盖。执行层以子进程方式调用 `mlir-opt`，并设置单 pipeline 超时与 stdout/stderr 截断上限，避免异常输入造成控制面阻塞。针对 Windows/MSYS2 在中文路径下可能无法直接打开文件的问题，执行引擎使用 stdin 将 IR 内容传递给本地真实 runner，使检测结论不受工作区路径编码影响。

## 作品展示口径

该验证说明系统已经具备从用户上传、真实工具链执行、异常分类、历史留存到报告生成的完整闭环。MIN-004 在用户门户路径中被识别为需要项目成员复核的内部异常候选，和命令行复现实验保持一致。
