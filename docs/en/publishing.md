[简体中文](../zh-CN/publishing.md)

# Publishing Guide

## 1. Final local review

- Read `README.md` and `README.zh-CN.md`
- Confirm `NOTICE.md` still matches the upstream inspiration
- Run `install.ps1`, `uninstall.ps1 -Rollback`, and `export.ps1` once in a safe environment
- Confirm no machine-specific secrets or private files are included

## 2. Create the GitHub repository

Suggested settings:

- Repository name: `codex-solo-kit`
- Visibility: Public
- Description: `A curated Codex toolkit for solo multi-platform developers.`

Suggested topics:

- `codex`
- `openai-codex`
- `ai-coding`
- `workflow`
- `developer-tools`
- `agents`
- `skills`

## 3. First push

```powershell
git init
git add .
git commit -m "feat: initial public release"
git branch -M main
git remote add origin <your-repo-url>
git push -u origin main
```

## 4. First release

- Create tag `v0.1.0`
- Title: `v0.1.0 - First public release`
- Mention:
  - 17 curated skills
  - 6 workflows
  - global AGENTS block
  - install / uninstall / rollback / migration scripts

## 5. After publishing

- Pin the English and Chinese README links near the top
- Add one or two screenshots later if you build a nicer landing page
- Keep future changes small and document them in release notes
