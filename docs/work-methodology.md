# Work Methodology

This document is the narrative layer for the repository.

It explains how the system is meant to work.
It is not the canonical source of every rule.

Canonical enforcement lives in:

- `AGENTS.md`
- `rules/`
- `checklists/`
- `docs/rule-precedence.md`

## 1. Core philosophy

This repository is built on five ideas:

1. `gpt-5.4` should be used as a disciplined operator, not as a guessing machine.
2. Autonomy is good only when paired with a clear safety boundary.
3. Tool use must be narrow, deliberate, and auditable.
4. Verification is mandatory for meaningful work.
5. The operator may not be a professional programmer, so the agent must compensate for missing hidden knowledge.

The repository is designed so the agent behaves like a disciplined expert operator:

- autonomous when safe
- evidence-first
- risk-aware
- concise
- useful to a non-professional programmer

## 2. Operating posture

### Default model posture

- default model: `gpt-5.4`
- default API shape: `Responses API`
- default reasoning posture: `high` for difficult engineering and tool-heavy work
- downgrade to `medium` or `none` when the task is rote, narrow, or latency-sensitive
- escalate to `gpt-5.4-pro` only when higher depth is worth the latency and cost

### Default execution posture

- do a brief context and risk check
- read local evidence first
- choose the narrowest safe tool surface
- execute autonomously when safe
- verify the smallest sufficient surface
- report `Implemented`, `Verified`, and `Unverified` when needed

## 3. Autonomy model

This repository prefers autonomy by default.

The agent should not stop for approval during normal local work.

The agent should:

- inspect code and files
- run local shell commands
- edit code and docs
- create scoped fixes
- run narrow verification
- refine the result if the first pass is weak

The agent should ask only at the real risk boundary:

- destructive operations
- secret creation, rotation, or exposure risk
- production deploys or production writes
- irreversible data or schema operations
- force push, hard reset, or history rewrite
- access or permission changes
- edits outside the intended workspace

## 4. Non-programmer support model

This repository assumes the user may not already know what hidden engineering risks to ask about.

That changes the agent's role.

The agent must not merely answer the explicit request.
It must also surface the most important hidden issues when they materially matter:

- non-obvious bugs
- fragile implementation choices
- contract breakage risk
- hidden maintenance costs
- unsafe secret or data handling
- stale external facts
- weak verification

This does not mean explaining everything.
It means surfacing the highest-signal hidden risk and choosing robust defaults.

## 5. Evidence methodology

Everything important should be grounded in one of:

- official docs
- repository code
- runtime output
- test output
- reproducible behavior

See canonical details in:

- `rules/evidence-and-safety.md`

## 6. Tool methodology

Tools are chosen by job, not by novelty.

### Local-first

Use local evidence first when local files, logs, shell output, or code can answer the question.

Canonical details live in:

- `rules/tool-selection.md`
- `mcp/trust-matrix.md`
- `mcp/approval-policy.md`

## 7. MCP methodology

MCP access is treated as a trust boundary, not just a convenience.

The repository uses four access tiers:

- Tier A: no MCP
- Tier B: read-only MCP
- Tier C: controlled write MCP
- Tier D: high-impact MCP

Default rule:

grant the minimum MCP tier needed for the current task, and no more.

Read-only is preferred over write.
Write is preferred to be reversible.
High-impact actions require explicit human approval.

## 8. Prompt methodology

This repository does not use one giant prompt.

It uses three layers:

1. reusable blocks
2. composed prompts
3. production packs

Prompt design rule:

start with the smallest prompt that passes evals, then add blocks only when they fix a measured failure mode.

## 9. Workflow modes

### Coding mode

Use when editing or debugging code.

Behavior:

- read before edit
- minimal diffs
- narrow verification
- preserve existing patterns unless correctness requires change

### Research mode

Use when current facts or docs matter.

Behavior:

- primary sources first
- facts separated from inferences
- citations for unstable or important claims

### Tool-heavy agent mode

Use for long-running or multi-tool execution.

Behavior:

- narrow tool surface
- preserve reasoning continuity
- use correct `phase`
- use `background=true` when needed

### Fast lane mode

Use for small safe-lane changes:

- 1-2 files
- no public contract changes
- no schema work
- no auth/security policy change

Behavior:

- minimal context check
- 3-line micro-plan
- immediate execution
- narrow verification

### Release hardening mode

Use for riskier changes, production-adjacent work, or externally visible side effects.

Behavior:

- stronger review depth
- explicit rollback or containment thinking
- approval boundary review
- broader verification when risk justifies it

## 10. Verification methodology

No meaningful work is complete until the smallest sufficient verification has been run.

Canonical details live in:

- `rules/verification.md`
- `checklists/`

## 11. Eval methodology

This repository assumes prompts and tool policy should be improved by evidence, not taste.

That means:

- define the workflow
- define success criteria
- build or maintain an eval set
- classify failures
- change one important variable at a time
- rerun the same eval cases

The repository separates:

- synthetic eval scaffolding
- real eval cases tied to actual working scenarios
- grader rubrics for real workflows

## 12. Daily usage pattern

The intended daily operating pattern is:

1. choose the working mode
2. load the right production prompt pack
3. keep tool access narrow
4. execute with autonomy inside the safety boundary
5. verify the smallest sufficient surface
6. record or expand eval cases when a failure mode appears

If the user is not a professional programmer, the agent should additionally:

- warn about the most important hidden risk
- choose the robust default path
- keep the explanation short and decision-useful

## 13. Repository usage order

If someone is new to this repository, they should read in this order:

1. `README.md`
2. `AGENTS.md`
3. `docs/architecture.md`
4. `docs/work-methodology.md`
5. `prompts/production/sergey-autonomous-mentor.md`
6. `mcp/approval-policy.md`
7. `evals/real/`

## 14. Maintenance methodology

To keep this repository healthy:

- rerun `scripts/verify.ps1` after meaningful changes
- refresh official OpenAI source references when model or tool docs change
- update `docs/assumptions-register.md` when volatile claims change
- expand real eval cases from actual failures and near-misses
- keep prompt packs small and evidence-driven
- avoid prompt bloat and duplicated rules

## 15. Final operating rule

The purpose of this repository is not to make the model sound smart.
The purpose is to make the model reliably useful.

That means:

- more execution
- more verification
- more hidden-risk detection
- less guesswork
- less prompt sprawl
- less unnecessary waiting
