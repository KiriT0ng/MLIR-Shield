from __future__ import annotations

import argparse
import os
import shlex
import sys

import paramiko


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Run a shell command in the Ubuntu VM over SSH.")
    parser.add_argument("command", help="Remote shell command to execute.")
    parser.add_argument("--host", default=os.environ.get("MLIR_SSH_HOST", "192.168.54.128"))
    parser.add_argument("--user", default=os.environ.get("MLIR_SSH_USER", "toby"))
    parser.add_argument("--password-env", default="MLIR_SSH_PASSWORD")
    parser.add_argument("--timeout", type=float, default=600.0)
    parser.add_argument(
        "--sudo",
        action="store_true",
        help="Run the command through sudo -S using the same password env var. The password is not written to disk.",
    )
    args = parser.parse_args(argv)

    password = os.environ.get(args.password_env)
    if not password:
        print(f"missing password env var: {args.password_env}", file=sys.stderr)
        return 2

    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(args.host, username=args.user, password=password, timeout=10)
    command = args.command
    if args.sudo:
        command = f"sudo -S -p '' sh -lc {shlex.quote(args.command)}"
    stdin, stdout, stderr = client.exec_command(command, timeout=args.timeout)
    if args.sudo:
        stdin.write(password + "\n")
        stdin.flush()
    stdin.channel.shutdown_write()
    out = stdout.read().decode("utf-8", errors="replace")
    err = stderr.read().decode("utf-8", errors="replace")
    sys.stdout.write(out)
    sys.stderr.write(err)
    code = stdout.channel.recv_exit_status()
    client.close()
    return code


if __name__ == "__main__":
    raise SystemExit(main())
