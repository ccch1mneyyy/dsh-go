package io.github.ccch1mneyyy.dsh_app.phone

import android.app.Activity
import android.app.Dialog
import android.content.Context
import android.content.res.ColorStateList
import android.content.res.Configuration
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.RippleDrawable
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.view.Gravity
import android.view.MotionEvent
import android.view.View
import android.view.Window
import android.view.WindowManager
import android.view.accessibility.AccessibilityManager
import android.view.accessibility.AccessibilityNodeInfo
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import io.github.ccch1mneyyy.dsh_app.R
import io.github.ccch1mneyyy.dsh_app.i18n.AppStrings
import io.github.ccch1mneyyy.dsh_app.phone.a11y.InjectGuard

/** Fixed application chrome; request text is never parsed as markup, links or actions. */
internal object PhonePromptUi {
    fun title(ctx: Context, kind: PromptKind): String = AppStrings.get(ctx, when (kind) {
        PromptKind.APPROVAL -> R.string.phone_prompt_approval_title
        PromptKind.REVIEW -> R.string.phone_prompt_review_title
        PromptKind.NATIVE_CONFIRM -> R.string.phone_prompt_native_title
        PromptKind.HANDOFF -> R.string.phone_prompt_handoff_title
    })

    /** The card's title: a handoff behind a hard rule names the rule (「密码和验证码需要你来输入」). */
    fun title(ctx: Context, content: PromptContent): String =
        content.cause?.let { "DSH Go · " + handoffCause(ctx, it) } ?: title(ctx, content.kind)

    fun handoffCause(ctx: Context, cause: HandoffCause): String = AppStrings.get(ctx, when (cause) {
        HandoffCause.SECRET -> R.string.overlay_handoff_secret
        HandoffCause.SYSTEM -> R.string.overlay_handoff_system
        HandoffCause.DENY_LIST -> R.string.overlay_handoff_deny_list
    })

    fun label(ctx: Context, choice: PromptChoice): String = AppStrings.get(ctx, when (choice) {
        PromptChoice.ALLOW_ONCE -> R.string.phone_prompt_allow_once
        PromptChoice.ALLOW_APP -> R.string.phone_prompt_allow_app
        PromptChoice.ALLOW_TASK -> R.string.phone_prompt_allow_task
        PromptChoice.REJECT -> R.string.phone_prompt_reject
        PromptChoice.OPEN -> R.string.phone_prompt_open
        PromptChoice.LATER -> R.string.phone_prompt_later
        PromptChoice.STOP -> R.string.phone_prompt_stop
        PromptChoice.CONTINUE -> R.string.phone_prompt_continue
    })

