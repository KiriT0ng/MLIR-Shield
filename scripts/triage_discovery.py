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
        return self.records[0].category if self.records else "unknown failure"

    @property
    def priority(self) -> str:
        if self.category in {"memory/assertion", "timeout"}:
            return "P0"
        if self.category in {"unknown failure", "type legality", "verifier"}:
            return "P1"
        if self.category in {"dialect registration", "parser"}:
            return "P2"
        return "P2"

    @property
    def rationale(self) -> str:
        if self.priority == "P0":
            return "High-value candidate: may crash or hang the compiler process."
        if self.priority == "P1":
            return "Needs manual triage: may be a transformation/lowering failure or version gap."
        return "Compatibility triage first: often caused by unsupported dialects or newer MLIR syntax."


def main() -> int:
    discovery_path = ROOT / "outputs" / "discovery" / "report.json"
    if len(sys.argv) > 1:
        discovery_path = Path(sys.argv[1])
    known = known_signatures(ROOT / "outputs" / "issues" / "report.json")
    discovery = read_json(discovery_path)
    grouped: dict[str, list[RunRecord]] = {}
    for run in discovery.get("runs", []):
        if run.get("return_code") == 0 and not run.get("timed_out"):
            continue
        record = RunRecord(**run)
        sig = failure_signature(record)
        if sig in known:
            continue
        grouped.setdefault(sig, []).append(record)

    candidates = [Candidate(sig, records) for sig, records in grouped.items()]
    out = ROOT / "docs" / "新问题候选.md"
    out.write_text(render(candidates, discovery_path), encoding="utf-8")
    counts = priority_counts(candidates)
    print(f"candidate signatures: {len(candidates)}")
    print(f"priority counts: {counts}")
    print(f"report: {out}")
    return 0


def known_signatures(path: Path) -> set[str]:
    known = set()
    data = read_json(path)
    for run in data.get("runs", []):
        if run.get("return_code") == 0 and not run.get("timed_out"):
            continue
        known.add(failure_signature(RunRecord(**run)))
    return known


def render(candidates: list[Candidate], discovery_path: Path) -> str:
    ordered = sorted(
        candidates,
        key=lambda item: (item.priority, -len(item.records), item.signature),
    )
    lines = [
        "# 新问题候选",
        "",
        f"- Discovery report: `{discovery_path}`",
        f"- Candidate signatures: {len(candidates)}",
        f"- Priority counts: {priority_counts(candidates)}",
        "",
        "这些 signature 不在当前 `outputs/issues/report.json` 的已知 issue signature 中。P0 优先复核，P2 先判断是否为版本或语法兼容问题。",
        "",
    ]
    if not ordered:
        lines.append("当前没有新的候选 signature。")
        return "\n".join(lines)
    for candidate in ordered:
        example = candidate.records[0]
        lines.extend(
            [
                f"## [{candidate.priority}] `{candidate.signature}`",
                "",
                f"- Count: {len(candidate.records)}",
                f"- Category: `{example.category}`",
                f"- Example seed: `{example.seed}`",
                f"- Example pipeline: `{example.pipeline}`",
                f"- Triage: {candidate.rationale}",
                "",
                "```text",
                signature_excerpt(example),
                "```",
                "",
            ]
        )
    return "\n".join(lines)


def priority_counts(candidates: list[Candidate]) -> dict[str, int]:
    counts: dict[str, int] = {}
    for candidate in candidates:
        counts[candidate.priority] = counts.get(candidate.priority, 0) + 1
    return dict(sorted(counts.items()))


def read_json(path: Path) -> dict:
    if not path.exists():
        return {"runs": []}
    return json.loads(path.read_text(encoding="utf-8"))


if __name__ == "__main__":
    raise SystemExit(main())
