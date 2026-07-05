from __future__ import annotations

import argparse
import json
import os
import sys
import time
from dataclasses import dataclass
from pathlib import Path

import paramiko


ROOT = Path(__file__).resolve().parents[1]


@dataclass(frozen=True)
class Variant:
    name: str
    kind: str
    expectation: str
    source: str


VARIANTS = [
    Variant(
        name="v01_return_nested_empty_region",
        kind="returned-parent / unknown nested empty region",
        expectation="If this crashes, the public no-terminator condition is not required.",
        source="""module {
  func.func @f() {
    "a.b"() ({
    }) : () -> ()
    return
  }
}
""",
    ),
    Variant(
        name="v02_return_nested_plain_op",
        kind="returned-parent / unknown nested plain op",
        expectation="Project-discovered ORIG-CAND-001 minimal candidate.",
        source="""module {
  func.func @f() {
    "a.b"() ({
      "a.t"() : () -> ()
    }) : () -> ()
    return
  }
}
""",
    ),
    Variant(
        name="v03_return_nested_two_ops",
        kind="returned-parent / unknown nested two ops",
        expectation="Checks whether crash generalizes beyond one nested operation.",
        source="""module {
  func.func @f() {
    "a.b"() ({
      "a.t0"() : () -> ()
      "a.t1"() : () -> ()
    }) : () -> ()
    return
  }
}
""",
    ),
    Variant(
        name="v04_return_nested_symbol_attr",
        kind="returned-parent / unknown nested symbol attribute",
        expectation="Checks symbol-use walking under a returned parent function.",
        source="""module {
  func.func @f() {
    "a.b"() ({
      "a.t"() {callee = @f} : () -> ()
    }) : () -> ()
    return
  }
}
""",
    ),
    Variant(
        name="v05_module_level_graph_region",
        kind="module-level unknown region",
        expectation="Control for function-specific behavior.",
        source="""module {
  "a.b"() ({
    "a.t"() : () -> ()
  }) : () -> ()
}
""",
    ),
    Variant(
        name="v06_public_no_return_empty_region",
        kind="public-like baseline",
        expectation="Matches the public #197960 shape: function has no terminator.",
        source="""module {
  func.func @f() {
    "a.b"() ({
    }) : () -> ()
  }
}
""",
    ),
    Variant(
        name="v07_registered_scf_if_return",
        kind="registered-region control",
        expectation="Registered structured region should not trigger this crash.",
        source="""module {
  func.func @f(%arg0: i1) {
    scf.if %arg0 {
      func.call @g() : () -> ()
    }
    return
  }
  func.func @g() {
    return
  }
}
""",
    ),
    Variant(
        name="v08_registered_scf_call_return",
        kind="registered-call control",
        expectation="Registered call graph should be analyzable by inliner.",
        source="""module {
  func.func @f() {
    func.call @g() : () -> ()
    return
  }
  func.func @g() {
    return
  }
}
""",
    ),
    Variant(
        name="v09_return_unknown_no_region",
        kind="returned-parent / unknown op without region",
        expectation="Unknown op without a region should not be enough to crash.",
        source="""module {
  func.func @f() {
    "a.b"() : () -> ()
    return
  }
}
""",
    ),
    Variant(
        name="v10_return_nested_multi_region",
        kind="returned-parent / unknown op with two regions",
        expectation="Checks whether multiple unknown nested regions keep the same failure mode.",
        source="""module {
  func.func @f() {
    "a.b"() ({
      "a.t0"() : () -> ()
    }, {
      "a.t1"() : () -> ()
    }) : () -> ()
    return
  }
}
""",
    ),
]

