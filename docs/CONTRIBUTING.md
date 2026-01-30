# 贡献指南

感谢你对 **OpenClaw 汉化发行版** 的关注！

## 关于 OpenClaw

[OpenClaw](https://openclaw.ai/) 是由 Peter Steinberger 创建的**开源个人 AI 助手平台**，在 GitHub 上拥有 100,000+ Stars。它可以：

- 🖥️ 运行在你的机器上（Mac/Windows/Linux）
- 💬 通过 WhatsApp/Telegram/Discord/Slack 等聊天应用交互
- 🧠 拥有持久记忆，成为专属于你的 AI
- 🌐 控制浏览器、读写文件、执行命令
- 🔌 支持技能插件扩展

本项目的目标是将 OpenClaw 的 CLI 界面汉化，让中文用户获得更好的使用体验。

---

## 如何贡献

### 1. 报告问题

如果你发现翻译错误或遗漏，请通过 [Issues](https://github.com/1186258278/OpenClawChineseTranslation/issues) 提交。

### 2. 改进翻译

#### 准备工作

```bash
# 克隆项目
git clone https://github.com/1186258278/OpenClawChineseTranslation.git
cd OpenClawChineseTranslation

# 克隆上游 OpenClaw
git clone https://github.com/openclaw/openclaw.git openclaw
```

#### 翻译文件结构

```
translations/
├── config.json          # 主配置（定义模块和文件映射）
├── cli/                 # CLI 界面
│   ├── banner.json      # 启动横幅
│   └── tagline.json     # 标语
├── wizard/              # 初始化向导
│   ├── onboarding.json  # 引导流程
│   └── security.json    # 安全警告
└── commands/            # 命令帮助
    ├── auth-choice.json # 认证选择
    └── helpers.json     # 帮助信息
```

#### 翻译格式

每个 JSON 文件包含一个 `translations` 数组：

```json
{
  "file": "src/cli/banner.ts",
  "description": "CLI 横幅标题",
  "translations": [
    {
      "original": "🦞 OpenClaw",
      "translated": "🦞 OpenClaw 中文版",
      "context": "主标题"
    }
  ]
}
```

字段说明：
- `original`: 原始英文字符串（必须精确匹配）
- `translated`: 翻译后的中文
- `context`: 上下文说明（可选）

#### 验证翻译

```bash
# 预览效果（不修改文件）
npm run cli -- apply --dry-run

# 验证所有翻译
npm run cli -- verify
```

#### 提交 PR

1. Fork 本项目
2. 创建分支：`git checkout -b fix/typo-in-onboarding`
3. 修改翻译文件
4. 运行验证：`npm run cli -- verify`
5. 提交更改
6. 创建 Pull Request

---

## 翻译规范

详见 [TRANSLATION_GUIDE.md](TRANSLATION_GUIDE.md)

### 核心原则

1. **保持一致性** - 同一术语使用统一翻译
2. **保留技术术语** - API、CLI、Token 等保持英文
3. **保持格式** - 不改变占位符、换行、空格
4. **简洁准确** - 避免冗长，符合中文习惯

---

## 行为准则

- 尊重他人
- 接受建设性批评
- 专注于改进项目

---

## 联系我们

- GitHub Issues: [提交问题](https://github.com/1186258278/OpenClawChineseTranslation/issues)
- 官网: https://openclaw.qt.cool/
- 公司官网: https://qingchencloud.com/

感谢你的贡献！🦞
