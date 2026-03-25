# Assumptions Register

This file tracks volatile external assumptions that can go stale over time.

Columns:

- `claim_id`
- `claim`
- `source`
- `last_verified`
- `owner`
- `recheck_trigger`

| claim_id | claim | source | last_verified | owner | recheck_trigger |
|---|---|---|---|---|---|
| `openai-model-default` | `gpt-5.4` is the default starting point for complex reasoning and coding | `https://developers.openai.com/api/docs/guides/latest-model` | `2026-03-25` | `repo` | model release notes or docs update |
| `openai-responses-default` | OpenAI recommends the Responses API for GPT-5.4 workflows | `https://developers.openai.com/api/docs/guides/latest-model` | `2026-03-25` | `repo` | API guidance changes |
| `openai-phase-guidance` | `phase` preservation matters in long-running or tool-heavy flows | `https://developers.openai.com/api/docs/guides/latest-model` | `2026-03-25` | `repo` | runtime guidance changes |
| `openai-tool-search` | GPT-5.4 supports tool search for large tool ecosystems | `https://developers.openai.com/api/docs/guides/tools-tool-search` | `2026-03-25` | `repo` | tool docs update |
| `openai-background` | background mode is the asynchronous pattern for long-running tasks and is not Zero Data Retention compatible | `https://developers.openai.com/api/docs/guides/background` | `2026-03-25` | `repo` | background-mode docs update |
| `openai-computer-use-guardrails` | computer use should run in isolated environments with allow lists and human approval for high-impact actions | `https://developers.openai.com/api/docs/guides/tools-computer-use` | `2026-03-25` | `repo` | computer-use docs update |
| `openai-agent-safety` | untrusted variables should not be injected into developer messages and MCP writes should keep approvals on | `https://developers.openai.com/api/docs/guides/agent-builder-safety` | `2026-03-25` | `repo` | agent safety docs update |
| `openai-model-selection` | prompt and policy changes should be evaluated with a representative dataset instead of ad hoc judgment | `https://developers.openai.com/api/docs/guides/model-selection` | `2026-03-25` | `repo` | model-selection docs update |

## Maintenance rule

When a claim in `README.md`, `AGENTS.md`, `rules/`, `prompts/`, or `docs/` depends on unstable external guidance, add or update the assumption here.
