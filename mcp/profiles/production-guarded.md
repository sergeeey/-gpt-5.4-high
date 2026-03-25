# Production Guarded Profile

Use for:

- incident response
- live operational diagnostics
- production-adjacent troubleshooting with possible writes

Allowed classes:

- read-only observability by default
- production writes only with explicit approval

Required safeguards:

- human approval before any production write
- explicit rollback or containment path
- verify side effects after action
- keep the tool surface narrower than usual
