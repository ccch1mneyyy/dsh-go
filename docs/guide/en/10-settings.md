# Settings

Tap the gear at the bottom of the chat list to open Settings; touch and hold it to search right away. The round button beside it opens All features, which ends with shortcuts to settings. In Web mode, tap the app logo and choose **App settings**.

<!-- nav: commonSettings -->
`Settings` · [Open](dshgo://open/settings)

Settings come in six groups, by what you want to do: AI, Capabilities, Appearance, General, Hosts, and Help and about. Each row that opens a page shows where it stands on the right.

## Search

Tap **Search settings** at the top and type a name or a common word, in English or Chinese: "dark", "keep alive", "don't ask", "api key". Renamed settings answer to their old names too. A result opens its page with the row marked. With no results, you can hand the question to the AI in a new chat.

## Top card

Shows your DeepSeek account or API key and balance; tap it to open your account. The line at the bottom shows this phone's engine; tap it to open the local engine page. If DSH isn't installed on this phone, you're not signed in and you're using a remote host, the card shows that host and opens the remote hosts page.

## AI

- **Models**: see [Models and providers](02-models.md).
- **Permissions**: how new chats run commands and change files; see Permissions below.
- **Personalization**:
  - **Personal preferences**: instructions for the AI; new chats follow them. Clear and save to remove them.
  - **Visual replies**: on by default; the AI on this phone's engine can answer with charts, comparisons and tappable options. Takes effect after the engine restarts; tap **Restart now** when asked.
  - **Agent presets**: how new chats work by default; you can also create, copy and edit presets.
  - The first two show only with this phone's engine.

## Capabilities

- **Phone control**: see [Phone control](04-phone-control.md).
- **Web search**: the current host's web search: fill in an API key, or switch to the **New search API**.
- **Plugins**: see [Plugins](08-plugins.md). Some plugins add their own rows below.
- **Images and video**: the current host's generation services, API keys and default models, from the image and video plugin; without the plugin you can **Install on this host**. How to use it: see [Chat](01-chat.md).

## Appearance

**Theme**, **Chat text size** and **Collapse steps when done**: see [Appearance](09-appearance.md). **Pets**: see [Pets](06-pets.md).

## General

- **Interface**: whether the app opens to **Native** or **Web**, and DSH Web's options; see [Web mode](05-web.md).
- **Language**: **System**, **简体中文**, **English** or **Português** (Brazilian Portuguese).
- **Notifications**: turn on **Allow notifications**, then choose **Turn complete**, **Error or stopped**, **Needs approval** and **Questions for you**. Alerts from remote hosts need the app running and the connection online. Sound, banners and the lock screen are set in system settings.
- **Voice input**: which recognition turns speech into text.
- **Performance**: **Auto**, **Full** or **Light**, plus glass blur and interface motion.
- **Background running**: see [FAQ](11-faq.md). Until it's set up, the row says so on the right.
- **Privacy and sharing**:
  - **My shared links**: see [Sharing and replay](07-sharing.md).
  - **Share configuration**: select the current host's settings, plugins, skills and personal preferences to share, and share them as a link, QR code or file.
  - **Send anonymous usage stats**: on by default, off anytime; see [FAQ](11-faq.md).
  - **Upload chat logs to DeepSeek**: shown when the current host has it.

## Hosts

- **Local engine** and **Remote host**: see [Engine and remote hosts](03-engine-hosts.md).
- **Engine parameters**: the current host's engine parameters. **Runtime** has **Subagent**, **Agent loop** and **Command execution**; **Plugins** has **Plugin inventory** and plugins' own settings. [Open](dshgo://open/engine-settings)

## Help and about

- **Help**: takes "what can this app do" to a new chat, where the AI answers from this guide. Not shown in Web mode.
- **Community**: chat groups and the forum.
- **Diagnostics**: see [FAQ](11-faq.md).
- **About DSH Go**:
  - **Version**: the app version, such as 0.9.2 (10251234), with the build number in parentheses. When there's a new version, this row on the Settings page says **Update available**.
  - **Check for updates**: when there's a new version, the update window opens. Read **What’s new**, tap **Update now**, and once the download is verified, tap **Install** and confirm in the system prompt. DSH Go closes to install; your chats and settings stay. To pass on a version, tap **Skip this version**. The first time, you'll need to allow DSH Go to install apps. If the installed app has a different signature (usually a test build), it can't be updated in place: uninstall it first, which erases your chats, Linux environment and settings.
  - **Check automatically**: on by default; checks when the app opens, at most once a day. A new version opens the update window, unless you're on another page or typing, in which case **Check for updates** shows it. Skipped versions aren't offered again, and nothing downloads or installs on its own.
  - **Open-source licenses**.

## Permissions

<!-- nav: commonSettings,featuresPermissions -->
`Settings › Permissions` · [Open](dshgo://open/permission)

- **Current chat**: shown with a chat open; changes that chat only.
- **Default for new chats**: **Read only**, **Workspace write** or **Full access**. Choosing **Full access** asks **Turn on Full access?** first. On this phone's engine it is what used to be "Auto-run commands": in chats and automations you create in the native interface on this phone's engine, the AI no longer asks before running commands or changing files. Remote hosts, Web mode, Safe mode and existing chats aren't affected. Switching back doesn't change chats created while it was on; change those in the chat's permissions.
- **Access phone files**: after you grant storage access, your phone's storage appears under /sdcard in Linux and the AI can read and write it. Turning it on or off restarts a running engine, interrupting replies in progress. Shown only with this phone's engine.
- **Phone control confirmation**: opens **Confirmation** on the Phone control page; see [Phone control](04-phone-control.md).
