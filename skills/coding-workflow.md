# Coding Workflow

Use this skill for:

- multi-file implementation
- debugging and refactoring
- code review and repair
- repo-aware engineering work

## Default stance

- Model: `gpt-5.4`
- Reasoning: `high` for non-trivial work
- Runtime: `Responses API` or Codex-style local execution
- Tool bias: local code search and shell first, web only when facts are unstable

## Workflow

1. Read before edit.
2. Make the task boundary explicit.
3. Prefer minimal diffs over broad rewrites.
4. Use `apply_patch` for targeted edits when available.
5. Run the smallest sufficient verification.
6. Report `Implemented` and `Verified` separately.

## Prompt blocks that help

Use explicit blocks when the workflow needs them:

- task contract
- file read order
- terminal tool hygiene
- verification contract
- output contract

## Failure modes

- starts editing before reading
- uses shell to simulate edit tools
- skips tests after patches
- solves the wrong problem because the done condition was vague

## Escalate to web or docs when

- API behavior is uncertain
- a package, CLI flag, or config field may have changed
- the user asks for latest guidance or current docs
