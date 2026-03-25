# Eval Checklist

## Use Case

What exact workflow is being evaluated?

## Accuracy Target

What does "good enough" mean numerically or operationally?

## Eval Set

- representative happy paths
- edge cases
- prompt injection attempts
- tool misuse cases
- stale-fact cases

## Variables Under Test

- model
- reasoning effort
- verbosity
- prompt version
- tool policy
- approval policy

## Failure Modes

- wrong answer
- unsupported claim
- wrong tool selection
- premature final answer
- over-sharing to tools or MCP
- excessive latency or cost

## Trace Review

For failed runs, inspect:

- tool sequence
- commentary vs final separation
- unnecessary tool calls
- missing verification
- leakage of untrusted text into privileged instructions

## Verdict

- keep
- revise prompt
- revise tool policy
- escalate model
- add approval
- add eval case
