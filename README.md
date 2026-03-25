# GPT-5.4 High Methodology

Separate workspace for operating methodology around `gpt-5.4` / `gpt-5.4 high`.

This repository is intentionally separate from `Claude-cod-top-2026`.
The Claude repository remains the Claude Code operating system.
This repository is the GPT / Codex / Responses API operating system.

## Purpose

Build a repeatable way to use `gpt-5.4` for:

- complex coding and refactoring
- long-horizon agent workflows
- tool-using research and verification
- MCP-connected external systems
- production-safe execution with explicit evidence

The baseline assumption is simple:

- `gpt-5.4` is the default model for complex reasoning and coding according to current OpenAI docs.
- The Responses API is the preferred runtime for GPT-5.4 workflows.
- Tool use is part of the design, not an afterthought.
- Verification is mandatory for important claims and code changes.

## Repository Layout

- `AGENTS.md` - core operating profile for GPT-5.4 high
- `rules/evidence-and-safety.md` - evidence discipline, prompt injection posture, PII and approval rules
- `rules/tool-selection.md` - when to use web search, MCP, shell, code interpreter, apply patch, computer use, background mode
- `rules/verification.md` - evaluation, review, staging, and verification standards
- `docs/openai-source-map.md` - current official OpenAI source map used to ground this methodology
- `docs/patterns/` - implementation patterns for Responses API, tools, MCP, and long-horizon work
- `skills/` - reusable operating modes for recurring GPT-5.4 workflows
- `checklists/` - risk-based completion standards
- `prompts/` - reusable prompt blocks and composed prompt patterns
- `evals/` - evaluation scaffolding, synthetic datasets, and grader guidance
- `examples/responses/` - example Responses API payloads
- `examples/agents/` - end-to-end loop examples in Python and JavaScript
- `templates/task-brief.md` - scoped work template
- `templates/eval-checklist.md` - lightweight eval and release checklist

## Current OpenAI Baseline

As of the current official docs:

- Start with `gpt-5.4` for complex reasoning and coding.
- `gpt-5.4` supports `reasoning.effort` values `none`, `low`, `medium`, `high`, and `xhigh`.
- `gpt-5.4` supports a 1M+ context window and a broad hosted tool surface in the Responses API, including web search, file search, code interpreter, hosted shell, apply patch, skills, computer use, MCP, and tool search.
- For harder problems, `gpt-5.4-pro` is available in the Responses API and OpenAI recommends background mode for requests that may take several minutes.

Official sources:

- https://developers.openai.com/api/docs/models
- https://developers.openai.com/api/docs/models/gpt-5.4
- https://developers.openai.com/api/docs/guides/latest-model

## Design Stance

This methodology is opinionated:

- Use `gpt-5.4` as the main worker.
- Use `high` reasoning deliberately for hard engineering work, not by reflex for every trivial task.
- Prefer local evidence and real execution over speculative advice.
- Keep prompts modular and operational.
- Keep tool access explicit, narrow, and auditable.

## Operating Layers

This repository is designed in layers:

1. `AGENTS.md`
Core operating contract.

2. `rules/`
Global discipline for evidence, tools, and verification.

3. `skills/`
Reusable task modes like coding, research, tool-heavy execution, and release hardening.

4. `checklists/`
Risk-scaled completion standards.

5. `prompts/`
Reusable prompt blocks and composed prompt structures.

6. `evals/`
Datasets, failure taxonomies, and grader scaffolding.

7. `docs/patterns/`
Concrete integration patterns for OpenAI runtimes and tool ecosystems.

8. `examples/`
Payloads and implementation templates that can be copied into real systems.

## Status

This repository starts as a grounded baseline, not as the final form.
Next iterations should expand:

- domain-specific skills
- long-horizon workflow templates
- OpenAI tool harness patterns
- eval sets and failure taxonomies
- MCP trust tiers and approval policies
