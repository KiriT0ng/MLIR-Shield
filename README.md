# MLIRShield

MLIRShield 是一个面向 MLIR/LLVM 编译基础设施的差分安全验证平台。项目围绕 MLIR seed 语料、pass pipeline、真实或模拟 `mlir-opt` 执行、失败分类、签名聚类、最小化证据、版本差分证据和本地 Web 门户，提供一套可复现的编译器安全检测流程。

## 仓库结构

- `mlirdiff/`：核心执行器、分类器、签名聚类、报告生成和数据模型。
- `web/`：本地证据门户和用户侧分析页面。
- `scripts/`：证据生成、分诊、最小化、工具链探测和辅助脚本。
- `configs/`：pass pipeline、版本差分和工具链配置模板。
- `seeds/`：整理后的 MLIR seed 语料和代表性复现输入。
- `outputs/`：项目运行所需的已保存证据快照和可复核输出。
- `data/`：seed 来源索引和结构化辅助数据。
- `apps/`：应用场景扩展示例。
- `docs/`：项目说明、复现说明、案例记录和证据资料。
- `GETTING_STARTED.md`：首次运行、本地 `mlir-opt` 和可选 SSH runner 配置说明。

> 注意：本地保留的 `reports/` 报告目录不进入 GitHub 上传范围，已由 `.gitignore` 排除。

## 快速开始

首次使用建议先阅读 `GETTING_STARTED.md`。项目默认使用本地 `mlir-opt` 或浏览已保存证据；历史 SSH runner 仅作为可选接口保留，未显式配置时不会启用。

使用内置 mock 执行器运行演示：

```powershell
python run.py --demo
```

只运行小型 demo seed 的快速烟测：

```powershell
python run.py --demo --seeds seeds\demo_failures --out outputs\smoke_demo --timeout 3
```

使用 PATH 中的真实 `mlir-opt`：

```powershell
python run.py --seeds seeds --pipelines configs/pipelines_demo.json --mlir-opt mlir-opt
```

显式指定本地工具链：

```powershell
$env:MLIR_OPT="C:\path\to\mlir-opt.exe"
python run.py --seeds seeds --pipelines configs/pipelines_demo.json
```

通过环境变量验证 MSYS2/MinGW64 MLIR 工具链：

```powershell
$env:MLIRSHIELD_MSYS2_ROOT="C:\msys64"
$env:MLIRSHIELD_MLIR_OPT="C:\msys64\mingw64\bin\mlir-opt.exe"
powershell -ExecutionPolicy Bypass -File scripts\verify_real_toolchain.ps1
```

启动本地门户：

```powershell
python web/server.py
```

打开 `http://127.0.0.1:8765`。

也可以使用打包入口启动：

```powershell
powershell -ExecutionPolicy Bypass -File .\final_demo.ps1
```

## 验证说明

修改代码或更新证据后建议运行：

```powershell
git status --ignored
python run.py --demo --seeds seeds\demo_failures --out outputs\smoke_demo --timeout 3
```

`.gitignore` 已排除报告目录、旧平台上传包目录、本地工具链配置、缓存、日志、临时渲染文件、生成运行目录和本地敏感配置。
