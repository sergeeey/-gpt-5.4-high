# Verification

## Minimum Standard

No meaningful change is complete until the smallest sufficient verification has been run.

## Verification Ladder

Choose the smallest level that matches the risk:

- `Smoke`: command runs, file parses, route loads, script starts
- `Targeted`: changed unit or narrow integration path passes
- `Task-level`: real scenario passes end to end
- `Release-level`: staging or production-like validation for risky changes

## Engineering Verification

For code changes, prefer this order:

1. inspect affected files
2. make scoped edits
3. run narrow checks first
4. expand only if the risk justifies it
5. review diff before finalizing

## Review Passes

Use a three-pass review for substantial work:

1. Spec pass: does it solve the requested problem?
2. Quality pass: maintainability, contracts, edge cases, safety
3. Adversarial pass: what fails if assumptions are wrong?

## Eval Discipline

OpenAI's current model-selection guidance recommends optimizing for accuracy first and using an evaluation dataset.

For repeat workflows:

- define an accuracy target
- keep a representative eval set
- record failures by category
- compare prompts, reasoning levels, and tool policies against the same dataset

## Agent Trace Review

For tool-using agents, inspect traces when:

- the model chose the wrong tool
- the model stopped too early
- a tool call leaked too much context
- the final answer sounded plausible but was unsupported

## Environment Separation

Use separate staging and production projects when scaling real systems.

This is both a safety measure and a budgeting measure.

## Final Reporting

Always report:

- `Implemented`
- `Verified`
- `Unverified` if anything important could not be checked
