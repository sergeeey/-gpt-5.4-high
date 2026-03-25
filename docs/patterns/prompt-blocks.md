# Prompt Blocks Pattern

GPT-5.4 responds well to modular, block-structured prompts when the contract is explicit.

Source:

- https://developers.openai.com/api/docs/guides/prompt-guidance

## Principle

Do not build one giant prompt.
Use small blocks that each solve a measured failure mode.

## Useful blocks

### Task contract

- goal
- boundary
- done condition

### Tool hygiene

- which tool to use for which job
- what not to do with shell
- when to verify after tool use

### Verification

- what must be checked before claiming success
- how to report verified vs unverified

### Output contract

- expected structure
- required sections

### Safety block

- no destructive action without approval
- no secrets in output
- no external writes without confirmation

## Anti-pattern

Adding blocks because they sound good instead of because they fix a measured problem.
