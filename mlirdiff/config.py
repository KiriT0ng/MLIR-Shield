import json
from dataclasses import dataclass
from pathlib import Path


@dataclass(frozen=True)
class Pipeline:
    name: str
    args: list[str]
    description: str = ""


def load_pipelines(path: Path) -> list[Pipeline]:
    if not path.exists():
        raise FileNotFoundError(f"Pipeline config not found: {path}")

    raw = json.loads(path.read_text(encoding="utf-8"))
    pipelines = raw.get("pipelines", [])
    if not isinstance(pipelines, list) or not pipelines:
        raise ValueError("Pipeline config must contain a non-empty 'pipelines' list.")

    parsed: list[Pipeline] = []
    names: set[str] = set()
    for item in pipelines:
        name = item.get("name")
        args = item.get("args", [])
        if not isinstance(name, str) or not name.strip():
            raise ValueError("Each pipeline must have a non-empty string name.")
        if name in names:
            raise ValueError(f"Duplicate pipeline name: {name}")
        if not isinstance(args, list) or not all(isinstance(arg, str) for arg in args):
            raise ValueError(f"Pipeline '{name}' args must be a string list.")
        names.add(name)
        parsed.append(
            Pipeline(
                name=name,
                args=args,
                description=str(item.get("description", "")),
            )
        )
    return parsed
