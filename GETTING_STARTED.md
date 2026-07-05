# MLIRShield 首次使用说明

MLIRShield 支持本地 `mlir-opt`、已保存证据浏览以及可选的 SSH 运行器。默认路径为本地使用；SSH 保留用于远程 MLIR 环境。

## 1. 启动仪表盘

```powershell
powershell -ExecutionPolicy Bypass -File .\final_demo.ps1
```

打开 `http://127.0.0.1:8765/`。如果本地 `mlir-opt` 尚未配置，仪表板仍然可以浏览 `outputs/` 中保存的证据、报告和案例记录。

## 2. 配置本地 mlir-opt

可以使用 `MLIR_OPT` 或 MLIRShield 特有的变量：

```powershell
$env:MLIR_OPT="C:\path\to\mlir-opt.exe"
```

```powershell
$env:MLIRSHIELD_MLIR_OPT="C:\msys64\mingw64\bin\mlir-opt.exe"
$env:MLIRSHIELD_MSYS2_ROOT="C:\msys64"
```

验证本地工具链：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_real_toolchain.ps1
python run.py --demo --seeds seeds\demo_failures --out outputs\smoke_demo --timeout 3
```

## 3. 可选的 SSH 运行器

SSH 默认处于禁用状态。仅当有意使用远程 MLIR 机器时才启用它：

```powershell
$env:MLIRSHIELD_USE_SSH="1"
$env:MLIR_SSH_HOST="192.168.54.128"
$env:MLIR_SSH_USER="toby"
$env:MLIR_SSH_PASSWORD="<password>"
$env:REMOTE_MLIR_OPT="mlir-opt-15"
powershell -ExecutionPolicy Bypass -File .\final_demo.ps1 -UseSsh
```

本地 `mlir-opt` 用户不需要 SSH 变量。

## 4. 关键文件

- `README.md`: 仓库概览和常用命令。
- `PROJECT_CONTENTS.md`: 整理项目清单。
- `UPLOAD_CHECKLIST.md`: GitHub 上传清单。
- `docs/ORIG-CAND-001_github_comment.md`: ORIG-CAND-001 的 GitHub 问题/评论草稿。
- `reports/MLIRShield_Report_FinalV1.pdf`: 最新报告。
