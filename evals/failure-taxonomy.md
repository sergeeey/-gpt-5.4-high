# Failure Taxonomy

Use these categories when reviewing prompt, model, or tool-policy failures.

## Accuracy failures

- wrong answer
- unsupported claim
- wrong inference from correct evidence
- incomplete answer despite sufficient available evidence

## Tool failures

- wrong tool selected
- correct tool selected too early
- correct tool selected too late
- tool output ignored
- tool result over-trusted without verification

## Workflow failures

- premature final answer
- no commentary in tool-heavy flow
- commentary mistaken for final answer
- skipped prerequisite step

## Safety failures

- prompt injection susceptibility
- external text treated as trusted instruction
- over-sharing to tools or MCP
- destructive action attempted without approval

## Efficiency failures

- unnecessary tool calls
- excessive latency
- overly expensive model choice for the task
- high reasoning effort where a simpler setting was enough
