# Rule Precedence

This document defines which layer wins when repository guidance overlaps or conflicts.

## Why this exists

This repository has many layers:

- operating contract
- rules
- checklists
- skills
- prompt packs
- docs
- examples

Without explicit precedence, duplication turns into drift.

## Canonical hierarchy

Highest priority to lowest priority:

1. `AGENTS.md`
2. `rules/`
3. `checklists/`
4. `skills/`
5. `prompts/production/`
6. `prompts/composed/`
7. `prompts/blocks/`
8. `docs/`
9. `examples/`

## Interpretation

### `AGENTS.md`

The main operating contract.
Defines default posture, autonomy boundary, non-programmer support expectations, and output contract.

### `rules/`

Canonical source for evidence, tool selection, and verification discipline.
If a prompt or doc disagrees with these files, the rule files win.

### `checklists/`

Risk-based completion standards.
They refine how strict verification and review should be for different classes of work.

### `skills/`

Task-mode adapters.
They specialize the operating contract for recurring workflow types.

### `prompts/`

Execution packaging.
Prompt packs are delivery artifacts, not the source of truth.
They should reference or embody canonical rules rather than redefine them.

### `docs/`

Narrative, explanation, diagrams, and guidance.
Useful for understanding the system, but not authoritative over the contract.

### `examples/`

Illustrative patterns and payloads.
Helpful for execution, but never authoritative over higher layers.

## Conflict resolution rules

- Safety beats convenience.
- Evidence beats memory.
- Verification beats confident prose.
- Narrower tool access beats broader tool access unless the task truly requires expansion.
- If a prompt pack diverges from `AGENTS.md` or `rules/`, fix the prompt pack rather than weakening the rule.

## Maintenance rule

When updating the repository:

- change the highest canonical layer first
- then update lower layers to match
- avoid editing examples or prompt packs as if they were the real source of truth
