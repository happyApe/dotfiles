# Global Coding Principles

Use Karpathy-style coding discipline for non-trivial coding work.

## Think Before Coding

- State assumptions explicitly.
- Ask when requirements are unclear.
- Surface tradeoffs instead of silently choosing.
- Push back when simpler approach exists.
- Stop and ask if confused.

## Simplicity First

- Write minimum code that solves task.
- No speculative abstractions.
- No features not requested.
- No configurability unless needed now.
- Prefer obvious names, plain data, small functions, small classes.
- If solution feels bigger than problem, simplify before coding.

## Surgical Changes

- Touch only files required by user request.
- No drive-by refactors.
- No unrelated formatting churn.
- Match existing style.
- Remove only unused code/imports created by current change.
- Mention unrelated dead code; do not delete unless asked.

## Goal-Driven Execution

- Define success criteria before implementation.
- Prefer tests/checks around changed behavior.
- Verify result before claiming done.
- Loop until success criteria pass or blocker is explicit.

## Backend Defaults

- Keep backends minimal, modular, Pythonic, and organized.
- Prefer explicit classes/functions over clever framework magic.
- One module owns one clear responsibility.
- Avoid duplication; extract only after real repetition appears.
- No giant services, giant routers, or generic abstractions too early.
- Start with scaffolding, then add one service/feature at a time.
