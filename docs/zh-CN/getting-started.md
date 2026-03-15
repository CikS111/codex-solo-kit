[English](../en/getting-started.md)

# 快速开始

## 安装

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

## 会安装什么

- 精选 skills 到 `~/.codex/skills`
- workflows 到 `~/.codex/workflows`
- 一段受管的全局规则块到 `~/.codex/AGENTS.md`

## 回滚

```powershell
powershell -ExecutionPolicy Bypass -File .\uninstall.ps1 -Rollback
```

## 导出迁移包

```powershell
powershell -ExecutionPolicy Bypass -File .\export.ps1
```
