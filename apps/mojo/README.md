# MLIRShield-Mojo 应用场景桥接

本目录是 MLIRShield 面向 Mojo 应用场景的保守扩展示例。

该桥接模块记录 Mojo 源码样例、Mojo 构建命令、构建状态、可用时的 LLVM IR 产物以及哈希信息。它不声称公开 Mojo CLI 能直接导出 Mojo 内部 MLIR；相关的 MLIRShield 验证使用 `seeds/mojo_core_profile/` 和 `configs/pipelines_mojo_core.json` 作为 Mojo / AI kernel 编译场景的 MLIR Core profile。

当前主机说明：如果 WSL 或 Mojo 不可用，`scripts/collect_mojo_artifacts.py` 会写入 `status=unavailable` 的 manifest，并保留命令和错误证据。这样可以保持应用场景扩展可审计，同时避免夸大当前环境能力。
