# Personal Codex Global Rules

These rules apply across my projects unless a project-level `AGENTS.md` says otherwise.

## Working Style

- For complex tasks, plan before making edits. Restate the goal, list assumptions, and identify the files likely to change.
- Prefer the smallest effective change over broad rewrites.
- Read existing code and project structure before introducing new patterns.
- If requirements are unclear or contradictory, point that out clearly instead of guessing.
- After finishing meaningful work, summarize what changed, what remains risky, and how it was verified.

## Structure

- Organize code by feature or domain when practical.
- Avoid oversized files, classes, or components when a focused split would improve clarity.
- Reuse existing abstractions before adding new layers.

## Errors And Reliability

- Do not swallow errors silently.
- Handle failure paths explicitly for network, file, permission, async, and user-input flows.
- Show user-facing errors in a clear way, and keep implementation details in logs or diagnostics.

## Input And Safety

- Validate external inputs at system boundaries: user input, network responses, files, config, and third-party outputs.
- Never hardcode secrets, tokens, or passwords.
- Avoid leaking sensitive information in logs, errors, screenshots, or committed files.
- For authentication, authorization, payments, privacy, and destructive actions, slow down and double-check assumptions.

## Verification

- After code changes, run the relevant formatter, linter, type checker, build, and tests when available.
- If a verification step cannot be run, say so explicitly and explain why.
- Review the final diff before considering a task complete.

## Skill Usage

- Use `/plan` for larger changes or multi-step work.
- Use `/orchestrate` for full feature work that should go through planning, implementation, review, and verification.
- Use `/code-review` after non-trivial changes.
- Use `/verify` before commit, release, or handoff.

## Multi-Platform Reminder

- Keep platform-specific behavior isolated when possible.
- Prefer adding project-level or platform-level rules for web, desktop, iOS, Android, and backend specifics rather than overloading the global rules.
