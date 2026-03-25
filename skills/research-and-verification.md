# Research And Verification

Use this skill for:

- current-facts research
- documentation checks
- package and API verification
- architecture decisions that need evidence

## Default stance

- Start narrow.
- Verify before recommending.
- Separate facts from inferences.

## Workflow

1. Classify the claim:
   - fact
   - API behavior
   - package existence
   - config field
   - best practice
2. Choose the primary source:
   - official docs
   - local code
   - runtime output
3. Add the smallest sufficient supporting evidence.
4. If the claim remains uncertain, say so.

## Rules

- Do not rely on memory for versions or capabilities if the docs are available.
- Prefer official docs over blogs and summaries.
- For unstable facts, include the source path or URL in the final answer.
- For recommendations, explain why the source applies to the user's situation.

## Output contract

- Facts
- Inferences
- Unknowns
- Sources
