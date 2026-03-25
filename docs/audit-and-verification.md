# Audit And Verification

This document records what is currently verified in the repository.

## Current verification surface

- JSON example payloads parse correctly.
- JSONL eval datasets parse correctly line by line.
- Python agent examples compile.
- JavaScript agent examples pass syntax check.
- Referenced OpenAI docs URLs resolve successfully.

## Verification entry point

Run:

```powershell
pwsh -File .\scripts\verify.ps1
```

## Why this matters

This repository is mostly methodology and examples.
That means many "bugs" are not runtime crashes, but quieter failures:

- stale capability claims
- malformed payloads
- invalid example datasets
- broken trust boundaries
- documentation that promises behavior the repo no longer reflects

The verification script is meant to catch the most likely failures early.

## Known limits

- It does not execute live OpenAI API calls.
- It does not run semantic eval grading.
- It does not validate every markdown sentence for truth.

Those still require human review and periodic source refresh.
