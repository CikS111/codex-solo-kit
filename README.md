[English](./README.md) | [简体中文](./README.zh-CN.md)

# codex-solo-kit

A curated Codex toolkit for solo developers building across web, desktop, iOS, Android, and backend services.

## What It Includes

- 17 curated skills for a practical solo development setup
- 6 workflows kept as the core day-to-day development loop
- A practical global `AGENTS` block for solo multi-platform work
- PowerShell scripts for install, uninstall, rollback, and migration export

## Why This Exists

This repository is inspired by:

- [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)
- [Luohaothu/everything-codex](https://github.com/Luohaothu/everything-codex)

`codex-solo-kit` focuses on a lighter pack for personal product builders who want a stable Codex workflow across multiple platforms.

## Quick Start

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

Installed targets:

- Skills: `~/.codex/skills`
- Workflows: `~/.codex/workflows`
- Global rules: appended as a managed block in `~/.codex/AGENTS.md`

## Language Switch

- English docs: [docs/en/getting-started.md](./docs/en/getting-started.md)
- Chinese docs: [docs/zh-CN/getting-started.md](./docs/zh-CN/getting-started.md)
- Publishing guide: [docs/en/publishing.md](./docs/en/publishing.md)

## Included Workflows

- `plan`
- `tdd`
- `code-review`
- `orchestrate`
- `refactor-clean`
- `verify`

## Included Skills

- `architect`
- `backend-patterns`
- `build-fix`
- `checkpoint`
- `code-review`
- `doc-updater`
- `e2e`
- `frontend-patterns`
- `orchestrate`
- `plan`
- `refactor-clean`
- `security-review`
- `sessions`
- `setup-pm`
- `tdd`
- `test-coverage`
- `verify`

## Rollback And Migration

- Uninstall: `powershell -ExecutionPolicy Bypass -File .\uninstall.ps1`
- Rollback: `powershell -ExecutionPolicy Bypass -File .\uninstall.ps1 -Rollback`
- Export migration zip: `powershell -ExecutionPolicy Bypass -File .\export.ps1`

Runtime state is stored in `~/.codex/.codex-solo-kit`.

## Repository Layout

```text
codex-solo-kit/
|- AGENTS.global.md
|- install.ps1
|- uninstall.ps1
|- export.ps1
|- skills/
|- workflows/
|- docs/
|- examples/
|- LICENSE
\- NOTICE.md
```

## License

MIT. See [LICENSE](./LICENSE).

## Notice

See [NOTICE.md](./NOTICE.md) for attribution and upstream inspiration.
