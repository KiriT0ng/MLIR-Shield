from __future__ import annotations

import sys
from pathlib import Path


def read_source(argv: list[str]) -> str:
    for arg in argv:
        if arg.startswith("-"):
            continue
        path = Path(arg)
        if path.exists() and path.is_file():
            return path.read_text(encoding="utf-8")
    return sys.stdin.read()


def main(argv: list[str] | None = None) -> int:
    argv = list(sys.argv[1:] if argv is None else argv)
    if "--version" in argv:
        print("MLIRShield demo runner 1.0 (UI flow only, not a real LLVM toolchain)")
        return 0
    source = read_source(argv)
    stripped = source.strip()

    # This runner is intentionally small and labeled for demonstration only.
    # It lets the user portal be exercised on machines without LLVM installed.
    if "// mlirshield-demo: assertion" in source:
        print("demo runner: Assertion failed in simulated MLIR pass", file=sys.stderr)
        print("Stack dump:", file=sys.stderr)
        print("0. Program arguments: user_demo_mlir_opt", file=sys.stderr)
        return 134
    if "// mlirshield-demo: dialect" in source:
        print("demo runner: operation being parsed with an unregistered dialect", file=sys.stderr)
        return 1
    if not stripped or "func.func" not in source:
        print("<stdin>:1:1: error: expected MLIR function operation", file=sys.stderr)
        return 1
    if stripped.count("{") != stripped.count("}"):
        print("<stdin>:1:1: error: expected '}' before end of file", file=sys.stderr)
        return 1

    if "--canonicalize" in argv or "--cse" in argv or "--sccp" in argv:
        print("// demo runner normalized output")
    print(source.rstrip())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