PIPELINES = [
    ("parse_only", ["--allow-unregistered-dialect"]),
    ("inline", ["--allow-unregistered-dialect", "--inline"]),
]


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Verify ORIG-CAND-001 variant matrix on remote MLIR 23.")
    parser.add_argument("--out", default="outputs/orig001_variants")
    parser.add_argument("--seeds", default="seeds/orig001_variants")
    parser.add_argument("--case-timeout", type=int, default=10)
    parser.add_argument("--remote-mlir-opt", default=os.environ.get("REMOTE_MLIR_OPT", "mlir-opt-23"))
    parser.add_argument("--host", default=os.environ.get("MLIR_SSH_HOST", "192.168.54.128"))
    parser.add_argument("--user", default=os.environ.get("MLIR_SSH_USER", "toby"))
    parser.add_argument("--password-env", default="MLIR_SSH_PASSWORD")
    args = parser.parse_args(argv)

    password = os.environ.get(args.password_env)
    if not password:
        print(f"missing password env var: {args.password_env}", file=sys.stderr)
        return 2

    seed_dir = ROOT / args.seeds
    out_dir = ROOT / args.out
    artifacts = out_dir / "artifacts"
    seed_dir.mkdir(parents=True, exist_ok=True)
    artifacts.mkdir(parents=True, exist_ok=True)

    for variant in VARIANTS:
        (seed_dir / f"{variant.name}.mlir").write_text(variant.source, encoding="utf-8")

    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(args.host, username=args.user, password=password, timeout=10)
    rows = []
    try:
        for variant in VARIANTS:
            for pipeline_name, pipeline_args in PIPELINES:
                result = run_remote(client, args.remote_mlir_opt, pipeline_args, variant.source, args.case_timeout)
                row = {
                    "variant": variant.name,
                    "kind": variant.kind,
                    "expectation": variant.expectation,
                    "pipeline": pipeline_name,
                    "args": pipeline_args,
                    "return_code": result["return_code"],
                    "category": classify(result),
                    "elapsed_ms": result["elapsed_ms"],
                    "stderr_excerpt": result["stderr"][:1800],
                }
                rows.append(row)
                stem = f"{variant.name}__{pipeline_name}"
                (artifacts / f"{stem}.stdout.mlir").write_text(result["stdout"], encoding="utf-8")
                (artifacts / f"{stem}.stderr.txt").write_text(result["stderr"], encoding="utf-8")
    finally:
        client.close()

    report = {
        "tool": args.remote_mlir_opt,
        "variant_count": len(VARIANTS),
        "pipelines": [name for name, _ in PIPELINES],
        "runs": rows,
        "summary": summarize(rows),
    }
    out_dir.mkdir(parents=True, exist_ok=True)
    (out_dir / "report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    (out_dir / "report.md").write_text(render_markdown(report), encoding="utf-8")
    (out_dir / "report.html").write_text(render_html(report), encoding="utf-8")
    print(f"variants: {len(VARIANTS)}")
    print(f"runs: {len(rows)}")
    print(f"hard inline failures: {report['summary']['inline_hard_failures']}")
    print(f"report: {out_dir / 'report.md'}")
    return 0


def run_remote(client: paramiko.SSHClient, mlir_opt: str, args: list[str], source: str, timeout_seconds: int) -> dict:
    inner = " ".join([quote(mlir_opt), *(quote(arg) for arg in args), "-o", "-"])
    command = f"timeout {timeout_seconds}s {inner}"
    start = time.perf_counter()
    stdin, stdout, stderr = client.exec_command(command, timeout=None)
    stdin.write(source)
    stdin.channel.shutdown_write()
    out = stdout.read().decode("utf-8", errors="replace")
    err = stderr.read().decode("utf-8", errors="replace")
    code = stdout.channel.recv_exit_status()
    return {"stdout": out, "stderr": err, "return_code": code, "elapsed_ms": int((time.perf_counter() - start) * 1000)}


def classify(result: dict) -> str:
    if result["return_code"] == 0:
        return "success"
    if result["return_code"] == 124:
        return "timeout"
    text = (result["stdout"] + "\n" + result["stderr"]).lower()
    if any(marker in text for marker in ["assertion failed", "stack dump", "segmentation fault", "please submit a bug report", "llvm error", "aborted"]):
        return "memory/assertion"
    if "error:" in text or "expected" in text:
        return "parser/verifier"
    return "unknown failure"


def summarize(rows: list[dict]) -> dict:
    counts: dict[str, int] = {}
    for row in rows:
        key = f"{row['pipeline']}:{row['category']}"
        counts[key] = counts.get(key, 0) + 1
    inline_hard = [
        row["variant"]
        for row in rows
        if row["pipeline"] == "inline" and row["category"] in {"memory/assertion", "timeout"}
    ]
    parse_failures = [
        row["variant"]
        for row in rows
        if row["pipeline"] == "parse_only" and row["category"] != "success"
    ]
    return {
        "category_counts": counts,
        "inline_hard_failures": inline_hard,
        "parse_failures": parse_failures,
    }


def render_markdown(report: dict) -> str:
    lines = [
        "# ORIG-CAND-001 Variant Matrix",
        "",
        f"- Tool: `{report['tool']}`",
        f"- Variants: {report['variant_count']}",
        f"- Runs: {len(report['runs'])}",
        "",
        "| Variant | Kind | Parse | Inline | Interpretation |",
        "| --- | --- | --- | --- | --- |",
    ]
    by_variant: dict[str, dict[str, dict]] = {}
    for row in report["runs"]:
        by_variant.setdefault(row["variant"], {})[row["pipeline"]] = row
    for variant in VARIANTS:
        parse = by_variant.get(variant.name, {}).get("parse_only", {})
        inline = by_variant.get(variant.name, {}).get("inline", {})
        lines.append(
            "| "
            + " | ".join(
                [
                    f"`{variant.name}`",
                    variant.kind,
                    parse.get("category", "missing"),
                    inline.get("category", "missing"),
                    variant.expectation,
                ]
            )
            + " |"
        )
    lines.extend(["", "## Hard Inline Failures", ""])
    hard = report["summary"]["inline_hard_failures"]
    if hard:
        for name in hard:
            row = by_variant[name]["inline"]
            lines.extend([f"### `{name}`", "", "```text", row["stderr_excerpt"], "```", ""])
    else:
        lines.append("No hard inline failures.")
    return "\n".join(lines)


def render_html(report: dict) -> str:
    md = render_markdown(report)
    escaped = (
        md.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
    )
    return f"""<!doctype html>
<html lang=\"zh-CN\">
<meta charset=\"utf-8\">
<title>ORIG-CAND-001 Variant Matrix</title>
<style>
body {{ font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", sans-serif; margin: 32px; color: #172033; }}
pre {{ background: #f4f6f8; padding: 14px; overflow: auto; border-radius: 6px; }}
</style>
<pre>{escaped}</pre>
</html>
"""


def quote(value: str) -> str:
    if all(ch.isalnum() or ch in "-_./:=,()" for ch in value):
        return value
    return "'" + value.replace("'", "'\"'\"'") + "'"


if __name__ == "__main__":
    raise SystemExit(main())
