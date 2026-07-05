# GitHub 上传清单

## 推荐上传流程

建议在 `MLIRShield` 目录中使用 Git 上传，不要直接把整个文件夹拖入 GitHub 网页上传器。仓库中的 `.gitignore` 会排除本地缓存、日志、生成运行目录、报告目录、旧平台上传包目录和机器相关工具链配置。

```powershell
git init
git add .
git status
python run.py --demo --seeds seeds\demo_failures --out outputs\smoke_demo --timeout 3
git commit -m "Prepare MLIRShield GitHub release"
```

## 应上传的项目主体

- `mlirdiff/`、`web/`、`scripts/`、`configs/`、`seeds/`、`data/`、`apps/`
- `docs/` 中的项目说明、复现说明和必要资料
- `outputs/` 中运行和展示需要的证据快照
- 根目录下的 `README.md`、`GETTING_STARTED.md`、`PROJECT_CONTENTS.md`、`UPLOAD_CHECKLIST.md`、`requirements.txt`、`run.py`、`final_demo.ps1`

## 不上传的内容

- `reports/`：本地报告 PDF、TeX、图片资产和截图，不进入 GitHub 项目主体。
- 旧平台上传包目录：`01_documents/`、`02_executable/`、`03_source_code/`、`04_other_materials/`
- Python 缓存和编译文件：`__pycache__/`、`*.pyc`
- 生成运行目录：`outputs/latest/`、`outputs/demo/`、`outputs/smoke_demo/`、`outputs/**/artifacts/`
- 本地日志和临时报告构建文件：`*.log`、`*.aux`、`*.out`、`*.toc`、`*.synctex.gz`
- 机器相关配置：`.env`、`*.local.json`、`configs/toolchains/*.local.json`

## 本地 mlir-opt 接口

项目不硬编码个人编译器目录。使用以下任一接口配置本地工具链：

```powershell
$env:MLIR_OPT="C:\path\to\mlir-opt.exe"
python run.py --seeds seeds --pipelines configs\pipelines_demo.json
```

```powershell
$env:MLIRSHIELD_MSYS2_ROOT="C:\msys64"
$env:MLIRSHIELD_MLIR_OPT="C:\msys64\mingw64\bin\mlir-opt.exe"
powershell -ExecutionPolicy Bypass -File scripts\verify_real_toolchain.ps1
```

如需本地模板，可复制 `configs/toolchains/msys2_mingw64.example.json` 为 `.local.json`，再按目标机器修改路径。

## 网页手动上传提示

如果通过浏览器拖拽文件上传，`.gitignore` 不会自动替你过滤目录。这种情况下请不要选中 `reports/` 和旧平台上传包目录。更推荐使用 Git 命令上传。
