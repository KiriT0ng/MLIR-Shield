# MLIRShield 项目内容清单

本目录按 GitHub 项目主体整理。报告目录本地保留，但不进入 GitHub 上传范围。

## 核心项目

- `run.py`：命令行入口。
- `GETTING_STARTED.md`：首次运行、本地 `mlir-opt`、已保存证据浏览和可选 SSH 模式说明。
- `mlirdiff/`：差分执行、失败分类、签名聚类和报告生成核心模块。
- `web/`：本地证据门户。
- `scripts/`：证据生成、报告辅助、最小化、版本差分和工具链检查脚本。
- `configs/`：pipeline、裁剪配置、版本差分案例和可移植工具链模板。
- `config/`：兼容既有脚本的配置文件。
- `seeds/`：整理后的 MLIR seed 库和 issue 复现输入。
- `data/`：脚本和门户使用的结构化项目数据。
- `apps/`：应用场景扩展示例。

## 本地报告材料

以下内容仅在本地目录中保留，GitHub 上传时由 `.gitignore` 排除：

- `reports/MLIRShield_Report_FinalV1.pdf`
- `reports/MLIRShield_Report_FinalV1.tex`
- `reports/figures_v7/`
- `reports/external_figures_v7/`
- `reports/ui_screenshots/`
- `reports/MLIRShield_logo.svg`

## 必要文档

- `docs/project_overview.md`
- `docs/source_review_notes.md`
- `docs/originality_evidence.md`
- `docs/min004_case_report.md`
- `docs/issue_status_matrix.md`
- `docs/p0_candidate_review.md`
- `docs/application_value.md`
- `docs/local_toolchain_setup.md`
- `docs/seed_library_overview.md`
- `docs/report_data_snapshot.md`
- `docs/real_portal_e2e.md`
- `docs/real_seed_sources.md`
- `docs/case_version_matrix.md`
- `docs/ORIG-CAND-001_github_comment.md`

## 证据快照

`outputs/` 中保留项目运行和展示所需的证据快照，包括 competition evidence、真实 MSYS2 运行记录、版本差分证据、最小化案例、discovery 运行和候选复核结果。生成产物、日志、烟测输出和本地缓存由 `.gitignore` 排除。

## 本地工具链接口

项目不硬编码个人编译器目录。本地 MLIR 工具链可通过以下接口配置：

- `MLIR_OPT`
- `MLIRSHIELD_MLIR_OPT`
- `MLIRSHIELD_MSYS2_ROOT`
- `configs/toolchains/msys2_mingw64.example.json`

可选 SSH runner 仅用于旧的远程 MLIR 环境；只有显式设置 `MLIRSHIELD_USE_SSH=1` 或启动时传入 `-UseSsh` 才会启用。

## 已忽略的旧上传包目录

以下目录属于早期平台上传包残留，不属于 GitHub 项目主体，已由 `.gitignore` 排除：

- `01_documents/`
- `02_executable/`
- `03_source_code/`
- `04_other_materials/`

请使用 Git 方式上传本目录，使忽略规则生效。
