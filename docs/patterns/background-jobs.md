# Background Jobs Pattern

Use this pattern when a request may run longer than a normal synchronous wait window.

## Why

OpenAI documents background mode as the asynchronous path for long-running tasks and notes that developers can poll response objects for status over time.

Source:

- https://developers.openai.com/api/docs/guides/background

## Good use cases

- deep reasoning requests
- multi-step tool trajectories
- long synthesis over large corpora
- agent loops where completion time is unpredictable

## Pattern

1. Send the request with `background: true`.
2. Persist the response ID.
3. Poll for status until completion or failure.
4. Fetch the final result and any tool outputs.
5. Record whether the job completed, timed out, or failed.

## Important caveat

Background mode is not Zero Data Retention compatible because response data is stored temporarily for polling.

## Operating rule

Do not use background mode by reflex.
Use it when duration uncertainty is high or when reliability matters more than interactive immediacy.
