param(
  [string]$MsysRoot = $env:MLIRSHIELD_MSYS2_ROOT,
  [string]$MlirOpt = $env:MLIRSHIELD_MLIR_OPT,
  [string]$Output = "outputs/toolchain_probe/real_msys2_mingw64_probe.json"
)

if (-not $MsysRoot) {
  $MsysRoot = "C:\msys64"
}
if (-not $MlirOpt) {
  $MlirOpt = Join-Path $MsysRoot "mingw64\bin\mlir-opt.exe"
}

$probe = [ordered]@{
  probed_at = (Get-Date).ToString("o")
  msys2_root = $MsysRoot
  mlir_opt = $MlirOpt
  msys2_root_exists = Test-Path -LiteralPath $MsysRoot
  mlir_opt_exists = Test-Path -LiteralPath $MlirOpt
  file = $null
  sha256 = $null
  powershell_direct = [ordered]@{ attempted = $false; exit_code = $null; stdout = ""; stderr = ""; error = "" }
  powershell_with_path = [ordered]@{ attempted = $false; exit_code = $null; stdout = ""; stderr = ""; error = "" }
  msys2_bash = [ordered]@{ attempted = $false; exit_code = $null; stdout = ""; stderr = ""; error = "" }
  final_status = "unavailable"
  requires_msys2_bash = $false
}

if ($probe.mlir_opt_exists) {
  $item = Get-Item -LiteralPath $MlirOpt
  $probe.file = [ordered]@{
    full_name = $item.FullName
    length = $item.Length
    last_write_time = $item.LastWriteTime.ToString("o")
  }
  try {
    $probe.sha256 = (Get-FileHash -LiteralPath $MlirOpt -Algorithm SHA256).Hash
  } catch {
    $probe.sha256 = $null
  }

  $probe.powershell_direct.attempted = $true
  try {
    $out = & $MlirOpt --version 2>&1
    $probe.powershell_direct.exit_code = $LASTEXITCODE
    $probe.powershell_direct.stdout = ($out | Out-String).Trim()
  } catch {
    $probe.powershell_direct.error = $_.Exception.Message
  }

  if ($probe.powershell_direct.exit_code -ne 0) {
    $probe.powershell_with_path.attempted = $true
    $oldPath = $env:PATH
    try {
      $env:PATH = (Join-Path $MsysRoot "mingw64\bin") + ";" + $env:PATH
      $out = & $MlirOpt --version 2>&1
      $probe.powershell_with_path.exit_code = $LASTEXITCODE
      $probe.powershell_with_path.stdout = ($out | Out-String).Trim()
    } catch {
      $probe.powershell_with_path.error = $_.Exception.Message
    } finally {
      $env:PATH = $oldPath
    }
  }

  $bash = Join-Path $MsysRoot "usr\bin\bash.exe"
  if (Test-Path -LiteralPath $bash) {
    $probe.msys2_bash.attempted = $true
    try {
      $out = & $bash -lc "/mingw64/bin/mlir-opt.exe --version" 2>&1
      $probe.msys2_bash.exit_code = $LASTEXITCODE
      $probe.msys2_bash.stdout = ($out | Out-String).Trim()
    } catch {
      $probe.msys2_bash.error = $_.Exception.Message
    }
  }
}

if ($probe.powershell_direct.exit_code -eq 0 -or $probe.powershell_with_path.exit_code -eq 0 -or $probe.msys2_bash.exit_code -eq 0) {
  $probe.final_status = "real available"
}
if (($probe.powershell_direct.exit_code -ne 0) -and ($probe.powershell_with_path.exit_code -ne 0) -and ($probe.msys2_bash.exit_code -eq 0)) {
  $probe.requires_msys2_bash = $true
}

New-Item -ItemType Directory -Force -Path (Split-Path $Output) | Out-Null
$probe | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $Output -Encoding UTF8
$probe | ConvertTo-Json -Depth 8
