# Eval Flywheel

Use this pattern when tuning prompts, tool policy, or model selection for recurring workflows.

## Why

OpenAI's current guidance emphasizes:

- optimize for accuracy first
- build an evaluation dataset
- use graders and annotations
- iterate rather than judge prompt quality ad hoc

Sources:

- https://developers.openai.com/api/docs/guides/model-selection
- https://developers.openai.com/api/docs/guides/prompt-optimizer
- https://developers.openai.com/api/docs/guides/agent-builder-safety

## Flywheel

1. Define the workflow and success criteria.
2. Build an evaluation dataset with representative success and failure cases.
3. Add human annotations or graders.
4. Run the current prompt and tool policy.
5. Review failures by category.
6. Change one major variable at a time:
   - prompt blocks
   - reasoning effort
   - model choice
   - tool policy
   - approval policy
7. Re-run the same eval set.
8. Keep the change only if results improve.

## Good failure categories

- unsupported claim
- wrong tool selection
- premature final answer
- prompt injection susceptibility
- over-sharing to tools or MCP
- excessive latency or cost

## Operating rule

Do not "improve" prompts in production by intuition alone.
If a workflow matters, it deserves an eval set.
