[English](./README.md) | [简体中文](./README.zh-CN.md)

# codex-solo-kit

一个面向个人开发者的精选 Codex 工具包，适合同时开发 Web、桌面端、iOS、Android 和后端服务的场景。

## 包含内容

- 17 个适合个人开发日常使用的 skills
- 保留为主开发闭环的 6 个 workflows
- 一份更适合个人多端开发者的全局 `AGENTS` 规则块
- 支持安装、卸载、回滚、迁移导出的 PowerShell 脚本

## 为什么做这个项目

这个仓库受到以下项目启发：

- [affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)
- [Luohaothu/everything-codex](https://github.com/Luohaothu/everything-codex)

`codex-solo-kit` 面向个人产品开发者，提供一套更轻、更稳、更容易迁移的 Codex 工作流包。

## 快速开始

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

安装目标：

- Skills：`~/.codex/skills`
- Workflows：`~/.codex/workflows`
- 全局规则：以受管区块的方式追加到 `~/.codex/AGENTS.md`

## 文档切换

- 英文文档：[docs/en/getting-started.md](./docs/en/getting-started.md)
- 中文文档：[docs/zh-CN/getting-started.md](./docs/zh-CN/getting-started.md)
- 发布指南：[docs/zh-CN/publishing.md](./docs/zh-CN/publishing.md)

## 内置 Workflows

- `plan`
- `tdd`
- `code-review`
- `orchestrate`
- `refactor-clean`
- `verify`

## 内置 Skills

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

## 回滚与迁移

- 卸载：`powershell -ExecutionPolicy Bypass -File .\uninstall.ps1`
- 回滚：`powershell -ExecutionPolicy Bypass -File .\uninstall.ps1 -Rollback`
- 导出迁移包：`powershell -ExecutionPolicy Bypass -File .\export.ps1`

运行期状态保存在 `~/.codex/.codex-solo-kit`。

## 仓库结构

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

## 协议

MIT，见 [LICENSE](./LICENSE)。

## 致谢

来源和归属说明见 [NOTICE.md](./NOTICE.md)。
