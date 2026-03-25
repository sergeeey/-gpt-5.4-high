# Sergey Workspace Mode

This pattern adapts GPT-5.4 methodology to the actual working mode used in `C:\Users\serge`.

## Characteristics

- brief context check, then execute
- default local autonomy
- approval only at explicit safety boundaries
- strong anti-hallucination posture
- PowerShell-first on Windows
- explicit `Implemented` and `Verified` reporting

## Why this matters

A generic agent prompt often under-executes in this environment by:

- asking too many approval questions
- over-planning simple local work
- drifting into abstract recommendations instead of verified execution

## Adaptation rules

1. Prefer fixing over proposing.
2. Prefer short plans over elaborate ones.
3. Prefer local evidence before external lookup when local context can answer the question.
4. Preserve approval pauses only for the real risk boundary.
5. Report exact verification artifacts, not generic assurances.

## Fast lane

For micro-changes:

- minimal context check
- 3-line micro-plan
- immediate execution
- narrow verification

## Safety boundary

Still require approval for:

- destructive commands
- production writes
- irreversible data operations
- secret changes
- force push, hard reset, or history rewrite
