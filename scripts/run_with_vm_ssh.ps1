param(
    [string]$HostName = "192.168.54.128",
    [string]$User = "toby",
    [string]$Password = "",
    [string]$RemoteMlirOpt = "mlir-opt-15"
)

$ErrorActionPreference = "Stop"
if (-not $Password) {
    $secure = Read-Host "VM password" -AsSecureString
    $bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
    try {
        $Password = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
    } finally {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)
    }
}

$env:MLIR_SSH_HOST = $HostName
$env:MLIR_SSH_USER = $User
$env:MLIR_SSH_PASSWORD = $Password
$env:REMOTE_MLIR_OPT = $RemoteMlirOpt

$pythonCandidates = @(
    "python",
    "py",
    "$env:USERPROFILE\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
)
$python = $null
foreach ($candidate in $pythonCandidates) {
    try {
        $cmd = Get-Command $candidate -ErrorAction Stop
        $python = $cmd.Source
        break
    } catch {
        if (Test-Path -LiteralPath $candidate) {
            $python = $candidate
            break
        }
    }
}
if (-not $python) {
    throw "Python was not found. Install Python or use the bundled Codex runtime."
}

& $python run.py --issues --mlir-opt "$python scripts/ssh_mlir_opt.py" --timeout 45
