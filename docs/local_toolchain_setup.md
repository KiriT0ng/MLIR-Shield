# 本机 MLIR 工具链配置说明

## 结论

当前下载的 `clang+llvm-22.1.8-x86_64-pc-windows-msvc` Windows 预编译包中没有 `bin\mlir-opt.exe`。这不是项目 PATH 配置错误，而是该发行包没有随包提供 MLIR 命令行工具。

常见检查位置：

- `clang+llvm-22.1.8-x86_64\bin`
- `third_party\msys64\mingw64\bin`
- `C:\Program Files`
- `C:\Program Files (x86)`
- 当前用户目录
- 当前 PATH

上述位置均未发现 `mlir-opt.exe`。

## 方案一：配置本机 mlir-opt.exe

如果后续下载或编译得到了包含 `bin\mlir-opt.exe` 的 LLVM/MLIR 目录，执行：

```powershell
cd <MLIRShield-repo>
powershell -ExecutionPolicy Bypass -File scripts\configure_mlir_opt.ps1 -LLVMRoot "<LLVM-or-MLIR-root>" -PersistUserEnv
```

脚本会：

1. 递归查找 `mlir-opt.exe`。
2. 设置当前会话的 `MLIR_OPT`。
3. 如果带 `-PersistUserEnv`，写入用户环境变量。
4. 将 `mlir-opt.exe` 所在 `bin` 目录加入用户 PATH。
5. 执行 `mlir-opt.exe --version` 验证。

验证：

```powershell
$env:MLIR_OPT
mlir-opt --version
python web\server.py 8765
```

## 方案二：使用已有 VM/SSH runner

项目已经提供 `scripts\ssh_mlir_opt.py`，可把本地项目连接到 Ubuntu VM 上的 `mlir-opt-15`、`mlir-opt-22` 或 `mlir-opt-23`。

前提：

- Ubuntu VM 已启动。
- `192.168.54.128:22` 可访问，或使用实际 VM IP。
- VM 中已安装对应 `mlir-opt-*` 命令。
- 已设置 VM 密码环境变量。

配置示例：

```powershell
cd <MLIRShield-repo>
$env:MLIR_SSH_PASSWORD = "<vm-password>"
powershell -ExecutionPolicy Bypass -File scripts\configure_mlir_opt.ps1 -UseVmRunner -RemoteMlirOpt mlir-opt-23
python run.py --issues --mlir-opt "$env:MLIR_OPT" --timeout 45
```

也可以使用交互脚本：

```powershell
cd <MLIRShield-repo>
powershell -ExecutionPolicy Bypass -File scripts\run_with_vm_ssh.ps1 -RemoteMlirOpt mlir-opt-23
```

## 方案三：继续使用 Demo runner

Demo runner 只用于用户门户演示，不代表真实 LLVM/MLIR 结论：

```powershell
cd <MLIRShield-repo>
$env:MLIR_OPT = "python scripts\user_demo_mlir_opt.py"
python web\server.py 8765
```

报告中必须明确标注 Demo runner 的边界，不能把它写成真实工具链复现。
