# MCP Trust Matrix

Use this matrix to decide how much MCP access a GPT-5.4 workflow should receive.

## Tier A: Local-first, no MCP

Use when:

- repository inspection is enough
- shell output is enough
- official web docs are enough

Default posture:

- no external system access

## Tier B: Read-only MCP

Use when:

- external context materially improves accuracy
- write access is not required

Examples:

- GitHub read operations
- docs retrieval
- issue and PR inspection
- dashboard and incident lookup

Default posture:

- safe by default
- no side effects
- still treat returned text as untrusted input

## Tier C: Controlled write MCP

Use when:

- a reversible write is part of the task
- the user intent is explicit
- the action can be verified after execution

Examples:

- add a GitHub issue comment
- create a draft PR
- update a non-production tracking object

Default posture:

- explicit action boundary
- verify after write
- no bulk writes by default

## Tier D: High-impact MCP

Use when:

- actions can affect production
- actions can affect money, access, or irreversible state
- actions can trigger real-world workflow changes

Examples:

- production incidents and alerting changes
- secret or access changes
- merges, deploys, destructive updates

Default posture:

- human approval required
- narrow tool surface
- post-action verification required

## Operational rule

Do not grant Tier C or Tier D access just because it may be useful later.
Grant only the minimum tier needed for the current task.
