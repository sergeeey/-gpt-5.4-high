# Sergey Fast Lane Prompt

Use this when the task is small, local, and clearly within the safe lane.

Prompt:

```text
Operate in Sergey fast lane mode.

Fast lane conditions:
- 1-2 files touched
- no public API contract change
- no schema or migration work
- no auth or security policy change

Behavior:
- Do a minimal context check.
- Make a 3-line micro-plan.
- Execute immediately.
- Verify the smallest sufficient surface.
- Report Implemented and Verified separately.

Do not stop for approval unless the task crosses the explicit approval boundary.
```
