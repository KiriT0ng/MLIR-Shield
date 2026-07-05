from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from mlirdiff.config import load_pipelines
from mlirdiff.model import RunRecord
from mlirdiff.signature import failure_signature


def main() -> int:
    discovery_path = ROOT / "outputs" / "discovery" / "report.json"
    discovery = json.loads(discovery_path.read_text(encoding="utf-8"))
    pipelines = {pipeline.name: pipeline for pipeline in load_pipelines(ROOT / "configs" / "pipelines_discovery.json")}
    cases = []
    seen: set[str] = set()
    for item in discovery.get("runs", []):
        record = RunRecord(**item)
        if record.return_code == 0 and not record.timed_out:
            continue
        if record.category != "memory/assertion":
            continue
        signature = failure_signature(record)
        if signature in seen:
            continue
        seen.add(signature)
        pipeline = pipelines.get(record.pipeline)
        if not pipeline:
            continue
        case_id = f"P0-{len(cases) + 1:03d}"
        cases.append(
            {
                "id": case_id,
                "title": f"{record.pipeline} / {Path(record.seed).name} / {signature}",
                "seed": record.seed,
                "source": "Discovery P0 candidate",
                "args": [*pipeline.args, "-o", "-"],
            }
        )
    out = ROOT / "configs" / "version_diff_p0_cases.json"
    out.write_text(json.dumps({"cases": cases, "tools": ["mlir-opt-15", "mlir-opt-22"]}, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"P0 version cases: {len(cases)}")
    print(f"config: {out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
