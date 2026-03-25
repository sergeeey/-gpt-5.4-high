# MCP Approval Policy

This policy is tailored for an execute-first workflow with explicit safety boundaries.

## No approval required

Allowed without pausing when all of the following are true:

- action is read-only
- task stays within the intended workspace or system boundary
- no secrets are created, rotated, or exposed
- no production side effects exist

Examples:

- read repository files
- inspect issues and PRs
- search docs
- read dashboards and logs

## Ask before proceeding

Approval is required when any of these are true:

- external write
- destructive or hard-to-reverse operation
- production or account impact
- permission or access change
- secret creation, rotation, or exposure risk
- schema or irreversible data operation

Examples:

- comment on behalf of the user in a live system
- merge a PR
- create or modify alerts in production
- rotate credentials
- perform writes outside the intended repo or task scope

## Reporting rule

For any MCP write:

- say what was changed
- say where it was changed
- say how it was verified
