# OpenAI Source Map

This file captures the current official OpenAI sources grounding this repository.

Last updated: 2026-03-25

## Core Model Sources

### Models overview

Source:

- https://developers.openai.com/api/docs/models

Key takeaways:

- [DOCS] OpenAI says to start with `gpt-5.4` for complex reasoning and coding.
- [DOCS] OpenAI positions `gpt-5.4-mini` as the lower-latency, lower-cost variant.
- [DOCS] Latest models are available through the Responses API and client SDKs.

### GPT-5.4 model page

Source:

- https://developers.openai.com/api/docs/models/gpt-5.4

Key takeaways:

- [DOCS] `gpt-5.4` supports `reasoning.effort` values `none`, `low`, `medium`, `high`, `xhigh`.
- [DOCS] `gpt-5.4` has a 1,050,000 token context window and 128,000 max output tokens.
- [DOCS] The model supports web search, file search, image generation, code interpreter, hosted shell, apply patch, skills, computer use, MCP, and tool search in the Responses API.

### Latest model guide

Source:

- https://developers.openai.com/api/docs/guides/latest-model

Key takeaways:

- [DOCS] OpenAI recommends `gpt-5.4` as the default model for important work across general-purpose and coding tasks.
- [DOCS] OpenAI recommends the Responses API for GPT-5.4 workflows.
- [DOCS] OpenAI recommends `previous_response_id` for multi-turn reasoning continuity.
- [DOCS] OpenAI recommends preserving assistant `phase` values for tool-heavy and long-running flows.
- [DOCS] `phase: "commentary"` and `phase: "final_answer"` are specifically recommended for long-running or tool-heavy GPT-5.4 flows.
- [DOCS] `tool_search` is a first-class GPT-5.4 feature for large tool ecosystems.

## Tool Sources

### Using tools

Source:

- https://developers.openai.com/api/docs/guides/tools

Key takeaways:

- [DOCS] OpenAI documents a unified tool model for hosted and custom tools.
- [DOCS] Tool choice can be guided explicitly rather than left fully implicit.

### MCP and Connectors

Source:

- https://developers.openai.com/api/docs/guides/tools-connectors-mcp

Key takeaways:

- [DOCS] OpenAI documents MCP and connectors as a first-class tool path.
- [DOCS] The docs index explicitly places MCP, skills, shell, computer use, tool search, apply patch, local shell, image generation, and code interpreter in the GPT-5.4 tool ecosystem.

### Shell

Source:

- https://developers.openai.com/api/docs/guides/tools-shell

Key takeaways:

- [DOCS] GPT-5.4 can use hosted shell through the Responses API.
- [DOCS] Hosted containers do not have outbound network access by default.
- [DOCS] Network access can be opened explicitly via allowlisted domains.
- [DOCS] Shell can target either a hosted container or a local environment.

### File search

Source:

- https://developers.openai.com/api/docs/guides/tools-file-search

Key takeaways:

- [DOCS] File search is a hosted retrieval tool that combines semantic and keyword search.
- [DOCS] It is appropriate when the problem is retrieval over uploaded corpora.

### Web search

Source:

- https://developers.openai.com/api/docs/guides/tools-web-search

Key takeaways:

- [DOCS] In the Responses API, web search can be exposed as a tool the model invokes when needed.
- [DOCS] In Chat Completions, search-preview models retrieve from the web before responding.
- [DOCS] The docs include examples where the final response cites source URLs.

### Code interpreter

Source:

- https://developers.openai.com/api/docs/guides/tools-code-interpreter

Key takeaways:

- [DOCS] Code interpreter is for iterative Python execution, data analysis, file generation, and problem solving.
- [DOCS] Containers are ephemeral and should not be treated as durable storage.

### Apply Patch

Source:

- https://developers.openai.com/api/docs/guides/tools-apply-patch

Key takeaways:

