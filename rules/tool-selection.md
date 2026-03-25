# Tool Selection

## Default API Shape

Use the `Responses API` as the default runtime for GPT-5.4 workflows.

OpenAI's current GPT-5.4 guidance explicitly recommends the Responses API for better multi-turn behavior and for passing prior reasoning state through `previous_response_id`.

## Model Selection

- `gpt-5.4`: default for complex reasoning, coding, and agent workflows
- `gpt-5.4-pro`: use when harder thinking is worth higher cost and longer latency
- `gpt-5.4-mini`: use for throughput, lower latency, and cost-sensitive workflows

Do not escalate to `pro` by habit.
Escalate only when:

- the task is unusually ambiguous
- the cost of a wrong answer is high
- a weaker run already failed
- deep multi-step reasoning is the bottleneck

## Reasoning Effort

Recommended starting points:

- `none`: simple transformations, classification, templated generation, or quick iteration
- `medium`: standard implementation and mixed reasoning tasks
- `high`: architecture, debugging, audits, multi-file changes, migration planning, long tool trajectories
- `xhigh`: exceptional cases only

For this repository's operating default, prefer `high` for difficult engineering work.

## Tool Matrix

### Web search

Use when:

- facts may have changed
- you need recent releases, pricing, policies, or docs
- you need source attribution outside local code

### File search

Use when:

- you have a curated knowledge base
- the problem is retrieval over documents, not generic web browsing
- you want hosted semantic plus keyword retrieval

### MCP and connectors

Use when:

- you need direct access to systems like GitHub or other trusted services
- the external system is part of the workflow, not just a reference

Avoid broad MCP exposure when a smaller tool surface is enough.

### Hosted shell

Use when:

- you need real command execution in a controlled environment
- the model must inspect filesystem state, build, test, install, or run CLIs

Remember:

- hosted containers do not have outbound network access by default
- enable network only through an explicit allowlist when required

### Local shell

Use when:

- the task must run in your actual environment
- local files, local tooling, or local credentials are required

### Code interpreter

Use when:

- files must be transformed or generated
- Python analysis is the right execution substrate
- iterative computation is cheaper than prose reasoning

Treat containers as ephemeral and persist artifacts you care about outside them.

### Apply patch

Use when:

- you need small deterministic edits
- you want highly reviewable diff-based changes
- exact text surgery is better than freeform regeneration

### Computer use

Use when:

- the UI is the system of record
- the workflow depends on browser or desktop interactions
- you need end-to-end validation through the interface

Run it in isolated environments and keep a human in the loop for high-impact actions.

### Tool search

Use when:

- the available tool surface is too large to preload efficiently
- you want deferred tool loading and better tool selection

## Long-Running Jobs

Use `background=true` when:

- the workflow can take minutes
- tools or reasoning may exceed normal request patience
- you want robust polling or resumability

## Phase Discipline

For long-running or tool-heavy GPT-5.4 flows:

- use `phase: "commentary"` for intermediate updates
- use `phase: "final_answer"` for the completed answer

If you manually replay assistant history, preserve original phases.
