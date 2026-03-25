# MCP Policies

This directory defines how GPT-5.4 workflows should use MCP-connected systems in this repository.

The goal is not maximal connectivity.
The goal is the narrowest safe connectivity that still preserves speed and accuracy.

## Layout

- `trust-matrix.md` - default trust classification
- `approval-policy.md` - when human approval is required
- `profiles/` - suggested MCP exposure profiles by task type

## Design stance

- prefer no MCP when local evidence is enough
- prefer read-only before write-capable access
- treat MCP as both a capability layer and a safety boundary