- [DOCS] Apply Patch is a first-class tool in the GPT-5.4 tool ecosystem.
- [DOCS] OpenAI recommends nudging the model toward small, targeted edits instead of broad rewrites.
- [DOCS] After patches, tests or linters should be run and their outputs can be fed back into the loop.

### Tool search

Source:

- https://developers.openai.com/api/docs/guides/tools-tool-search

Key takeaways:

- [DOCS] Tool search loads deferred tools at runtime so only relevant definitions are imported.
- [DOCS] OpenAI supports both hosted tool search and client-executed tool search.
- [DOCS] Namespaces are part of the tool-search model for organizing large tool ecosystems.

### Computer use

Source:

- https://developers.openai.com/api/docs/guides/tools-computer-use

Key takeaways:

- [DOCS] Computer use should run in an isolated browser or VM.
- [DOCS] Page content should be treated as untrusted input.
- [DOCS] Keep an allow list of domains and actions, and keep a human in the loop for high-impact actions.

## Long-Running Execution

### Background mode

Source:

- https://developers.openai.com/api/docs/guides/background

Key takeaways:

- [DOCS] Background mode is for long-running tasks and supports polling response status over time.
- [DOCS] It is the recommended pattern when harder reasoning may take longer than a normal synchronous request window.
- [DOCS] Background mode is not Zero Data Retention compatible because response data is stored temporarily for polling.

### Prompt guidance for GPT-5.4

Source:

- https://developers.openai.com/api/docs/guides/prompt-guidance

Key takeaways:

- [DOCS] GPT-5.4 performs well with modular, block-structured prompts when the contract is explicit.
- [DOCS] OpenAI recommends keeping prompts as small as possible and only adding blocks that fix measured failure modes.
- [DOCS] OpenAI recommends explicit tool hygiene in terminal and coding-agent environments.
- [DOCS] `phase` is highly recommended for long-running or tool-heavy flows, and dropped phase values can degrade behavior.

### Reasoning best practices

Source:

- https://developers.openai.com/api/docs/guides/reasoning-best-practices

Key takeaways:

- [DOCS] Best results come from using the Responses API and passing reasoning items across turns.
- [DOCS] `previous_response_id` is a recommended way to preserve reasoning continuity.
- [DOCS] In function-calling workflows, including reasoning items after the latest function call improves performance and lowers token usage.

### Prompt optimizer

Source:

- https://developers.openai.com/api/docs/guides/prompt-optimizer

Key takeaways:

- [DOCS] Prompt optimization is dataset-driven, not intuition-driven.
- [DOCS] OpenAI recommends pairing optimization with annotations, graders, and an evaluation dataset.
- [DOCS] Optimization should be iterative: optimize, test, annotate, and repeat.

## Safety Sources

### Safety in building agents

Source:

- https://developers.openai.com/api/docs/guides/agent-builder-safety

Key takeaways:

- [DOCS] Do not put untrusted variables into developer messages.
- [DOCS] Use structured outputs to constrain data flow.
- [DOCS] Use GPT-5 or GPT-5-mini for stronger instruction-following and robustness against prompt injection.
- [DOCS] Keep tool approvals on for MCP operations.
- [DOCS] Run evals and trace graders on agent workflows.

## Production Sources

### Model selection

Source:

- https://developers.openai.com/api/docs/guides/model-selection

Key takeaways:

- [DOCS] Optimize for accuracy first.
- [DOCS] Build an evaluation dataset instead of judging prompt quality ad hoc.

### Production best practices

Source:

- https://developers.openai.com/api/docs/guides/production-best-practices

Key takeaways:

- [DOCS] Use separate staging and production projects as you scale.
- [DOCS] Manage rate limits, usage limits, and latency explicitly.
- [DOCS] Streaming improves time-to-first-token user experience even when total generation time is unchanged.

## Notes

- [INFERRED] This repository should treat `gpt-5.4` as the primary worker model and reserve `gpt-5.4-pro` for exceptional depth.
- [INFERRED] The strongest GPT-5.4 methodology is not "more prompt text", but better tool narrowing, reasoning selection, phase discipline, verification, and evals.