    fun card(ctx: Context, p: PromptPresentation): View {
        val dark = ctx.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK == Configuration.UI_MODE_NIGHT_YES
        val bg = if (dark) 0xFF232730.toInt() else 0xFFFBFCFF.toInt()
        val ink = if (dark) 0xFFE6E9F0.toInt() else 0xFF1E232E.toInt()
        val accent = if (dark) 0xFF97B1F0.toInt() else 0xFF4B67B4.toInt()
        val onAccent = if (dark) 0xFF121C34.toInt() else Color.WHITE
        val main = Handler(Looper.getMainLooper())
        val card = LinearLayout(ctx).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(ctx, 18), dp(ctx, 16), dp(ctx, 18), dp(ctx, 16))
            background = GradientDrawable().apply { setColor(bg); cornerRadius = dp(ctx, 20).toFloat() }
            // No filterTouchesWhenObscured on the card: it drops every touch inside the card when the
            // system marks the overlay obscured, which is what a landscape game or another app in
            // front produces — approvals then never reached 允许 / 拒绝 (PromptInputPolicy).
        }
        card.addView(TextView(ctx).apply {
            text = title(ctx, p.ticket.content)
            textSize = 14f; setTextColor(ink); typeface = Typeface.DEFAULT_BOLD
            setPadding(0, 0, 0, dp(ctx, 8))
        })
        // Keep attribution outside the scroll area, including short landscape windows/large text.
        val content = LinearLayout(ctx).apply { orientation = LinearLayout.VERTICAL }
        content.addView(TextView(ctx).apply {
            text = p.ticket.content.text
            textSize = 16f; setTextColor(ink); setLineSpacing(0f, 1.2f)
            setPadding(0, 0, 0, dp(ctx, 12))
        })
        val time = TextView(ctx).apply { textSize = 12f; setTextColor(ink); setPadding(0, 0, 0, dp(ctx, 12)) }
        content.addView(time)
        val tick = object : Runnable {
            override fun run() {
                if (!p.live) return
                time.text = AppStrings.get(ctx, R.string.phone_prompt_remaining, ((p.ticket.remainingMs + 999) / 1000).toInt())
                main.postDelayed(this, 500)
            }
        }
        tick.run()
        p.ticket.onFinished { main.removeCallbacks(tick) }
        val armedAt = SystemClock.elapsedRealtime() + 600
        for (choice in p.ticket.content.choices) {
            val primary = choice in setOf(PromptChoice.ALLOW_ONCE, PromptChoice.ALLOW_APP, PromptChoice.ALLOW_TASK,
                PromptChoice.OPEN, PromptChoice.CONTINUE)
            val b = PromptButton(ctx, armedAt, p).apply {
                text = label(ctx, choice)
                textSize = 15f; typeface = Typeface.DEFAULT_BOLD
                setTextColor(if (primary) onAccent else ink)
                minimumHeight = dp(ctx, 48); minimumWidth = dp(ctx, 48)
                setPadding(dp(ctx, 16), dp(ctx, 10), dp(ctx, 16), dp(ctx, 10))
                background = RippleDrawable(ColorStateList.valueOf(if (dark) 0x2297B1F0 else 0x224B67B4),
                    GradientDrawable().apply {
                        cornerRadius = dp(ctx, 14).toFloat()
                        setColor(if (primary) accent else bg)
                        if (!primary) setStroke(dp(ctx, 1), ink)
                    }, null)
                setOnClickListener { p.choose(choice) }
            }
            content.addView(b, LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT).apply { topMargin = dp(ctx, 8) })
        }
        val max = (ctx.resources.displayMetrics.heightPixels * 0.72).toInt().coerceAtLeast(dp(ctx, 80))
        card.addView(object : ScrollView(ctx) {
            override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
                val limit = minOf(max, if (MeasureSpec.getMode(heightMeasureSpec) == MeasureSpec.UNSPECIFIED) max else MeasureSpec.getSize(heightMeasureSpec))
                super.onMeasure(widthMeasureSpec, MeasureSpec.makeMeasureSpec(limit, MeasureSpec.AT_MOST))
            }
        }.apply { addView(content); isFillViewport = false },
            LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT))
        return card
    }

    fun showDialog(activity: Activity, p: PromptPresentation): (() -> Unit)? {
        if (!p.live || activity.isFinishing || activity.isDestroyed || !AppVisibility.isResumed(activity)) return null
        val dialog = Dialog(activity)
        return try {
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
            dialog.setContentView(card(activity, p))
            dialog.setCanceledOnTouchOutside(false)
            dialog.setOnCancelListener { if (p.live) p.ticket.dismiss() }
            dialog.window?.apply {
                setBackgroundDrawableResource(android.R.color.transparent)
                addFlags(WindowManager.LayoutParams.FLAG_SECURE)
            }
            dialog.show()
            dialog.window?.setLayout(minOf(activity.resources.displayMetrics.widthPixels - dp(activity, 24), dp(activity, 472)),
                WindowManager.LayoutParams.WRAP_CONTENT)
            if (!p.markShown()) { dialog.dismiss(); null } else ({ runCatching { dialog.dismiss() } })
        } catch (_: Exception) {
            runCatching { dialog.dismiss() }
            null
        }
    }

    private fun dp(ctx: Context, value: Int) = (ctx.resources.displayMetrics.density * value).toInt()

    /** Same injected-input boundary as ControlOverlay, also used by the Activity fallback. */
    private class PromptButton(ctx: Context, private val armedAt: Long, private val p: PromptPresentation) : TextView(ctx) {
        private val a11y = ctx.getSystemService(AccessibilityManager::class.java)
        private var rejected = false
        init { isClickable = true; isFocusable = true; gravity = Gravity.CENTER }

        override fun dispatchTouchEvent(event: MotionEvent): Boolean {
            if (event.actionMasked == MotionEvent.ACTION_DOWN) {
                rejected = !PromptInputPolicy.allows(SystemClock.elapsedRealtime(), armedAt, p.live, InjectGuard.active(),
                    event.deviceId <= 0, event.flags and 0x800 != 0 || event.getToolType(0) == MotionEvent.TOOL_TYPE_UNKNOWN,
                    a11y.isTouchExplorationEnabled)
            }
            if (rejected) {
                if (event.actionMasked == MotionEvent.ACTION_UP || event.actionMasked == MotionEvent.ACTION_CANCEL) isPressed = false
                return true
            }
            return super.dispatchTouchEvent(event)
        }

        override fun performAccessibilityAction(action: Int, arguments: Bundle?): Boolean {
            if ((action == AccessibilityNodeInfo.ACTION_CLICK || action == AccessibilityNodeInfo.ACTION_LONG_CLICK) &&
                (!p.live || SystemClock.elapsedRealtime() < armedAt || InjectGuard.active() || !a11y.isTouchExplorationEnabled)) return false
            return super.performAccessibilityAction(action, arguments)
        }
    }
}
