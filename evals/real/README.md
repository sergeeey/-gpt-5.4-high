# Real Eval Templates

This directory is for real, task-specific eval sets.

Unlike `evals/datasets/`, these files should represent real workflows you care about.

Recommended fields:

- `id`
- `workflow`
- `input`
- `expected_outcome`
- `must_do`
- `must_not_do`
- `risk_class`
- `notes`

Operating rules:

- keep synthetic examples clearly separated from real evals
- version the eval set when prompts or tool policy change materially
- do not replace a failed case with an easier one just to improve scores
