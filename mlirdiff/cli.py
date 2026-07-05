import argparse
import os
from pathlib import Path

from .config import load_pipelines
from .engine import RunOptions, run_suite
from .report import write_html_report, write_json_report, write_markdown_report


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="MLIR pass pipeline differential consistency and safety checker."
    )
    parser.add_argument(
        "--seeds",
        default="seeds",
        help="Directory containing .mlir seed files.",
    )
    parser.add_argument(
        "--pipelines",
        default="configs/pipelines.json",
        help="Pipeline config JSON file.",
    )
    parser.add_argument(
        "--out",
        default="outputs/latest",
        help="Output directory for run artifacts and reports.",
    )
    parser.add_argument(
        "--mlir-opt",
        default=os.environ.get("MLIR_OPT", "mlir-opt"),
        help="Path to mlir-opt executable. Can also be set with MLIR_OPT.",
    )
    parser.add_argument(
        "--timeout",
        type=float,
        default=15.0,
        help="Per pipeline timeout in seconds.",
    )
    parser.add_argument(
        "--mock",
        action="store_true",
        help="Use an internal mock executor when mlir-opt is not installed.",
    )
    parser.add_argument(
        "--ssh-host",
        default="",
        help="Run mlir-opt over SSH by streaming each seed to remote stdin.",
    )
    parser.add_argument(
        "--ssh-user",
        default="toby",
        help="SSH username for --ssh-host.",
    )
    parser.add_argument(
        "--remote-mlir-opt",
        default="mlir-opt",
        help="Remote mlir-opt command for --ssh-host, for example mlir-opt-15.",
    )
    parser.add_argument(
        "--demo",
        action="store_true",
        help="Run a built-in demo config that shows a pipeline divergence report.",
    )
    parser.add_argument(
        "--issues",
        action="store_true",
        help="Run the curated LLVM issue reproducer seed set with issue-specific pipelines.",
    )
    parser.add_argument(
        "--discover",
        action="store_true",
        help="Run broader stress pipelines intended to find new candidate failures.",
    )
    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    seed_dir = Path(args.seeds)
    pipeline_file = Path(args.pipelines)
    out_dir = Path(args.out)
    if args.demo:
        pipeline_file = Path("configs/pipelines_demo.json")
        if args.out == "outputs/latest":
            out_dir = Path("outputs/demo")
    if args.issues:
        seed_dir = Path("seeds/issue_repros")
        pipeline_file = Path("configs/pipelines_issue_repros.json")
        if args.out == "outputs/latest":
            out_dir = Path("outputs/issues")
    if args.discover:
        pipeline_file = Path("configs/pipelines_discovery.json")
        if args.out == "outputs/latest":
            out_dir = Path("outputs/discovery")
    mock = True if args.demo else args.mock

    try:
        pipelines = load_pipelines(pipeline_file)
        options = RunOptions(
            seed_dir=seed_dir,
            out_dir=out_dir,
            mlir_opt=args.mlir_opt,
            timeout_seconds=args.timeout,
            mock=mock,
            ssh_host=args.ssh_host,
            ssh_user=args.ssh_user,
            remote_mlir_opt=args.remote_mlir_opt,
        )
        result = run_suite(pipelines, options)
    except (FileNotFoundError, ValueError) as exc:
        print(f"error: {exc}")
        return 2

    write_json_report(result, out_dir / "report.json")
    write_markdown_report(result, out_dir / "report.md")
    write_html_report(result, out_dir / "report.html")

    print(f"Seeds: {len(result.seeds)}")
    print(f"Pipelines: {len(result.pipelines)}")
    print(f"Runs: {len(result.runs)}")
    print(f"Issues: {len(result.issues)}")
    for issue in result.issues:
        print(f"- [{issue.severity}] {issue.kind}: {issue.seed}")
    print(f"Report: {out_dir / 'report.html'}")
    if args.demo:
        return 0
    return 1 if any(issue.severity == "high" for issue in result.issues) else 0
