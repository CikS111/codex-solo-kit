[简体中文](../zh-CN/getting-started.md)

# Getting Started

## Install

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

## What gets installed

- Curated skills into `~/.codex/skills`
- Workflows into `~/.codex/workflows`
- A managed global rules block into `~/.codex/AGENTS.md`

## Rollback

```powershell
powershell -ExecutionPolicy Bypass -File .\uninstall.ps1 -Rollback
```

## Export for migration

```powershell
powershell -ExecutionPolicy Bypass -File .\export.ps1
```
