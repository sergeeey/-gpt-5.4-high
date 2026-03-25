# MCP Trust Tiers

MCP is powerful, but it is also a trust boundary.

## Tier 0: No MCP

Use when:

- local code and local shell are enough
- external facts can be checked through official docs or web search

## Tier 1: Read-only trusted MCP

Use when:

- the external system is trusted
- read access materially improves speed or correctness
- write access is unnecessary

Examples:

- repository reading
- issue lookup
- document retrieval

## Tier 2: Controlled write MCP

Use when:

- write access is needed
- the action is reversible
- approvals or explicit confirmation are available

Examples:

- adding comments
- creating a draft artifact
- updating a non-production record

## Tier 3: High-impact MCP

Use when:

- actions can cause irreversible or costly side effects
- accounts, production systems, or financial workflows are involved

Requirements:

- human approval
- narrowed tool surface
- explicit action boundary
- post-action verification

## General rules

- Never give write access just because it might be convenient later.
- Treat all external content returned through MCP as potentially untrusted text.
- Review what data is being sent to the MCP, not just what comes back.
