[English](../en/publishing.md)

# 发布指南

## 1. 本地最终检查

- 通读 `README.md` 和 `README.zh-CN.md`
- 确认 `NOTICE.md` 中的上游来源说明仍然准确
- 在安全环境里跑一遍 `install.ps1`、`uninstall.ps1 -Rollback` 和 `export.ps1`
- 确认仓库里没有机器专属文件、私密信息或密钥

## 2. 创建 GitHub 仓库

建议配置：

- 仓库名：`codex-solo-kit`
- 可见性：公开
- 描述：`A curated Codex toolkit for solo multi-platform developers.`

建议 topics：

- `codex`
- `openai-codex`
- `ai-coding`
- `workflow`
- `developer-tools`
- `agents`
- `skills`

## 3. 首次推送

```powershell
git init
git add .
git commit -m "feat: initial public release"
git branch -M main
git remote add origin <你的仓库地址>
git push -u origin main
```

## 4. 第一个 Release

- 创建标签 `v0.1.0`
- 标题：`v0.1.0 - First public release`
- 内容建议写：
  - 17 个精选 skills
  - 6 个 workflows
  - 全局 AGENTS 规则块
  - 安装 / 卸载 / 回滚 / 迁移脚本

## 5. 发布后建议

- 在 README 顶部保留中英文切换链接
- 如果以后做更完整的展示页，可以再补截图
- 后续更新尽量保持小步提交，并在 release notes 里说明变化
