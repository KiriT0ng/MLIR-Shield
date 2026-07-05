param(
  [int]$Port = 8765,
  [switch]$SkipSelfCheck,
  [switch]$UseSsh
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root

function Find-Python {
  $candidates = @(
    "python",
    "py",
    "$env:USERPROFILE\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
  )
  foreach ($candidate in $candidates) {
    try {
      $cmd = Get-Command $candidate -ErrorAction Stop
      return $cmd.Source
    } catch {
      continue
    }
  }
  throw "Python was not found. Install Python or use the bundled Codex Python runtime."
}

function Test-Http {
  param([string]$Url)
  try {
    $response = Invoke-WebRequest -UseBasicParsing $Url -TimeoutSec 3
    return $response.StatusCode -eq 200
  } catch {
    return $false
  }
}

function Test-Tcp {
  param([string]$HostName, [int]$TcpPort)
  try {
    $client = New-Object System.Net.Sockets.TcpClient
    $iar = $client.BeginConnect($HostName, $TcpPort, $null, $null)
    $ok = $iar.AsyncWaitHandle.WaitOne(800, $false)
    if ($ok) {
      $client.EndConnect($iar)
    }
    $client.Close()
    return $ok
  } catch {
    return $false
  }
}

$Python = Find-Python
$Dashboard = "http://127.0.0.1:{0}/" -f $Port

Write-Host "== MLIR safety demo entry =="
Write-Host "Project root: $Root"
Write-Host "Python: $Python"
Write-Host "First-time guide: GETTING_STARTED.md"

$required = @(
  "README.md",
  "web\server.py",
  "web\index.html",
  "docs\ORIG-CAND-001_github_comment.md",
  "outputs\current_validation\min004_current_validation.json",
  "outputs\orig001_variants\report.html"
)

$missing = @()
foreach ($item in $required) {
  if (-not (Test-Path -LiteralPath (Join-Path $Root $item))) {
    $missing += $item
  }
}

if ($missing.Count -gt 0) {
  Write-Host "Missing required files:" -ForegroundColor Red
  $missing | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
  exit 1
}

if (-not (Test-Http "$Dashboard/api/status")) {
  Write-Host "Starting dashboard: $Dashboard"
  Start-Process -FilePath $Python -ArgumentList @("web\server.py", "$Port") -WorkingDirectory $Root -WindowStyle Hidden
  Start-Sleep -Seconds 2
}

if (Test-Http "$Dashboard/api/status") {
  Write-Host "Dashboard ready: $Dashboard" -ForegroundColor Green
} else {
  Write-Host "Dashboard failed to start. Try manually: $Python web\server.py $Port" -ForegroundColor Red
  exit 1
}

$localMlirOpt = $env:MLIR_OPT
if (-not $localMlirOpt) {
  $cmd = Get-Command "mlir-opt" -ErrorAction SilentlyContinue
  if ($cmd) { $localMlirOpt = $cmd.Source }
}
if ($localMlirOpt) {
  Write-Host "Local mlir-opt: $localMlirOpt" -ForegroundColor Green
} else {
  Write-Host "Local mlir-opt: not configured. Set MLIR_OPT for real local analysis; the dashboard can still browse saved evidence." -ForegroundColor Yellow
}

$sshRequested = $UseSsh -or $env:MLIRSHIELD_USE_SSH -eq "1"
if ($sshRequested) {
  $sshHost = if ($env:MLIR_SSH_HOST) { $env:MLIR_SSH_HOST } else { "192.168.54.128" }
  $vmSsh = Test-Tcp $sshHost 22
  if ($vmSsh) {
    Write-Host "Optional SSH runner: reachable at ${sshHost}:22" -ForegroundColor Green
  } else {
    Write-Host "Optional SSH runner: not reachable at ${sshHost}:22. Local mlir-opt mode is unaffected." -ForegroundColor Yellow
  }
} else {
  Write-Host "Optional SSH runner: disabled. Use -UseSsh or MLIRSHIELD_USE_SSH=1 only when you need the legacy remote runner."
}

if (-not $SkipSelfCheck) {
  Write-Host "Running final self-check..."
  & $Python scripts\final_check.py --web $Dashboard
  if ($LASTEXITCODE -ne 0) {
    Write-Host "Final self-check failed." -ForegroundColor Red
    exit $LASTEXITCODE
  }
}

Write-Host ""
Write-Host "Suggested review path:"
Write-Host "1. $Dashboard"
Write-Host "2. GETTING_STARTED.md"
Write-Host "3. docs: version status matrix"
Write-Host "4. docs: MIN-004 report"
Write-Host "5. docs: ORIG-CAND-001 GitHub comment"

Start-Process $Dashboard
