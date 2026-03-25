# Prompt Library

This directory contains reusable prompt blocks for GPT-5.4 workflows.

The operating rule is simple:

- keep prompts as small as possible
- add blocks only when they fix a measured failure mode
- prefer composable blocks over one giant system prompt

Primary source:

- https://developers.openai.com/api/docs/guides/prompt-guidance

## Layout

- `blocks/` reusable building blocks
- `composed/` assembled prompts for common workflows

## Usage

1. Start with the smallest block set that can pass your evals.
2. Add blocks only when a real failure mode appears.
3. Re-run the same eval set after each prompt change.
