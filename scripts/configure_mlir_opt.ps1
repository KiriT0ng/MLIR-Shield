param(
    [string]$LLVMRoot = "",
    [switch]$PersistUserEnv,
    [switch]$UseVmRunner,
    [string]$RemoteMlirOpt = "mlir-opt-23"
)

$ErrorActionPreference = "Stop"
$ProjectRoot = Resolve-Path (Join-Path $PSScriptRoot "..")

function Find-MlirOpt {
    param([string[]]$Roots)

    foreach ($root in $Roots) {
        if (-not $root) { continue }
        if (-not (Test-Path -LiteralPath $root)) { continue }
        $hit = Get-ChildItem -LiteralPath $root -Recurse -Filter "mlir-opt.exe" -File -ErrorAction SilentlyContinue |
            Select-Object -First 1
        if ($hit) { return $hit.FullName }
    }
    return $null
}

$roots = @()
if ($LLVMRoot) {
    $roots += $LLVMRoot
}
$roots += @(
    $env:MLIRSHIELD_MSYS2_ROOT,
    (Join-Path $ProjectRoot "third_party\msys64\mingw64"),
    (Join-Path $ProjectRoot "clang+llvm-22.1.8-x86_64"),
    "C:\Program Files\LLVM",
    "C:\Program Files (x86)\LLVM",
    "$env:USERPROFILE\scoop\apps\llvm",
    "$env:LOCALAPPDATA\Programs\LLVM"
)

$mlirOpt = Find-MlirOpt -Roots $roots
if ($mlirOpt) {
    $env:MLIR_OPT = $mlirOpt
    $bin = Split-Path -Parent $mlirOpt
    if (($env:Path -split ';') -notcontains $bin) {
        $env:Path = "$bin;$env:Path"
    }
    if ($PersistUserEnv) {
        [Environment]::SetEnvironmentVariable("MLIR_OPT", $mlirOpt, "User")
        $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
        if (($userPath -split ';') -notcontains $bin) {
            [Environment]::SetEnvironmentVariable("Path", "$bin;$userPath", "User")
        }
    }
    Write-Host "Configured MLIR_OPT=$mlirOpt" -ForegroundColor Green
    & $mlirOpt --version
    exit $LASTEXITCODE
}

if ($UseVmRunner) {
    $runner = "python scripts\ssh_mlir_opt.py --remote-mlir-opt $RemoteMlirOpt"
    $env:MLIR_OPT = $runner
    if ($PersistUserEnv) {
        [Environment]::SetEnvironmentVariable("MLIR_OPT", $runner, "User")
    }
    Write-Host "Configured MLIR_OPT for VM runner: $runner" -ForegroundColor Yellow
    Write-Host "Set MLIR_SSH_PASSWORD before running real cases." -ForegroundColor Yellow
    exit 0
}

Write-Host "mlir-opt.exe was not found." -ForegroundColor Red
Write-Host "The current clang+llvm Windows archive contains clang/llvm tools, but not MLIR tools." -ForegroundColor Yellow
Write-Host "Options:" -ForegroundColor Yellow
Write-Host "  1. Provide a LLVM/MLIR build that contains bin\mlir-opt.exe, then rerun:"
Write-Host "     powershell -ExecutionPolicy Bypass -File scripts\configure_mlir_opt.ps1 -LLVMRoot <path> -PersistUserEnv"
Write-Host "  2. Use the existing VM runner:"
Write-Host "     `$env:MLIR_SSH_PASSWORD='<vm-password>'"
Write-Host "     powershell -ExecutionPolicy Bypass -File scripts\configure_mlir_opt.ps1 -UseVmRunner -RemoteMlirOpt mlir-opt-23"
exit 1
