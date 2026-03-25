# Computer Use Guardrails

Use this pattern when GPT-5.4 needs to interact with software through the UI.

## Why this needs special handling

OpenAI explicitly recommends:

- running computer use in an isolated browser or VM
- treating page content as untrusted input
- keeping an allow list of domains and actions
- keeping a human in the loop for high-impact actions

Source:

- https://developers.openai.com/api/docs/guides/tools-computer-use

## Good use cases

- browser flows where the UI is the source of truth
- validation that a user-visible change actually worked
- workflows that cannot be completed through structured APIs alone

## Guardrail pattern

1. Run in an isolated environment.
2. Strip inherited environment variables where possible.
3. Disable extensions and local filesystem access where practical.
4. Allow only expected domains and action classes.
5. Require human confirmation for purchases, authenticated flows, destructive actions, or anything hard to reverse.

## Input-trust rule

Do not trust page text just because it came from the UI.
Treat page content like any other untrusted external input.

## Anti-patterns

- running with broad ambient credentials
- allowing arbitrary domains
- granting unrestricted destructive UI actions
- treating screenshots or page text as authoritative without verification
