# Repo Write Profile

Use for:

- draft PR creation
- issue comment workflows
- controlled repository automation

Allowed classes:

- everything in core-readonly
- bounded repository writes tied to explicit user intent

Required safeguards:

- write only to the intended repository
- do not merge or delete by default
- verify the resulting artifact after write
