# DSH Go — Risk Notice and Disclaimer

[简体中文](DISCLAIMER.md) · [License](LICENSE) · [Security reporting](SECURITY.en.md)

> This notice applies to DSH Go distributed from this repository. It explains software risks and open-source terms, but is not a complete privacy policy or legal advice. Reading it does not waive statutory rights.

## 1. Independent project and authorized use

DSH Go is an independent community project built on open-source components. It is not an official product of DeepSeek, Google, Android, or any model provider. Third-party models, apps, plugins, and remote hosts have their own terms.

Use it only with devices, accounts, data, and services you own or are expressly authorized to access. Do not use Accessibility, ADB/Shizuku, plugins, or remote access for surveillance, unauthorized access or data collection, fraud, harassment, or bypassing security safeguards. Comply with applicable law, service terms, and the privacy rights of others.

## 2. Risks of AI phone control

When enabled and granted Android Accessibility permission, phone control can read interface text and elements, capture screenshots when supported, and perform taps, gestures, and text entry for tasks. Optional non-disruptive mode uses Shizuku or wireless ADB; debugging and privileged connections can increase the impact of unintended or unauthorized device access.

Passwords, codes, system settings, DSH Go screens, and some sensitive apps are **restricted by default**. Users can change confirmation settings, app rules, and individual “Lift limits” switches. Once restrictions are lifted, the AI may change permissions, install apps, enter verification codes, or initiate logins, purchases, transfers, or deletions without per-step confirmation.

AI can misunderstand a request, select an incorrect element, act after the interface changes, or follow malicious instructions embedded in pages, messages, documents, or plugins (prompt injection). Default restrictions, confirmations, action logs, masking, and stop controls reduce risks but cannot guarantee that every error or malicious action will be prevented.

**Do not use unattended phone control for payments, banking, trading, account security, emergencies, or other high-impact actions.** Test with non-sensitive accounts, back up data, and personally review consequential actions and results.

## 3. Screen data and third-party services

An engine running on the device does not mean model inference stays on the device. Depending on configuration, prompts, task feedback, screen text, screenshots, and files may go to your chosen model provider, remote host, or enabled third-party plugins and services. Screens may include contacts, messages, photos, notifications, verification codes, identification documents, or account details.

The app attempts to mask certain recognized card and identity numbers and sensitive inputs, and may suppress screenshots, but detection is incomplete. **Not every sensitive detail can be guaranteed to be detected, masked, or blocked from transmission.** Review the selected provider's privacy and retention terms, close sensitive screens, and do not expose third-party data without authorization.

“Send anonymous usage statistics” is currently on by default and can be disabled during onboarding or under Settings → Privacy and sharing. It uses a rotating random identifier. See [Troubleshooting](docs/guide/en/11-faq.md) for its disclosed fields and opt-out behavior. Shared links, diagnostics, and plugins may have separate data flows. This notice is not a substitute for a privacy policy or consent required by law.

## 4. Recommended precautions

- Prefer per-action approval, keep sensitive apps excluded, and disable lifted limits, Accessibility, and wireless debugging when unnecessary.
- Do not test real payment passwords or verification codes using daily-use devices or financial accounts.
- Personally review messages, publication, purchases, deletions, and changes to system settings; revoke temporary permissions after a task.
- Use trusted model endpoints and plugins; protect API keys, SSH credentials, and ADB pairing data.

## 5. No warranty, limited liability, and mandatory rights

DSH Go is provided under [AGPL-3.0](LICENSE), whose sections 15–17 contain warranty and liability limitations subject to applicable law. Unless the law requires otherwise or there is an enforceable written agreement, the software is provided “as is,” without guarantees of correct actions, continuous availability, complete safety, or fitness for a particular purpose.

To the fullest extent permitted by applicable law, maintainers and contributors are not liable for indirect, incidental, special, or consequential losses arising from the software, AI output, automated actions, or third-party services. **Nothing here excludes liability that cannot legally be excluded, including legally non-excludable personal injury or intentional or grossly negligent harm, or removes statutory rights.** In-app “Agree” and “I understand the risks, turn on” controls acknowledge disclosures and enable a capability, not a waiver of mandatory rights.

Report credential exposure, unauthorized device actions, or approval bypasses privately under [Security reporting](SECURITY.en.md).

*Updated: 2026-10-30*
