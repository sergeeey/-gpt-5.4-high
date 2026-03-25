# Prompt Upgrade

Use this skill for:

- migrating prompts to GPT-5.4
- improving prompt structure
- reducing prompt bloat
- fixing measured failures in existing prompts

## OpenAI-grounded stance

- Start with the smallest prompt that passes evals.
- Add blocks only when they fix a measured failure mode.
- Use dataset-driven optimization rather than taste-driven rewriting.

## Upgrade workflow

1. Capture the current prompt and target behavior.
2. Define an eval set with successes and failures.
3. Identify failure modes:
   - wrong tool use
   - weak verification
   - early stopping
   - drift
   - unnecessary verbosity
4. Add or revise prompt blocks only for those failures.
5. Re-test against the same eval set.

## Good blocks

- task contract
- tool hygiene
- dependency checks
- verification rules
- output contract
- commentary vs final separation

## Bad patterns

- giant monolithic prompts
- vague "be smart" instructions
- duplicated rules in many places
- adding blocks without evidence they help
