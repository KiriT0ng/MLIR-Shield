from __future__ import annotations

from dataclasses import asdict, dataclass


@dataclass
class RunRecord:
    seed: str
    pipeline: str
    command: str
    return_code: int
    timed_out: bool
    elapsed_ms: int
    stdout: str
    stderr: str
    stdout_path: str
    stderr_path: str
    category: str

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class Issue:
    seed: str
    severity: str
    kind: str
    summary: str
    details: str

    def to_dict(self) -> dict:
        return asdict(self)


@dataclass(frozen=True)
class SuiteResult:
    seeds: list[str]
    pipelines: list[str]
    runs: list[RunRecord]
    issues: list[Issue]

    def to_dict(self) -> dict:
        return {
            "seeds": self.seeds,
            "pipelines": self.pipelines,
            "runs": [run.to_dict() for run in self.runs],
            "issues": [issue.to_dict() for issue in self.issues],
        }
