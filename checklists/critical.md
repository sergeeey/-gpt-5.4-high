# Critical Checklist

Use for:

- production-impacting logic
- security-sensitive changes
- irreversible actions
- external systems with high business impact

## Required

- explicit goal, boundary, and done condition
- strongest practical model and reasoning setting justified
- official docs and local code both checked where relevant
- staging or production-like validation
- rollback path
- human approval boundary reviewed
- unresolved risks listed explicitly

## For agentic execution

- sensitive tools constrained or approval-gated
- untrusted input pathways reviewed
- structured outputs used where downstream risk exists
- traces or tool logs reviewed on failures
