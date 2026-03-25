# Tool Narrowing Pattern

Use this pattern when the available tool surface is large enough to hurt accuracy, latency, or safety.

## Goal

Expose the smallest tool set that can complete the current step.

## Why

OpenAI's GPT-5.4 guidance explicitly highlights:

- stronger behavior with explicit tool contracts
- lower reliability of tool routing early in a session when context is thin
- `tool_search` for deferred loading in large tool ecosystems

Sources:

- https://developers.openai.com/api/docs/guides/prompt-guidance
- https://developers.openai.com/api/docs/guides/tools-tool-search
- https://developers.openai.com/api/docs/guides/latest-model

## Pattern

1. Group tools by job:
   - local inspection
   - retrieval
   - execution
   - external writes
2. Expose only the group needed for the current step.
3. Use `allowed_tools` when the model should only choose from a smaller subset.
4. Use `tool_search` when many deferred tools exist.
5. Expand the tool surface only if the current step cannot complete without it.

## When to use deferred loading

Use `tool_search` and deferred tools when:

- schemas are numerous
- namespaces are large
- token budget matters
- prompt caching and latency matter

## Safety benefit

Tool narrowing is not only about token savings.
It also reduces accidental side effects and lowers the attack surface for tool misuse.
