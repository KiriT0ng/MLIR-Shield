from __future__ import annotations

import json
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from mlirdiff.model import RunRecord
from mlirdiff.signature import failure_signature, signature_excerpt


@dataclass(frozen=True)
class Candidate:
    signature: str
    records: list[RunRecord]

    @property
    def category(self) -> str:
        return self.records[0].category

    @property
    def priority(self) -> str:
        if self.category in {"memory/assertion", "timeout"}:
            return "P0"
        if self.category in {"unknown failure", "type legality", "verifier"}:
            return "P1"
        return "P2"


def main() -> int:
    discovery_path = Path(sys.argv[1]) if len(sys.argv) > 1 else ROOT / "outputs" / "discovery" / "report.json"
    data = read_json(discovery_path)
    candidates = candidates_from(data)
    out = ROOT / "docs" / "P0候选复核报告.md"
    out.write_text(render(candidates, discovery_path), encoding="utf-8")
    print(f"P0 candidates: {sum(1 for c in candidates if c.priority == 'P0')}")
    print(f"report: {out}")
    return 0


def candidates_from(data: dict) -> list[Candidate]:
    grouped: dict[str, list[RunRecord]] = {}
    for item in data.get("runs", []):
        if item.get("return_code") == 0 and not item.get("timed_out"):
            continue
        record = RunRecord(**item)
        grouped.setdefault(failure_signature(record), []).append(record)
    candidates = [Candidate(signature, records) for signature, records in grouped.items()]
    return sorted(candidates, key=lambda c: (c.priority, -len(c.records), c.signature))


def render(candidates: list[Candidate], discovery_path: Path) -> str:
    p0 = [candidate for candidate in candidates if candidate.priority == "P0"]
    lines = [
        "# P0 候选复核报告",
        "",
        f"- Source report: `{discovery_path}`",
        f"- P0 candidates: {len(p0)}",
        "",
        "P0 只保留 crash/assertion/timeout 一类高价值候选。下一步需要确认它们是否由无效 seed、版本不兼容、测试文件注释残留或真实 pass bug 导致。",
        "",
        "## 复核规则",
        "",
        "1. 先看 `parse_verify` 是否失败；如果基础解析失败，通常不是 pass 新问题。",
        "2. 如果只有某条 lowering/stress pipeline 崩溃，优先做最小化。",
        "3. 如果同一 seed 在多条 pipeline 崩溃，优先检查 seed 是否包含旧版 MLIR 不支持的语法。",
        "4. 最小化后仍稳定触发 `PLEASE submit a bug report`、`LLVM ERROR`、`Stack dump` 的，进入项目发现清单。",
        "",
    ]
    if not p0:
        lines.append("当前没有 P0 候选。")
        return "\n".join(lines)
    for candidate in p0:
        example = candidate.records[0]
        lines.extend(
            [
                f"## `{candidate.signature}`",
                "",
                f"- Count: {len(candidate.records)}",
                f"- Example seed: `{example.seed}`",
                f"- Example pipeline: `{example.pipeline}`",
                f"- Command: `{sanitize_command(example.command)}`",
                "- Suggested action: minimize and replay on VM.",
                "",
                "```text",
                signature_excerpt(example, limit=600),
                "```",
                "",
            ]
        )
    return "\n".join(lines)


def sanitize_command(command: str) -> str:
    return command.replace(str(ROOT), "<project>")


def read_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


if __name__ == "__main__":
    raise SystemExit(main())
