$ErrorActionPreference = "Stop"

$python = "python"
if (Test-Path "C:\Users\lenovo\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe") {
    $python = "C:\Users\lenovo\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
}

& $python run.py --mock
