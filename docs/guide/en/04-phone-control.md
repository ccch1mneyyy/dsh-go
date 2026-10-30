# Phone control

Let DSH read the screen, tap and type to get things done on your phone. Pause or stop it anytime. Phone control works only with this phone's engine and isn't loaded in Safe mode.

## Turn it on

<!-- nav: commonSettings,hubSettingsPhoneControl -->
`Settings › Phone control` · [Open](dshgo://open/phone)

1. Turn on the switch at the top. The first time, you'll see what's read and where it goes; tap **Agree**. Turning it on or off restarts a running engine, interrupting any reply in progress.
2. Under **Setup**, tap **Turn on** next to **Accessibility service**, and turn on "DSH Phone Control" in Android's accessibility settings. If the switch won't turn on for a sideloaded app, tap **Accessibility switch disabled?** for brand-specific steps to allow restricted settings.
3. Tap **Turn on** next to **Notifications** and allow notifications in App info. Approvals and the stop button need them.
4. Tap **Read current screen** to see what DSH can read. This reading isn't sent to the model.

During a task, text on the screen is sent to the model you chose; with a vision model, a screenshot may be included. Some recognized card and ID numbers are masked where possible, but not all sensitive information can be guaranteed to be detected or hidden.

## Ask DSH to do something

Go back to a chat and say what you want done. While a task runs:

- Keep the screen on and unlocked. Turning the screen off stops the task.
- Passwords, verification codes, payments and system settings are up to you (unless you turn them on under Lift limits below). When a step needs you, **Your turn** appears; tap **Continue** when you're done. When one of these rules is the reason, the card's title says so, like **Passwords and codes are yours to enter** or **System settings are yours to change**.
- A task ends on its own when DSH makes no new move for 3 minutes.

Alarms, events, maps and sharing don't need the accessibility service.

## Floating bar

When a task starts, a floating bar appears at the top of the screen showing what DSH is doing, with **Pause**, **Stop** and **Collapse**:

- After **Pause**, the button reads **Continue**; tap it to let DSH carry on.
- Tap the text on the bar to steer: tell DSH to try another way.
- **Collapse** shrinks the bar to a ball at the screen edge; tap the ball to open it. Drag the ball anywhere; it snaps to the nearest edge and stays there next time.
- After 3 seconds untouched, the bar fades; touch it to bring it back. It stays clear whenever you need to approve something.

Adjust it under **Floating bar** on the phone control page (shown once phone control is on):

- **Idle opacity**: 30% to 100%, 70% by default. At 100% the bar never fades.
- **Collapse when idle**: off by default. When on, the bar shrinks to a ball after a few idle seconds, and opens by itself when you need to approve something.
- **Back to DSH Go when done**: on by default. When the reply ends and the app is in the background, it tries to bring you back to that chat. If the system blocks background windows, use the notification; see Confirmations and return below.

Whatever the settings, the bar closes when the reply ends.

## Stop

- **Stop** on the floating bar.
- **Stop** on the "Operating your phone" card on the phone control page.
- **Stop actions** on the engine notification. **Stop** on the same notification stops the whole engine.

Stopping phone control also stops every reply in progress on this phone's engine.

## Confirmation

<!-- nav: commonSettings,hubSettingsPhoneControl,phoneConfirmTitle -->
`Settings › Phone control › Confirmation`

- **Always ask** (default): asks before entering a new app, sending, deleting or paying.
- **This task**: asks once per task. Choose **Allow for task** on the approval card, and the rest of the task goes ahead.
- **Always skip**: acts without asking. Asks you to confirm before turning on.

When you pick Phone control during first-time setup, you choose once after agreeing to the disclosure: **Ask me at key steps** (Always ask) or **Fully automatic** (Always skip). You can change it here anytime.

An approval card left for 30 seconds counts as **Decline**. In every mode, system settings and permission pages, passwords and verification codes, and DSH Go itself stay with you unless turned on under **Lift limits**; apps set to Hands off are changed in **App rules**. Confirmation lists these, with links to both.

## Confirmations and return

<!-- nav: commonSettings,hubSettingsPhoneControl,phoneBackgroundGuideTitle -->
`Settings › Phone control › Confirmations and return`

Once phone control is on, this row is under **Advanced** on the phone control page; tap it to read the guidance again. **Open system settings** opens DSH Go's system App info page.

When a step needs your decision, DSH Go shows a card. If the card is unavailable, it tries a notification or returns to the app. Allow phone-control notifications and pop-up alerts in system settings. Some phones also offer a permission to display pop-up windows while running in the background; allowing it can help the app return. Menu names vary by system version.

If the app doesn't return after a task finishes, tap **Task complete · View result** in the notification. If the system blocks notifications or background windows, open DSH Go yourself to see the result. Turning on **Back to DSH Go when done** doesn't guarantee that the system will allow it.

## App rules

<!-- nav: commonSettings,hubSettingsPhoneControl,phoneAppRulesTitle -->
`Settings › Phone control › App rules`

Set each app to **Hands off**, **Every step** or **As usual**. Payment, banking and brokerage apps are **Hands off** by default, and WeChat is **Every step**. Unlisted apps work as usual, and sensitive actions still need approval. Loosening a rule explains the risk first; tap **Change anyway** to apply it. Tap **Add app** to add one by package name.

## Lift limits

<!-- nav: commonSettings,hubSettingsPhoneControl,phoneUnlockTitle -->
`Settings › Phone control › Lift limits` · [Open](dshgo://open/phone-unlocks)

All three are off by default, and each turns on separately:

- **System settings**: permissions, installers, security center, notifications.
- **Passwords and codes**: fill in passwords, verification and payment codes. The action log shows •••• and never what was typed.
- **DSH Go itself**: tap and type inside DSH Go.

Turning one on opens a page first: what AI can then do, what could go wrong, and the disclaimer below. Press and hold **I understand the risks, turn on** for about 1.5 seconds to apply it. Turning one off takes a single tap. Nothing can be turned on while a task is running. While any is on, the Phone control page and the floating bar show **Limits lifted**; tap it to come back here. Banking and payment apps aren't here; change them in **App rules**.

Disclaimer:

- After lifting a restriction, AI may perform permitted high-risk actions without step-by-step confirmation.
- AI may misread a screen or follow malicious instructions in pages, messages, or files.
- Your accounts, money, data, device, or privacy may be harmed. Review consequential actions and results.
- The software is provided as is. Liability limits apply only where permitted by law; mandatory rights remain.
- Enable temporarily only on an owned or authorized device. Do not test with real payment details on your primary phone.

Read the [full risk notice and disclaimer](https://github.com/ccch1mneyyy/dsh-Go/blob/main/DISCLAIMER.en.md) for more on authorization, data transmission, ADB/Shizuku and statutory rights.

## Action log and advanced

**Recent actions** logs every step, without screen contents. Tap **All actions** to see them. The log lasts until the app closes.

Under **Advanced**:

- **Non-disruptive mode**: works on a hidden screen while you use your phone. Needs Android 14 or later; choose **Use Shizuku** or **Direct ADB** and follow the setup. It needs Wi-Fi with Developer options and wireless debugging on, must be reactivated after restarting your phone, and the screen must still stay on and unlocked.
- **Background running**: prevents Android from turning off accessibility; opens the phone settings guide.
- **Confirmations and return**: see confirmations and task results in time; see Confirmations and return above.
