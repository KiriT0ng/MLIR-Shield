from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import time
from dataclasses import asdict, dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


@dataclass
class MojoBuildRecord:
    scenario: str
    source: str
    status: str
    mojo_version: str
    build_command: str
    return_code: int | None
    elapsed_ms: int
    llvm_ir_artifact: str
    source_sha256: str
    artifact_sha256: str
    stdout_excerpt: str
    stderr_excerpt: str
    note: str


def main() -> int:
    parser = argparse.ArgumentParser(description="Collect Mojo application build evidence.")
    parser.add_argument("--samples", default="apps/mojo/samples", help="Directory containing .mojo samples.")
    parser.add_argument("--artifacts", default="apps/mojo/artifacts", help="Directory for generated artifacts.")
    parser.add_argument("--manifest", default="apps/mojo/mojo_manifest.json", help="Manifest output path.")
    parser.add_argument("--use-wsl", action="store_true", help="Run Mojo through WSL.")
    parser.add_argument("--mojo", default="mojo", help="Mojo executable inside the selected environment.")
    args = parser.parse_args()

    sample_dir = (ROOT / args.samples).resolve()
    artifact_dir = (ROOT / args.artifacts).resolve()
    manifest_path = (ROOT / args.manifest).resolve()
    artifact_dir.mkdir(parents=True, exist_ok=True)
    manifest_path.parent.mkdir(parents=True, exist_ok=True)

    environment = check_environment(args.mojo, args.use_wsl)
    records = []
    for sample in sorted(sample_dir.glob("*.mojo")):
        records.append(collect_one(sample, artifact_dir, args.mojo, args.use_wsl, environment))

    payload = {
        "name": "MLIRShield-Mojo Application Bridge",
        "scope": "Mojo build evidence and MLIR Core profile bridge; not Mojo internal MLIR export.",
        "environment": environment,
        "records": [asdict(record) for record in records],
    }
    manifest_path.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Manifest: {manifest_path}")
    print(f"Records: {len(records)}")
    return 0 if records else 1


def check_environment(mojo: str, use_wsl: bool) -> dict:
    wsl_status = run_command(["wsl", "--status"], timeout=10)
    wsl_summary = summarize_command(wsl_status)
    if wsl_summary["return_code"] not in (0, "0"):
        wsl_summary["stdout_excerpt"] = "WSL unavailable on current host; Mojo build bridge is recorded as unavailable."
        wsl_summary["stderr_excerpt"] = ""
    command = ["wsl", mojo, "--version"] if use_wsl else [mojo, "--version"]
    mojo_status = run_command(command, timeout=20)
    available = mojo_status["return_code"] == 0
    mojo_text = first_text(mojo_status)
    return {
        "use_wsl": use_wsl,
        "wsl_status": wsl_summary,
        "mojo_command": " ".join(command),
        "mojo_available": available,
        "mojo_version": mojo_text if available else "",
        "mojo_error": "" if available else mojo_text,
    }


def collect_one(sample: Path, artifact_dir: Path, mojo: str, use_wsl: bool, environment: dict) -> MojoBuildRecord:
    scenario = sample.stem
    target = artifact_dir / f"{scenario}.ll"
    source_hash = sha256_file(sample)
    if not environment.get("mojo_available"):
        return MojoBuildRecord(
            scenario=scenario,
            source=rel(sample),
            status="unavailable",
            mojo_version=str(environment.get("mojo_version", "")),
            build_command=build_command_text(sample, target, mojo, use_wsl),
            return_code=None,
            elapsed_ms=0,
            llvm_ir_artifact="",
            source_sha256=source_hash,
            artifact_sha256="",
            stdout_excerpt="",
            stderr_excerpt=str(environment.get("mojo_error", ""))[:1200],
            note="Current host cannot run Mojo; bridge records source and environment evidence only.",
        )

    command = build_command(sample, target, mojo, use_wsl)
    started = time.perf_counter()
    result = run_command(command, timeout=60)
    elapsed_ms = int((time.perf_counter() - started) * 1000)
    artifact_hash = sha256_file(target) if target.exists() else ""
    status = "success" if result["return_code"] == 0 and target.exists() else "failed"
    return MojoBuildRecord(
        scenario=scenario,
        source=rel(sample),
        status=status,
        mojo_version=str(environment.get("mojo_version", "")),
        build_command=build_command_text(sample, target, mojo, use_wsl),
        return_code=result["return_code"],
        elapsed_ms=elapsed_ms,
        llvm_ir_artifact=rel(target) if target.exists() else "",
        source_sha256=source_hash,
        artifact_sha256=artifact_hash,
        stdout_excerpt=str(result["stdout"])[:1200],
        stderr_excerpt=str(result["stderr"])[:1200],
        note="LLVM IR artifact is a Mojo public build output, not Mojo internal MLIR.",
    )


def build_command(sample: Path, target: Path, mojo: str, use_wsl: bool) -> list[str]:
    # Mojo public CLI uses emit kinds such as llvm/llvm-bitcode/object/asm.
    inner = [mojo, "build", "--emit", "llvm", str(sample), "-o", str(target)]
    return ["wsl", *inner] if use_wsl else inner


def build_command_text(sample: Path, target: Path, mojo: str, use_wsl: bool) -> str:
    inner = [
        mojo,
        "build",
        "--emit",
        "llvm",
        rel(sample),
        "-o",
        rel(target),
    ]
    return " ".join(["wsl", *inner] if use_wsl else inner)


def run_command(command: list[str], timeout: int) -> dict:
    try:
        completed = subprocess.run(
            command,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            timeout=timeout,
            check=False,
        )
        return {
            "return_code": completed.returncode,
            "stdout": completed.stdout,
            "stderr": completed.stderr,
        }
    except FileNotFoundError:
        return {"return_code": None, "stdout": "", "stderr": f"executable not found: {command[0]}"}
    except Exception as exc:
        return {"return_code": None, "stdout": "", "stderr": exc.__class__.__name__}


def summarize_command(result: dict) -> dict:
    return {
        "return_code": result.get("return_code"),
        "stdout_excerpt": str(result.get("stdout", ""))[:800],
        "stderr_excerpt": str(result.get("stderr", ""))[:800],
    }


def first_text(result: dict) -> str:
    return (str(result.get("stdout", "")) or str(result.get("stderr", ""))).strip()[:1200]


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def rel(path: Path) -> str:
    try:
        return str(path.relative_to(ROOT)).replace("\\", "/")
    except ValueError:
        return str(path)


if __name__ == "__main__":
    raise SystemExit(main())
