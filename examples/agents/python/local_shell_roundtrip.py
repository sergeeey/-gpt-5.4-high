from __future__ import annotations

import subprocess
from dataclasses import dataclass
from typing import Any

from openai import OpenAI


client = OpenAI()


@dataclass
class CmdResult:
    stdout: str
    stderr: str
    exit_code: int | None
    timed_out: bool


def run_command(command: str, timeout_s: int = 120) -> CmdResult:
    try:
        completed = subprocess.run(
            command,
            shell=True,
            capture_output=True,
            text=True,
            timeout=timeout_s,
        )
        return CmdResult(
            stdout=completed.stdout,
            stderr=completed.stderr,
            exit_code=completed.returncode,
            timed_out=False,
        )
    except subprocess.TimeoutExpired as exc:
        return CmdResult(
            stdout=exc.stdout or "",
            stderr=exc.stderr or "",
            exit_code=None,
            timed_out=True,
        )


def build_shell_output_item(call_id: str, results: list[CmdResult]) -> dict[str, Any]:
    output_items: list[dict[str, Any]] = []
    for result in results:
        outcome: dict[str, Any]
        if result.timed_out:
            outcome = {"type": "timeout"}
        else:
            outcome = {"type": "exit", "exit_code": result.exit_code}

        output_items.append(
            {
                "stdout": result.stdout,
                "stderr": result.stderr,
                "outcome": outcome,
            }
        )

    return {"type": "shell_call_output", "call_id": call_id, "output": output_items}


def main() -> None:
    response = client.responses.create(
        model="gpt-5.4",
        instructions="The local shell environment is Windows PowerShell.",
        input="Find the largest log file in the current workspace and then summarize what you verified.",
        tools=[{"type": "shell", "environment": {"type": "local"}}],
    )

    while True:
        shell_calls = [item for item in response.output if getattr(item, "type", None) == "shell_call"]
        if not shell_calls:
            break

        tool_outputs: list[dict[str, Any]] = []
        for item in shell_calls:
            commands = getattr(getattr(item, "action", None), "commands", []) or []
            command_results: list[CmdResult] = []
            for command in commands:
                command_results.append(run_command(command))
            if command_results:
                tool_outputs.append(build_shell_output_item(item.call_id, command_results))

        response = client.responses.create(
            model="gpt-5.4",
            previous_response_id=response.id,
            input=tool_outputs,
            tools=[{"type": "shell", "environment": {"type": "local"}}],
        )

    print(getattr(response, "output_text", ""))


if __name__ == "__main__":
    main()
