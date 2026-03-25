# Release Hardening

Use this skill for:

- risky refactors
- production changes
- agent workflows that can cause external side effects
- final pre-release review

## Default stance

- Accuracy and reversibility first.
- Cost and latency are secondary at release time.
- No meaningful claim without verification artifacts.

## Workflow

1. Classify the change:
   - trivial
   - minor
   - major
   - critical
2. Select the matching checklist.
3. Verify safety boundaries:
   - secrets
   - permissions
   - destructive actions
   - third-party side effects
4. Run the smallest verification that matches the risk.
5. Record unresolved risks explicitly.

## Special concern for agentic systems

- tool approvals
- external system writes
- prompt injection paths
- over-sharing to MCP or web tools
- false confidence after tool output
