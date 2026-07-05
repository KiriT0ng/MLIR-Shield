from __future__ import annotations

import shlex
import os
import shutil
import subprocess
import time
from dataclasses import dataclass, field
from pathlib import Path

from .classifier import classify_run
from .config import Pipeline
from .diffing import analyze_runs
from .model import RunRecord, SuiteResult

MAX_CAPTURE_BYTES = 256 * 1024


@dataclass(frozen=True)
class RunOptions:
    seed_dir: Path
    out_dir: Path
    mlir_opt: str
    timeout_seconds: float
    mock: bool = False
    ssh_host: str = ""
    ssh_user: str = ""
    remote_mlir_opt: str = "mlir-opt"
    env: dict[str, str] = field(default_factory=dict)


def run_suite(pipelines: list[Pipeline], options: RunOptions) -> SuiteResult:
    seeds = sorted(options.seed_dir.glob("**/*.mlir"))
    if not seeds:
        raise FileNotFoundError(f"No .mlir seed files found in {options.seed_dir}")

    options.out_dir.mkdir(parents=True, exist_ok=True)
    artifact_dir = options.out_dir / "artifacts"
    artifact_dir.mkdir(parents=True, exist_ok=True)

    mlir_opt_cmd = _mlir_opt_command(options.mlir_opt)
    if (
        not options.mock
        and not options.ssh_host
        and shutil.which(mlir_opt_cmd[0]) is None
        and not Path(mlir_opt_cmd[0]).exists()
    ):
        raise FileNotFoundError(
            f"Cannot find '{options.mlir_opt}'. Install LLVM/MLIR or rerun with --mock."
        )

    runs: list[RunRecord] = []
    for seed in seeds:
        for pipeline in pipelines:
            record = _run_one(seed, pipeline, options, artifact_dir)
            runs.append(record)

    issues = analyze_runs(runs)
    return SuiteResult(
        seeds=[str(seed) for seed in seeds],
        pipelines=[pipeline.name for pipeline in pipelines],
        runs=runs,
        issues=issues,
    )


def _run_one(
    seed: Path,
    pipeline: Pipeline,
    options: RunOptions,
    artifact_dir: Path,
) -> RunRecord:
    start = time.perf_counter()
    if options.mock:
        stdout, stderr, return_code, timed_out = _mock_execute(seed, pipeline)
    elif options.ssh_host:
        stdout, stderr, return_code, timed_out = _execute_ssh_mlir_opt(seed, pipeline, options)
    else:
        stdout, stderr, return_code, timed_out = _execute_mlir_opt(seed, pipeline, options)
    elapsed_ms = int((time.perf_counter() - start) * 1000)

    safe_name = _safe_artifact_name(seed, pipeline, options.seed_dir)
    stdout_path = artifact_dir / f"{safe_name}.stdout.mlir"
    stderr_path = artifact_dir / f"{safe_name}.stderr.txt"
    stdout_path.write_text(stdout, encoding="utf-8")
    stderr_path.write_text(stderr, encoding="utf-8")

    record = RunRecord(
        seed=_display_seed(seed, options.seed_dir),
        pipeline=pipeline.name,
        command=_command_text(seed, pipeline, options),
        return_code=return_code,
        timed_out=timed_out,
        elapsed_ms=elapsed_ms,
        stdout=stdout,
        stderr=stderr,
        stdout_path=str(stdout_path),
        stderr_path=str(stderr_path),
        category="",
    )
    record.category = classify_run(record)
    return record


def _execute_mlir_opt(
    seed: Path,
    pipeline: Pipeline,
    options: RunOptions,
) -> tuple[str, str, int, bool]:
    base_cmd = _mlir_opt_command(options.mlir_opt)
    if _is_stdin_runner(base_cmd):
        cmd = [*base_cmd, *pipeline.args, "-o", "-"]
        source = seed.read_text(encoding="utf-8")
    else:
        cmd = [*base_cmd, str(seed), *pipeline.args, "-o", "-"]
        source = None
    try:
        completed = subprocess.run(
            cmd,
            input=source,
            capture_output=True,
            text=True,
            timeout=options.timeout_seconds,
            check=False,
            env={**os.environ, **options.env} if options.env else None,
        )
        return _limit_output(completed.stdout, "stdout"), _limit_output(completed.stderr, "stderr"), completed.returncode, False
    except subprocess.TimeoutExpired as exc:
        return _limit_output(exc.stdout or "", "stdout"), _limit_output(exc.stderr or "", "stderr"), 124, True


