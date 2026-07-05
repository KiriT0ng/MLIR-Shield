from __future__ import annotations

import argparse
import os
import sys

import paramiko


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Run remote mlir-opt over SSH.")
    parser.add_argument("--host", default=os.environ.get("MLIR_SSH_HOST", "192.168.54.128"))
    parser.add_argument("--user", default=os.environ.get("MLIR_SSH_USER", "toby"))
    parser.add_argument("--password-env", default="MLIR_SSH_PASSWORD")
    parser.add_argument("--remote-mlir-opt", default=os.environ.get("REMOTE_MLIR_OPT", "mlir-opt-15"))
    args, mlir_args = parser.parse_known_args(argv)

    password = os.environ.get(args.password_env)
    if not password:
        print(f"missing password env var: {args.password_env}", file=sys.stderr)
        return 2

    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(args.host, username=args.user, password=password, timeout=10)

    remote_args = " ".join(_quote(arg) for arg in mlir_args)
    command = f"{_quote(args.remote_mlir_opt)} {remote_args}".strip()
    stdin, stdout, stderr = client.exec_command(command, timeout=None)
    stdin.write(sys.stdin.read())
    stdin.channel.shutdown_write()

    out = stdout.read().decode("utf-8", errors="replace")
    err = stderr.read().decode("utf-8", errors="replace")
    sys.stdout.write(out)
    sys.stderr.write(err)
    code = stdout.channel.recv_exit_status()
    client.close()
    return code


def _quote(value: str) -> str:
    if not value:
        return "''"
    if all(ch.isalnum() or ch in "-_./:=," for ch in value):
        return value
    return "'" + value.replace("'", "'\"'\"'") + "'"


if __name__ == "__main__":
    raise SystemExit(main())
