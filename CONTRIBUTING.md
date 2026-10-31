# 参与贡献

[English](CONTRIBUTING.en.md) · [项目首页](README.md)

欢迎修复问题、改善文档和翻译、补充测试，或开发插件。先找到相关 Issue；影响协议、数据格式或权限行为的较大改动，先说明问题和方案，便于协调。

## 提交问题

使用仓库的 Bug 或功能建议模板。说明 App 版本、Android 版本、主机连接方式，以及可以重复的最小步骤。界面问题附截图或短视频；提交前检查并遮盖隐私信息。

涉及凭据泄漏、越权访问、未授权操作或其他安全问题，请按 [SECURITY.md](SECURITY.md) 私密报告。

## 准备开发环境

按 [README](README.md) 完成工具链与运行时准备。普通 App 开发不需要维护者的签名密钥、内测通道令牌或生产部署凭据。

- Flutter/Dart：使用仓库对应的 Flutter 版本和 App 的 Dart SDK 要求。
- Android：JDK 17，运行时 ABI 与 APK flavor 匹配。
- 插件 SDK：Node.js 22.19 或更新版本。SDK 在 `sdk/plugin-kit/` 内使用，尚未发布到 npm。

## 修改范围

让一个 PR 解决一个可以单独审阅的问题。修复时说明原来的行为、触发条件和改后的行为；避免夹带无关重命名、格式化和目录调整。

- UI 文案按现有中文、英文和巴西葡萄牙语结构维护，优先使用项目已有组件和图标。
- 对行为改动补充能覆盖问题的测试；仅改文字或布局时，给出相应检查或截图即可。
- 修改客户端、桥接或插件协议时，同时检查兼容性和另一端的调用方。
- 不手工编辑生成文件；修改其源文件并运行对应生成器。
- 新增或移植第三方内容时，说明项目、版本或提交、源文件和许可证，并保留必要的署名、许可及修改说明。确认来源条款与目标目录许可兼容；移动文件不会自动改变许可。

## 常用检查

以下命令从仓库根目录运行。按改动范围选择；在 PR 中写明实际执行的命令和结果。缺少设备、资源或依赖时，明确写“未运行”和原因。

**Flutter 应用：**

```bash
(cd app && flutter pub get && flutter analyze && flutter test)
```

**Dart 通信包：**

```bash
(cd packages/dsh_client && dart pub get && dart analyze && dart test)
(cd packages/dsh_remote && dart pub get && dart analyze && dart test)
```

**插件 SDK：**

```bash
(cd sdk/plugin-kit && npm install && npm test)
```

SDK 的类型检查需要开发依赖 TypeScript；未安装时，相应测试会跳过。请检查测试输出，不能将跳过写成通过。生成器与同步顺序见 [SDK 维护说明](sdk/plugin-kit/README.md)。

**界面文案：** 修改 `app/lib/l10n/parts/` 的中文、英文和巴西葡萄牙语 ARB，再生成并检查：

```bash
python3 app/tool/l10n_merge.py
python3 app/tool/l10n_merge.py --check
```

**用户指南：** 修改 `docs/guide/`，同步 App 内置的教学技能：

```bash
python3 app/tool/guide_sync.py
python3 app/tool/guide_sync.py --check
```

**插件教学技能：** 修改 `sdk/plugin-kit/skill/` 或 SDK 对应输入，再同步：

```bash
node sdk/plugin-kit/scripts/sync-skill.mjs
node sdk/plugin-kit/scripts/sync-skill.mjs --check
```

需要 APK 验证时，使用 README 中的构建入口。涉及 Android 进程、PRoot、直接启动、手机操控或更新安装的改动，应说明测试的 ABI、Android 版本、启动方式和设备；桌面测试结果不能替代真机结果。

`services/` 和 `infra/` 的线上检查、部署和发布脚本不属于普通贡献检查。修改配套服务时，先确认测试目标是自己的本地环境；不要用生产凭据运行示例。

## 提交 PR

填写默认 PR 模板，用中文或英文均可：

1. 问题是什么，为什么需要改，以及改后的行为。
2. 关联 Issue、主要受影响模块与兼容性影响。
3. 实际运行的检查、结果和未验证范围。
4. UI 改动的前后截图或录屏；使用测试数据，遮盖个人内容。
5. 新引入内容的来源、许可证和必须同步的声明。

提交前检查差异，排除密钥、个人配置、真实对话、设备序列号、构建缓存与私有运维资料。诊断包和日志也需要人工检查；不要把自动打码当成保证。

评论请围绕问题、证据和实现，尊重不同使用环境。使用 AI 辅助的改动也需要由提交者读懂、验证并承担维护责任。