def _execute_ssh_mlir_opt(
    seed: Path,
    pipeline: Pipeline,
    options: RunOptions,
) -> tuple[str, str, int, bool]:
    remote_cmd = " ".join(
        shlex.quote(arg)
        for arg in [options.remote_mlir_opt, *pipeline.args, "-o", "-"]
    )
    cmd = ["ssh", f"{options.ssh_user}@{options.ssh_host}", remote_cmd]
    source = seed.read_text(encoding="utf-8")
    try:
        completed = subprocess.run(
            cmd,
            input=source,
            capture_output=True,
            text=True,
            timeout=options.timeout_seconds,
            check=False,
        )
        return _limit_output(completed.stdout, "stdout"), _limit_output(completed.stderr, "stderr"), completed.returncode, False
    except subprocess.TimeoutExpired as exc:
        return _limit_output(exc.stdout or "", "stdout"), _limit_output(exc.stderr or "", "stderr"), 124, True


def _mock_execute(seed: Path, pipeline: Pipeline) -> tuple[str, str, int, bool]:
    source = seed.read_text(encoding="utf-8")
    marker = _mock_marker(source)
    if pipeline.name.startswith("mock_parser") and marker == "parser":
        return "", "mock parser error: expected operation name before end of file", 1, False
    if pipeline.name.startswith("mock_dialect") and marker == "dialect":
        return "", "mock error: unknown dialect 'demo_unregistered'", 1, False
    if pipeline.name.startswith("mock_type") and marker == "type":
        return "", "mock error: failed to legalize operation due to illegal type", 1, False
    if pipeline.name.startswith("mock_assertion") and marker == "assertion":
        return "", "mock crash: Assertion failed\nStack dump:\n0. Program arguments: mlir-opt", 134, False
    if pipeline.name.startswith("mock_verifier") and marker == "verifier":
        return "", "mock verifier failure: operation has invalid type", 1, False
    if "mock_fail" in pipeline.name:
        return "", "mock verifier failure: operation has invalid type", 1, False
    return source, "", 0, False


def _command_text(seed: Path, pipeline: Pipeline, options: RunOptions) -> str:
    args = " ".join(pipeline.args)
    if options.mock:
        return f"mock-mlir-opt {seed} {args} -o -".strip()
    if _is_stdin_runner(_mlir_opt_command(options.mlir_opt)):
        return f"{options.mlir_opt} {args} -o - < {seed}".strip()
    if options.ssh_host:
        return f"ssh {options.ssh_user}@{options.ssh_host} {options.remote_mlir_opt} < {seed} {args} -o -".strip()
    return f"{options.mlir_opt} {seed} {args} -o -".strip()


def _mlir_opt_command(mlir_opt: str) -> list[str]:
    if Path(mlir_opt).exists():
        return [mlir_opt]
    if " " in mlir_opt:
        return [part.strip('"') for part in shlex.split(mlir_opt, posix=False)]
    return [mlir_opt]


def _is_stdin_runner(command: list[str]) -> bool:
    return bool(command)


def _mock_marker(source: str) -> str:
    for line in source.splitlines()[:5]:
        stripped = line.strip()
        prefix = "// mlirdiff-mock:"
        if stripped.startswith(prefix):
            return stripped[len(prefix):].strip()
    return ""


def _safe_artifact_name(seed: Path, pipeline: Pipeline, seed_dir: Path) -> str:
    try:
        relative = seed.relative_to(seed_dir)
    except ValueError:
        relative = Path(seed.name)
    raw = f"{relative.with_suffix('')}__{pipeline.name}"
    for char in ("\\", "/", ":", " ", ".", "\t"):
        raw = raw.replace(char, "_")
    return raw


def _display_seed(seed: Path, seed_dir: Path) -> str:
    parts = seed_dir.parts
    if "seeds" in parts:
        seeds_index = parts.index("seeds")
        root = Path(*parts[:seeds_index]) if seeds_index else Path(".")
        try:
            return str(seed.relative_to(root))
        except ValueError:
            pass
    try:
        relative = seed.relative_to(seed_dir)
    except ValueError:
        return str(seed)
    return str(Path("seeds") / relative)


def _limit_output(text: str, stream_name: str) -> str:
    data = text.encode("utf-8", errors="replace")
    if len(data) <= MAX_CAPTURE_BYTES:
        return text
    head = data[: MAX_CAPTURE_BYTES // 2].decode("utf-8", errors="replace")
    tail = data[-MAX_CAPTURE_BYTES // 2 :].decode("utf-8", errors="replace")
    omitted = len(data) - MAX_CAPTURE_BYTES
    return (
        f"{head}\n\n[mlirdiff: {stream_name} truncated, omitted {omitted} bytes]\n\n{tail}"
    )
