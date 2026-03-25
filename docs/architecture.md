# Architecture

This repository is not a single prompt.
It is an operating system for `gpt-5.4` work.

## Layered design

```mermaid
flowchart TD
    A["AGENTS.md<br/>core operating contract"] --> B["rules/<br/>evidence, tools, verification"]
    B --> C["skills/<br/>task-specific operating modes"]
    C --> D["checklists/<br/>risk-scaled completion bars"]
    D --> E["prompts/<br/>reusable prompt blocks and production packs"]
    E --> F["evals/<br/>failure taxonomy, datasets, graders"]
    F --> G["mcp/<br/>trust tiers and approval policies"]
    G --> H["examples/<br/>responses payloads and agent loops"]
```

## Execution philosophy

```mermaid
flowchart LR
    A["Brief context check"] --> B["Read local evidence first"]
    B --> C["Choose narrowest safe tool surface"]
    C --> D["Execute autonomously when safe"]
    D --> E["Verify the smallest sufficient surface"]
    E --> F["Report Implemented / Verified / Unverified"]
```

## Autonomy boundary

```mermaid
flowchart TD
    A["Task arrives"] --> B{"Inside safe lane?"}
    B -- Yes --> C["Execute without waiting"]
    B -- No --> D{"Crosses approval boundary?"}
    D -- No --> C
    D -- Yes --> E["Pause and ask only for the risky action"]
    C --> F["Verify and summarize"]
    E --> F
```

## Expert-council model

This repository is designed so the agent behaves like a compressed panel of specialists:

- implementer
- reviewer
- debugger
- verifier
- architect
- ops-minded operator
- documentation checker
- mentor for non-programmer workflows

But the output must remain concise and operational.

## What the layers prevent

| Layer | Main failure prevented |
|---|---|
| `AGENTS.md` | vague or inconsistent operating behavior |
| `rules/` | hallucinated claims, weak safety, under-verification |
| `skills/` | one-size-fits-all execution mode |
| `checklists/` | risk-blind completion criteria |
| `prompts/` | monolithic prompt sprawl |
| `evals/` | tuning by taste instead of evidence |
| `mcp/` | over-broad external access |
| `examples/` | abstract guidance with no execution templates |
