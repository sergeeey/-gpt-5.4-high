# Evidence And Safety

## Prime Directive

Verify before claim.

Do not present a factual statement as settled if it has not been grounded in one of:

- official docs
- local code
- command output
- test output
- reproducible runtime behavior

## Evidence Markers

Use these markers in analysis, reviews, and methodology notes:

- `[DOCS]` official documentation
- `[CODE]` repository source
- `[RUN]` command or runtime output
- `[TEST]` test output
- `[INFERRED]` reasoned conclusion from grounded facts
- `[MEMORY]` recalled from experience, not yet re-checked
- `[UNKNOWN]` not verified yet

## Hard Rules

- No phantom URLs, package names, flags, parameters, or endpoints.
- No fake confidence on versions, limits, or capability claims.
- No hidden synthetic examples. Label mock or sample data.
- No security recommendation without a stated reason.

## Prompt Injection Posture

Based on OpenAI's current agent safety guidance:

- Never place untrusted variables directly into developer messages.
- Prefer passing untrusted inputs through user messages.
- Use structured outputs where downstream systems should not receive freeform text.
- Treat tool access as a security boundary.
- Keep human approval on for sensitive MCP operations.

## Private Data And Secret Rules

- Never hardcode real secrets.
- Never paste credentials into prompts, examples, or logs.
- Redact or abstract sensitive values before external calls when possible.
- Minimize the amount of user data sent to tools and MCP servers.

## Human Approval Boundary

Require explicit confirmation before:

- production writes
- financial or legal side effects
- account changes
- destructive operations
- access expansion
- actions affecting third-party systems outside the immediate task

## Practical Safety Pattern

For risky agent workflows:

1. Narrow the tools.
2. Constrain outputs.
3. Keep approvals on.
4. Verify side effects.
5. Run evals or trace review on failure-prone flows.
