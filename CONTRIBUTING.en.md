# Contributing

[中文](CONTRIBUTING.md) · [Project overview](README.en.md)

Contributions can fix bugs, improve documentation and translations, add tests, or extend plugins. Look for a related issue first. For larger changes to protocols, data formats or permissions, explain the problem and proposed approach before implementation so work can be coordinated.

## Report an issue

Use the repository's bug report or feature request template. Include the app version, Android version, host connection type and minimal repeatable steps. Add a screenshot or short recording for interface issues, after reviewing and redacting private information.

For credential exposure, unauthorized access or actions, and other security issues, follow [SECURITY.en.md](SECURITY.en.md) for private reporting.

## Set up development

Follow [README.en.md](README.en.md) to prepare the toolchain and runtime. Ordinary app development does not require the maintainer's signing key, beta-channel token or production deployment credentials.

- Flutter/Dart: use the repository's Flutter version and the app's Dart SDK requirement.
- Android: use JDK 17 and match the runtime ABI to the APK flavor.
- Plugin SDK: use Node.js 22.19 or later. The SDK is used from `sdk/plugin-kit/` and is not published to npm.

## Keep changes focused

Use one PR for one independently reviewable problem. Explain the old behavior, its trigger and the resulting behavior. Keep unrelated renames, formatting and directory moves out of the change.

- Maintain interface text in the existing Chinese, English and Brazilian Portuguese structure. Prefer existing components and icons.
- Add tests that cover behavior changes. For text or layout-only changes, provide relevant checks or screenshots.
- When changing a client, bridge or plugin protocol, check compatibility and the callers on the other side.
- Edit generator inputs, then regenerate their outputs.
- For new or adapted third-party content, record the project, version or commit, source files and license. Keep required attribution, license text and modification notices. Check compatibility with the destination directory's license. Moving a file does not change its license.

## Common checks

Run these commands from the repository root. Select checks relevant to your change and record the commands and actual results in the PR. If a device, asset or dependency is unavailable, say what was not run and why.

**Flutter app:**

```bash
(cd app && flutter pub get && flutter analyze && flutter test)
```

**Dart communication packages:**

```bash
(cd packages/dsh_client && dart pub get && dart analyze && dart test)
(cd packages/dsh_remote && dart pub get && dart analyze && dart test)
```

**Plugin SDK:**

```bash
(cd sdk/plugin-kit && npm install && npm test)
```

The SDK type check requires its TypeScript development dependency. That test is skipped when TypeScript is not installed. Review the output and distinguish a skip from a pass. See [SDK maintenance](sdk/plugin-kit/README.en.md) for generator and synchronization steps.

**Interface text:** edit the Chinese, English and Brazilian Portuguese ARB files in `app/lib/l10n/parts/`, then generate and check:

```bash
python3 app/tool/l10n_merge.py
python3 app/tool/l10n_merge.py --check
```

**User guide:** edit `docs/guide/`, then synchronize the app's bundled guide skill:

```bash
python3 app/tool/guide_sync.py
python3 app/tool/guide_sync.py --check
```

**Plugin authoring skill:** edit `sdk/plugin-kit/skill/` or the relevant SDK inputs, then synchronize:

```bash
node sdk/plugin-kit/scripts/sync-skill.mjs
node sdk/plugin-kit/scripts/sync-skill.mjs --check
```

For APK validation, use the build entry point in the README. For changes to Android processes, PRoot, direct startup, phone control or update installation, record the ABI, Android version, startup mode and device used. Desktop test results do not establish device behavior.

Online checks, deployments and publishing scripts under `services/` and `infra/` are not part of routine contribution checks. When changing a companion service, confirm that tests target your own local environment; do not run examples with production credentials.

## Open a PR

Complete the default PR template in Chinese or English:

1. The problem, why the change is needed and the resulting behavior.
2. Related issues, affected modules and compatibility effects.
3. Checks actually run, their results and remaining verification gaps.
4. Before-and-after screenshots or recordings for UI changes, using test data with private content removed.
5. Sources and licenses of new content, and any notices that must be updated.

Review the diff for credentials, personal configuration, real conversations, device serial numbers, build caches and private operations notes. Review diagnostic files and logs manually as well; automatic redaction is not a guarantee.

Keep discussion focused on problems, evidence and implementation, and respect different user environments. Contributors remain responsible for understanding, validating and maintaining AI-assisted changes.
