# Responses Loop Pattern

Use this pattern when building a GPT-5.4 workflow on the Responses API.

## Why this is the default

Official OpenAI guidance recommends the Responses API for GPT-5.4 workflows and recommends preserving reasoning continuity with `previous_response_id`.

Sources:

- https://developers.openai.com/api/docs/guides/latest-model
- https://developers.openai.com/api/docs/guides/reasoning-best-practices

## Baseline loop

1. Send the initial request with `model: "gpt-5.4"`.
2. If the model emits tool calls, execute them.
3. Return tool outputs to the model.
4. Use `previous_response_id` whenever possible rather than replaying a long manual history.
5. Keep `phase` correct for commentary and final answers in tool-heavy flows.

## When to use `store`

For multi-turn reasoning workflows, OpenAI recommends using the Responses API with `store=true` and passing reasoning items across turns.

## Commentary and final answer

In long-running or tool-heavy flows:

- use `phase: "commentary"` for progress updates, preambles, and tool intent
- use `phase: "final_answer"` for the completed answer

If you manually replay history, preserve the original phase values.

## Anti-patterns

- manual replay of long assistant history without preserving `phase`
- dropping reasoning continuity between tool turns
- treating commentary as the final answer
- mixing unrelated tool outputs into the same step
