// Portions derived from Phase (https://github.com/CikeSeven/phase), used with the author's permission. See THIRD_PARTY_NOTICES.md.
// Local changes: a status pill at the top that folds into a side ball when left alone; separate
// confirm and handoff cards; buttons that refuse injected or obscured touches; pass-through and
// hide hooks for the Actuator and screenshots; blocking UserGate calls.

package io.github.ccch1mneyyy.dsh_app.phone.a11y

import io.github.ccch1mneyyy.dsh_app.i18n.AppStrings
import io.github.ccch1mneyyy.dsh_app.R
import android.accessibilityservice.AccessibilityService
import android.animation.Animator
import android.animation.AnimatorListenerAdapter
import android.animation.ValueAnimator
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.content.res.ColorStateList
import android.content.res.Configuration
import android.content.res.Resources
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.RippleDrawable
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.text.InputFilter
import android.text.InputType
import android.text.TextUtils
import android.util.DisplayMetrics
import android.util.Log
import android.util.TypedValue
import android.view.Gravity
import android.view.KeyEvent
import android.view.MotionEvent
import android.view.Surface
import android.view.View
import android.view.WindowInsets
import android.view.WindowManager
import android.view.accessibility.AccessibilityManager
import android.view.accessibility.AccessibilityNodeInfo
import android.view.animation.PathInterpolator
import android.view.inputmethod.EditorInfo
import android.view.inputmethod.InputMethodManager
import android.widget.EditText
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import io.github.ccch1mneyyy.dsh_app.phone.ConfirmRequest
import io.github.ccch1mneyyy.dsh_app.phone.Decision
import io.github.ccch1mneyyy.dsh_app.links.LinkTrampolineActivity
import io.github.ccch1mneyyy.dsh_app.phone.HandoffCause
import io.github.ccch1mneyyy.dsh_app.phone.HandoffResult
import io.github.ccch1mneyyy.dsh_app.phone.PhoneRegistry
import io.github.ccch1mneyyy.dsh_app.phone.UserGate
import io.github.ccch1mneyyy.dsh_app.phone.PhonePromptPresenter
import io.github.ccch1mneyyy.dsh_app.phone.PhonePromptUi
import io.github.ccch1mneyyy.dsh_app.phone.PromptPresentation
import io.github.ccch1mneyyy.dsh_app.phone.MainThreadCall
import io.github.ccch1mneyyy.dsh_app.pet.SafeArea
import io.github.ccch1mneyyy.dsh_app.pet.Side
import io.github.ccch1mneyyy.dsh_app.pet.WindowPos
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import kotlin.math.roundToInt

/**
 * The main-screen [UserGate]: TYPE_ACCESSIBILITY_OVERLAY windows owned by the service
 * (no SYSTEM_ALERT_WINDOW). Blocking calls come from the bridge worker; all views live on
 * the main thread.
 */
internal class ControlOverlay(private val service: AccessibilityService) : UserGate, PhonePromptPresenter {
    private val main = Handler(Looper.getMainLooper())
    private val wm = service.getSystemService(WindowManager::class.java)
    private val a11y = service.getSystemService(AccessibilityManager::class.java)
    private val ime = service.getSystemService(InputMethodManager::class.java)
    private val easing = PathInterpolator(0.2f, 0f, 0f, 1f)

    /** 暂停 is on: the driver refuses actions until 继续. */
    @Volatile var paused = false
        private set

    /** The person is typing into 插话: actions wait so the keyboard isn't fought over. */
    @Volatile var editing = false
        private set

    /** Debug probe only: draw in the dark (true) or light (false) palette whatever the system says. */
    @Volatile var debugDark: Boolean? = null

    /** Debug probe only: let an injected tap reach a guarded button to observe the other checks. */
    @Volatile var debugIgnoreInjectGuard = false

    /** Last guarded-button verdict, for the debug probe. */
    @Volatile var lastGuardVerdict: String? = null
        private set

    // ---- main-thread state ----
    private var statusText: String? = null
    private var stoppedNote = false
    private var pill: Pill? = null
    private var confirmCard: Card? = null
    private var handoffCard: Card? = null
    private var pendingConfirm: Pending<Decision>? = null
    private var pendingHandoff: Pending<HandoffResult>? = null
    @Volatile private var sharedPrompt: PromptPresentation? = null
    private var passThrough = false
    private var captureHidden = false
    private var darkBuilt: Boolean? = null

    // Folding: the pill gives way to the ball after a while without a touch (FoldClock).
    private val fold = FoldClock()
    private var ball: OverlayBall? = null

    /** What is on screen: the pill, or the ball (lags [fold] while a fold or unfold plays). */
    private var ballShown = false

    /** The card's shrink or grow while it plays (the ball's glides are its own). */
    private var morph: Animator? = null
    private val foldTick = Runnable { onFoldTick() }

    // 闲置时不透明度 and 「闲置时自动收起」 (设置 → 手机操控 → 悬浮条), live while showing.
    private val overlayPrefs = OverlayPrefs.prefs(service)
    private var idleOpacity = OverlayPrefs.from(overlayPrefs).idleOpacity

    /** The surface opacity on screen now (pill and ball alike), and its fade. */
    private var surfaceAlpha = 1f
    private var dimAnim: ValueAnimator? = null
    private val prefsListener = SharedPreferences.OnSharedPreferenceChangeListener { _, key ->
        if (key == OverlayPrefs.K_OPACITY || key == OverlayPrefs.K_AUTO_FOLD) main.post { onPrefsChanged() }
    }

    init {
        fold.setAutoFold(OverlayPrefs.from(overlayPrefs).autoFold, SystemClock.uptimeMillis())
        overlayPrefs.registerOnSharedPreferenceChangeListener(prefsListener)
    }

    private class Pending<T : Any> {
        private val latch = CountDownLatch(1)
        @Volatile var value: T? = null
            private set

        fun resolve(v: T): Boolean {
            synchronized(this) { if (value != null) return false; value = v }
            latch.countDown()
            return true
        }

        fun await(ms: Long): T? { latch.await(ms, TimeUnit.MILLISECONDS); return value }
    }

    private class Card(val root: FrameLayout, val params: WindowManager.LayoutParams, val tick: Runnable?)

    private class Pill(
        val root: FrameLayout, val params: WindowManager.LayoutParams, val card: LinearLayout, val row: LinearLayout,
        val text: TextView, val dot: View, val pause: TextView, val stop: TextView, val collapse: View,
        val inputRow: LinearLayout, val input: EditText, var pulse: ValueAnimator?,
        /** 「已解除限制」: shown while any hard rule is lifted; opens that page in the app. */
        val unlocked: TextView,
    )

    // ---- UserGate --------------------------------------------------------------------------------

    override fun status(text: String?) {
        main.post {
            statusText = text
            setStopped(false)
            if (text == null) {
                paused = false
                removePill(animated = true)
            } else showPill()
        }
    }

    /** The turn that drove the phone is over: every window goes, pending questions answer STOP. */
    override fun close(ifCurrent: (() -> Unit) -> Unit) {
        val shared = sharedPrompt
        val confirm = pendingConfirm
        val handoff = pendingHandoff
        main.post {
            ifCurrent {
                // A new pre-tool engine prompt can share an inactive task id. Remove only the
                // questions captured by this cleanup, even when the task itself has not started.
                if (sharedPrompt === shared) {
                    shared?.ticket?.stop()
                    if (shared != null) { sharedPrompt = null; dismissConfirm() }
                }
                if (sharedPrompt == null && pendingConfirm === confirm) {
                    confirm?.resolve(Decision.STOP)
                    dismissConfirm()
                }
                if (pendingHandoff === handoff) {
                    handoff?.resolve(HandoffResult.STOP)
                    dismissHandoff()
                }
                statusText = null
                setStopped(false)
                paused = false
                removePill(animated = true)
            }
        }
    }

    override fun confirm(request: ConfirmRequest): Decision {
        PhoneRegistry.promptGate?.let { return it.confirm(request) }
        if (Looper.myLooper() == Looper.getMainLooper()) { Log.w(TAG, "confirm() on the main thread: denied"); return Decision.DENY }
        val pending = Pending<Decision>()
        val shown = onMain(1_500) { showConfirm(request, pending) } == true
        if (!shown) {
            pending.resolve(Decision.UNAVAILABLE)
            main.post { if (pendingConfirm === pending) dismissConfirm() }
            Log.w(TAG, "confirm overlay could not be shown; falling back to the notification gate")
            return PhoneRegistry.notificationGate?.confirm(request) ?: Decision.DENY
        }
        val decision = try {
            pending.await(request.timeoutMs + 1_500) ?: run { pending.resolve(Decision.DENY); pending.value!! }
        } catch (_: InterruptedException) {
            // The core's stop interrupts the worker: answer STOP and keep the flag for the caller.
            pending.resolve(Decision.STOP)
            Thread.currentThread().interrupt()
            pending.value!!
        }
        main.post { if (pendingConfirm === pending) dismissConfirm() }
        return decision
    }

    override fun handoff(reason: String, timeoutMs: Long): HandoffResult = handoff(reason, timeoutMs, null)

    override fun handoff(reason: String, timeoutMs: Long, cause: HandoffCause?): HandoffResult {
        PhoneRegistry.promptGate?.let { return it.handoff(reason, timeoutMs, cause) }
        if (Looper.myLooper() == Looper.getMainLooper()) return HandoffResult.STOP
        val limit = timeoutMs.coerceIn(5_000, 10 * 60_000)
        val pending = Pending<HandoffResult>()
        val shown = onMain(1_500) { showHandoff(reason, limit, pending, cause) } == true
        if (!shown) {
            pending.resolve(HandoffResult.STOP)
            main.post { if (pendingHandoff === pending) dismissHandoff() }
            return PhoneRegistry.notificationGate?.handoff(reason, limit, cause) ?: HandoffResult.STOP
        }
        val result = try {
            pending.await(limit + 1_500) ?: run { pending.resolve(HandoffResult.TIMEOUT); pending.value!! }
        } catch (_: InterruptedException) {
            pending.resolve(HandoffResult.STOP)
            Thread.currentThread().interrupt()
            pending.value!!
        }
        main.post { if (pendingHandoff === pending) dismissHandoff() }
        return result
    }

    // ---- hooks for the driver ---------------------------------------------------------------------

    /** Makes every overlay window untouchable (true) so an injected stroke reaches the app below. */
    fun setPassThrough(on: Boolean) {
        if (Looper.myLooper() == Looper.getMainLooper()) { applyPassThrough(on); return }
        val changed = onMain(500) { applyPassThrough(on) } == true
        if (on && changed) SystemClock.sleep(80) // input windows update a frame after the layout
    }

    /** Hides the overlay for a full-display screenshot (API 30–33). */
    fun hideForCapture(hide: Boolean) {
        val changed = onMain(500) {
            if (captureHidden == hide) return@onMain false
            captureHidden = hide
            val v = if (hide) View.INVISIBLE else View.VISIBLE
            syncWindows()
            confirmCard?.root?.visibility = v
            handoffCard?.root?.visibility = v
            pill != null || confirmCard != null || handoffCard != null
        } == true
        if (hide && changed) SystemClock.sleep(120)
    }

    /** Screen off, lock, 停止 elsewhere, service going away: answer everything pending with STOP. */
    fun stopAll() {
        val shared = sharedPrompt
        val confirm = pendingConfirm
        val handoff = pendingHandoff
        shared?.ticket?.stop()
        main.post {
            if (sharedPrompt === shared) {
                if (shared != null) { sharedPrompt = null; dismissConfirm() }
            }
            if (sharedPrompt == null && pendingConfirm === confirm) { confirm?.resolve(Decision.STOP); dismissConfirm() }
            if (pendingHandoff === handoff) { handoff?.resolve(HandoffResult.STOP); dismissHandoff() }
            paused = false
            endEditing()
            if (statusText != null) { setStopped(true); renderPill(); clearStoppedLater() }
        }
    }

    /** "已停止" stays briefly; if the core doesn't clear or replace the status, the pill (and its KEEP_SCREEN_ON) goes. */
    private fun clearStoppedLater() {
        main.postDelayed({ if (stoppedNote) { statusText = null; setStopped(false); paused = false; removePill(animated = true) } }, 4_000)
    }

    /** The 已停止 note: holds the pill (or the ball) as it is, so nothing folds on the way out. */
    private fun setStopped(on: Boolean) {
        stoppedNote = on
        if (on) holdFold(FoldClock.Hold.STOPPED) else releaseFold(FoldClock.Hold.STOPPED)
    }

    /** Debug probe: screen centre of the visible button labelled [label], if any. */
    fun debugButtonCenter(label: String): Pair<Int, Int>? = onMain(1_000) {
        fun find(v: View): View? {
            if (v is TextView && v.text?.toString() == label) return v
            if (v is android.view.ViewGroup) for (i in 0 until v.childCount) find(v.getChildAt(i))?.let { return it }
            return null
        }
        val roots = listOfNotNull(confirmCard?.root, handoffCard?.root, pill?.root?.takeIf { it.isShown })
        roots.firstNotNullOfOrNull { find(it) }?.let { v ->
            val loc = IntArray(2)
            v.getLocationOnScreen(loc)
            (loc[0] + v.width / 2) to (loc[1] + v.height / 2)
        }
    }

    fun onConfigurationChanged() {
        main.post {
            val dark = isDark()
            if (darkBuilt != null && darkBuilt != dark) {
                // Rebuild in the new palette; pending questions keep their latches.
                pill?.let { removePill(animated = false); if (statusText != null) showPill() }
            } else {
                pill?.let { p ->
                    cancelMorph()
                    place(p.root, p.params, top = true)
                    ball?.let { b -> if (ballShown) b.move(b.dockPos()) }
                }
                confirmCard?.let { place(it.root, it.params, top = false) }
                handoffCard?.let { place(it.root, it.params, top = true) }
            }
        }
    }

    fun destroy() {
        sharedPrompt?.ticket?.stop()
        pendingConfirm?.resolve(Decision.STOP)
        pendingHandoff?.resolve(HandoffResult.STOP)
        overlayPrefs.unregisterOnSharedPreferenceChangeListener(prefsListener)
        main.post {
            dismissConfirm()
            dismissHandoff()
            removePill(animated = false)
        }
    }

    // ---- pill -----------------------------------------------------------------------------------

    private fun showPill() {
        if (pill == null) {
            darkBuilt = isDark()
            val p = buildPill()
            if (!add(p.root, p.params)) return
            pill = p
            ballShown = false
            dimAnim?.cancel()
            surfaceAlpha = 1f
            fold.start(now())
            syncWindows()
            enter(p.root)
            scheduleFold()
        }
        renderPill()
    }

    private fun renderPill() {
        val p = pill ?: return
        val base = statusText ?: return
        p.text.text = when {
            stoppedNote -> AppStrings.get(service, R.string.overlay_stopped)
            paused -> AppStrings.get(service, R.string.overlay_paused)
            else -> base
        }
        p.pause.text = if (paused) AppStrings.get(service, R.string.overlay_continue) else AppStrings.get(service, R.string.overlay_pause)
        p.pause.contentDescription = if (paused) AppStrings.get(service, R.string.overlay_resume_description) else AppStrings.get(service, R.string.overlay_pause_description)
        p.pause.visibility = if (stoppedNote) View.GONE else View.VISIBLE
        p.stop.visibility = if (stoppedNote) View.GONE else View.VISIBLE
        p.collapse.visibility = if (stoppedNote) View.GONE else View.VISIBLE
        p.unlocked.visibility = if (!stoppedNote && PhoneRegistry.unlocks().any) View.VISIBLE else View.GONE
        val animate = !paused && !stoppedNote && !ballShown && animationsOn()
        if (animate && p.pulse == null) {
            p.pulse = ValueAnimator.ofFloat(1f, 0.3f).apply {
                duration = 900; repeatMode = ValueAnimator.REVERSE; repeatCount = ValueAnimator.INFINITE
                addUpdateListener { p.dot.alpha = it.animatedValue as Float }
                start()
            }
        } else if (!animate) { p.pulse?.cancel(); p.pulse = null; p.dot.alpha = if (paused || stoppedNote) 0.4f else 1f }
        (p.dot.background as? GradientDrawable)?.setColor(if (paused || stoppedNote) colors().muted else colors().accent)
        ball?.setLook(
            when {
                stoppedNote -> OverlayBall.Look.STOPPED
                paused -> OverlayBall.Look.PAUSED
                else -> OverlayBall.Look.RUNNING
            },
            AppStrings.get(
                service,
                when {
                    stoppedNote -> R.string.overlay_ball_stopped
                    paused -> R.string.overlay_ball_paused
                    else -> R.string.overlay_ball_running
                },
            ),
        )
    }

    /** Takes the pill and its ball away; [animated]: they fade first (a task that ended, not a rebuild). */
    private fun removePill(animated: Boolean) {
        val p = pill ?: return
        endEditing()
        cancelMorph()
        main.removeCallbacks(foldTick)
        fold.reset()
        dimAnim?.cancel()
        dimAnim = null
        surfaceAlpha = 1f
        p.pulse?.cancel()
        val b = ball
        pill = null
        ball = null
        ballShown = false
        val roots = listOfNotNull(p.root.takeIf { it.isShown }, b?.root?.takeIf { it.isShown })
        if (!animated || !animationsOn() || roots.isEmpty()) {
            remove(p.root)
            b?.detach()
            return
        }
        b?.cancelGlide()
        var left = roots.size
        for (r in roots) {
            r.animate().alpha(0f).setDuration(160).setInterpolator(easing).withEndAction {
                if (--left == 0) { remove(p.root); b?.detach() }
            }.start()
        }
    }

    private fun buildPill(): Pill {
        val c = colors()
        val root = object : FrameLayout(service) {
            // Any finger on the pill restarts its fold count (ACTION_OUTSIDE is someone else's touch).
            override fun dispatchTouchEvent(ev: MotionEvent): Boolean {
                if (ev.actionMasked == MotionEvent.ACTION_DOWN) onPillTouched()
                return super.dispatchTouchEvent(ev)
            }
        }.apply { setPadding(dp(6), dp(4), dp(6), dp(8)); clipToPadding = false }
        val card = LinearLayout(service).apply {
            orientation = LinearLayout.VERTICAL
            background = surface(c, dp(22).toFloat())
            elevation = dp(3).toFloat()
            // The fold narrows the card to a circle; what doesn't fit is cut along its outline.
            clipToOutline = true
        }
        // Both ends mirror each other: the dot's centre and the collapse key's centre sit 22 dp in,
        // on the centres of the card's round ends (the card is 44 dp tall).
        val row = LinearLayout(service).apply {
            gravity = Gravity.CENTER_VERTICAL
            minimumHeight = dp(END_DP)
            setPadding(dp(END_DP / 2 - 4), 0, 0, 0)
        }
        val dot = View(service).apply { background = GradientDrawable().apply { shape = GradientDrawable.OVAL; setColor(c.accent) } }
        row.addView(dot, LinearLayout.LayoutParams(dp(8), dp(8)).apply { marginEnd = dp(10) })
        val unlocked = TextView(service).apply {
            text = AppStrings.get(service, R.string.overlay_unlocked)
            contentDescription = AppStrings.get(service, R.string.overlay_unlocked_description)
            textSize = 11f; setTextColor(c.danger); typeface = Typeface.DEFAULT_BOLD
            gravity = Gravity.CENTER; maxLines = 1
            // Even padding: the tag reads as a small capsule level with the text beside it.
            setPadding(dp(8), dp(3), dp(8), dp(3))
            background = GradientDrawable().apply {
                cornerRadius = dp(10).toFloat()
                setColor((c.danger and 0x00FFFFFF) or 0x24000000)
            }
            isClickable = true
            isFocusable = true
            setOnClickListener { openUnlocks() }
            visibility = if (PhoneRegistry.unlocks().any) View.VISIBLE else View.GONE
        }
        row.addView(unlocked, LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT).apply { marginEnd = dp(8) })
        val text = HaloText(service).apply {
            textSize = 14f; setTextColor(c.ink); maxLines = 1; ellipsize = TextUtils.TruncateAt.END
            setPadding(0, dp(10), dp(6), dp(10))
            contentDescription = null
            setOnClickListener { toggleInput() }
            halo(this, c)
        }
        row.addView(text, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        val pause = textButton(AppStrings.get(service, R.string.overlay_pause), c.accent, c, withHalo = true) { togglePause() }
        val stop = textButton(AppStrings.get(service, R.string.overlay_stop), c.danger, c, withHalo = true) { stopFromPill() }
        val collapse = CollapseKey(service, c).apply {
            contentDescription = AppStrings.get(service, R.string.overlay_collapse)
            setOnClickListener { collapseByHand() }
        }
        row.addView(pause)
        row.addView(stop)
        row.addView(collapse, LinearLayout.LayoutParams(dp(END_DP), dp(END_DP)))
        card.addView(row)

        val inputRow = LinearLayout(service).apply {
            gravity = Gravity.CENTER_VERTICAL
            visibility = View.GONE
            setPadding(dp(14), 0, dp(6), dp(8))
        }
        val input = object : EditText(service) {
            override fun onKeyPreIme(keyCode: Int, event: KeyEvent?): Boolean {
                if (keyCode == KeyEvent.KEYCODE_BACK && event?.action == KeyEvent.ACTION_UP) { collapseInput(); return true }
                return super.onKeyPreIme(keyCode, event)
            }
        }.apply {
            textSize = 15f; setTextColor(c.ink); setHintTextColor(c.faint)
            hint = AppStrings.get(service, R.string.overlay_steer_hint)
            background = GradientDrawable().apply { cornerRadius = dp(14).toFloat(); setColor(c.field) }
            setPadding(dp(12), dp(8), dp(12), dp(8))
            inputType = InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_FLAG_MULTI_LINE
            imeOptions = EditorInfo.IME_ACTION_SEND or EditorInfo.IME_FLAG_NO_EXTRACT_UI
            maxLines = 3
            filters = arrayOf(InputFilter.LengthFilter(2000))
            setOnEditorActionListener { _, action, _ -> if (action == EditorInfo.IME_ACTION_SEND) { sendInterjection(); true } else false }
        }
        inputRow.addView(input, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        inputRow.addView(textButton(AppStrings.get(service, R.string.overlay_send), c.accent, c) { sendInterjection() })
        card.addView(inputRow)
        root.addView(card, FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.WRAP_CONTENT))
        root.setOnTouchListener { _, e -> if (e.actionMasked == MotionEvent.ACTION_OUTSIDE && editing) collapseInput(); false }

        val params = params(top = true, keepScreenOn = true)
        place(root, params, top = true)
        return Pill(root, params, card, row, text, dot, pause, stop, collapse, inputRow, input, null, unlocked)
    }

    /** The 「已解除限制」 tag: 设置 › 手机操控 › 解除限制, through the app's own page link. */
    private fun openUnlocks() {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(UNLOCKS_LINK))
            .setClass(service, LinkTrampolineActivity::class.java)
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        try { service.startActivity(intent) } catch (e: Exception) { Log.w(TAG, "unlocks page: ${e.javaClass.simpleName}") }
    }

    private fun togglePause() {
        paused = !paused
        renderPill()
        PhoneRegistry.controlListener?.onPauseChanged(paused)
    }

    private fun stopFromPill() {
        sharedPrompt?.ticket?.stop()
        pendingConfirm?.resolve(Decision.STOP)
        pendingHandoff?.resolve(HandoffResult.STOP)
        dismissConfirm()
        dismissHandoff()
        paused = false
        setStopped(true)
        endEditing()
        renderPill()
        clearStoppedLater()
        // l10n:keep agent stop reason
        PhoneRegistry.controlListener?.onStopRequested("你在悬浮条上点了停止")
    }

    private fun toggleInput() {
        val p = pill ?: return
        if (stoppedNote) return
        if (p.inputRow.visibility == View.VISIBLE) collapseInput() else {
            p.inputRow.visibility = View.VISIBLE
            editing = true
            holdFold(FoldClock.Hold.EDITING)
            p.params.flags = p.params.flags and WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE.inv()
            update(p.root, p.params)
            p.input.requestFocus()
            p.input.post { if (editing) ime.showSoftInput(p.input, InputMethodManager.SHOW_IMPLICIT) }
        }
    }

    private fun collapseInput() {
        val p = pill ?: return
        p.inputRow.visibility = View.GONE
        endEditing()
    }

    private fun endEditing() {
        val p = pill
        if (p != null) {
            ime.hideSoftInputFromWindow(p.input.windowToken, 0)
            p.input.clearFocus()
            if (p.params.flags and WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE == 0) {
                p.params.flags = p.params.flags or WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                update(p.root, p.params)
            }
            p.inputRow.visibility = View.GONE
        }
        editing = false
        releaseFold(FoldClock.Hold.EDITING)
    }

    private fun sendInterjection() {
        val p = pill ?: return
        val text = p.input.text?.toString()?.trim().orEmpty()
        if (text.isEmpty()) return
        p.input.setText("")
        collapseInput()
        PhoneRegistry.controlListener?.onInterject(text)
        p.text.text = AppStrings.get(service, R.string.overlay_steer_sent, text)
        main.postDelayed({ if (pill === p) renderPill() }, 2_500)
    }

    // ---- confirm --------------------------------------------------------------------------------

    /** Called only by the shared main-thread coordinator; no blocking or implicit fallback. */
    override fun showPrompt(presentation: PromptPresentation): (() -> Unit)? {
        val p = presentation
        if (Looper.myLooper() != Looper.getMainLooper() || !p.live || confirmCard != null || handoffCard != null) return null
        val root = FrameLayout(service).apply {
            setPadding(dp(6), dp(6), dp(6), dp(6))
            addView(PhonePromptUi.card(service, p), FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.WRAP_CONTENT))
        }
        val layout = params(top = false, keepScreenOn = true)
        place(root, layout, top = false)
        if (!p.live || !add(root, layout)) return null
        if (!p.markShown()) { remove(root); return null }
        sharedPrompt = p
        confirmCard = Card(root, layout, null)
        holdFold(FoldClock.Hold.CONFIRM)
        return {
            if (sharedPrompt === p) {
                sharedPrompt = null
                dismissConfirm()
            }
            p.retire()
        }
    }

    private fun showConfirm(request: ConfirmRequest, pending: Pending<Decision>): Boolean {
        if (sharedPrompt != null || pending.value != null) return false
        pendingConfirm?.resolve(Decision.DENY)
        dismissConfirm()
        val c = colors()
        darkBuilt = isDark()
        val deadline = SystemClock.uptimeMillis() + request.timeoutMs
        val root = FrameLayout(service).apply { setPadding(dp(6), dp(8), dp(6), dp(6)); clipToPadding = false }
        val card = LinearLayout(service).apply {
            orientation = LinearLayout.VERTICAL
            background = surface(c, dp(24).toFloat())
            elevation = dp(8).toFloat()
            setPadding(dp(18), dp(16), dp(18), dp(14))
        }
        val head = LinearLayout(service).apply { gravity = Gravity.CENTER_VERTICAL }
        val app = request.appLabel?.takeIf { it.isNotBlank() }
        head.addView(TextView(service).apply {
            text = if (request.firstInApp && app != null) AppStrings.get(service, R.string.overlay_first_app, app) else AppStrings.get(service, R.string.overlay_action_title)
            textSize = 12f; setTextColor(c.accent); typeface = Typeface.DEFAULT_BOLD
        }, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        val countdown = TextView(service).apply { textSize = 12f; setTextColor(c.muted) }
        head.addView(countdown)
        card.addView(head)
        val body = TextView(service).apply {
            text = request.sentence
            textSize = 16f; setTextColor(c.ink); setLineSpacing(0f, 1.3f)
            setPadding(0, dp(8), 0, dp(4))
        }
        card.addView(ScrollView(service).apply { addView(body); isVerticalScrollBarEnabled = false },
            LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT))
        card.addView(TextView(service).apply {
            text = if (request.offerTaskWaiver) {
                AppStrings.get(service, R.string.overlay_waiver_hint)
            } else {
                AppStrings.get(service, R.string.overlay_timeout_hint)
            }
            textSize = 12f; setTextColor(c.faint); setLineSpacing(0f, 1.2f); setPadding(0, 0, 0, dp(10))
        })

        val armedAt = SystemClock.uptimeMillis() + ARM_MS
        val guarded = mutableListOf<GuardedButton>()
        fun decide(d: Decision) { if (pending.resolve(d)) main.post { if (pendingConfirm === pending) dismissConfirm() } }
        // 本任务免确认: the main choice waives the rest of the task. Otherwise, on the first action
        // in an app, the main choice allows that app for the rest of the task so later steps there
        // don't ask again. "Only this step" stays available as the quieter option either way.
        val wide = request.offerTaskWaiver || request.firstInApp
        if (request.offerTaskWaiver) {
            val all4task = GuardedButton(service, armedAt).apply {
                text = AppStrings.get(service, R.string.overlay_allow_remaining)
                style(this, c.accent, c.onAccent, c)
                setOnClickListener { decide(Decision.ALLOW_ALL_FOR_TASK) }
            }
            guarded += all4task
            card.addView(all4task, LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, dp(46)).apply { bottomMargin = dp(8) })
        } else if (request.firstInApp) {
            val app4task = GuardedButton(service, armedAt).apply {
                text = if (app != null) AppStrings.get(service, R.string.overlay_allow_app_task, app) else AppStrings.get(service, R.string.overlay_allow_this_app_task)
                style(this, c.accent, c.onAccent, c)
                setOnClickListener { decide(Decision.ALLOW_APP_FOR_TASK) }
            }
            guarded += app4task
            card.addView(app4task, LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, dp(46)).apply { bottomMargin = dp(8) })
        }
        val row = LinearLayout(service).apply { gravity = Gravity.CENTER_VERTICAL }
        row.addView(textButton(AppStrings.get(service, R.string.overlay_stop), c.danger, c) { decide(Decision.STOP) })
        row.addView(View(service), LinearLayout.LayoutParams(0, 1, 1f))
        row.addView(textButton(AppStrings.get(service, R.string.overlay_decline), c.ink, c) { decide(Decision.DENY) }.apply { background = outlined(c) },
            LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, dp(46)).apply { marginEnd = dp(8) })
        val allow = GuardedButton(service, armedAt).apply {
            text = if (wide) AppStrings.get(service, R.string.overlay_allow_step) else AppStrings.get(service, R.string.overlay_allow_once)
            if (wide) style(this, c.tonal, c.onTonal, c) else style(this, c.accent, c.onAccent, c)
            setOnClickListener { decide(Decision.ALLOW_ONCE) }
        }
        guarded += allow
        row.addView(allow, LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, dp(46)))
        card.addView(row)
        root.addView(card, FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.WRAP_CONTENT))

        guarded.forEach { it.alpha = 0.5f }
        main.postDelayed({ guarded.forEach { it.animate().alpha(1f).setDuration(120).start() } }, ARM_MS)

        val tick = object : Runnable {
            override fun run() {
                val left = deadline - SystemClock.uptimeMillis()
                if (left <= 0) { decide(Decision.DENY); return }
                countdown.text = AppStrings.plural(service, R.plurals.overlay_seconds, ((left + 999) / 1000).toInt(), (left + 999) / 1000)
                main.postDelayed(this, 1_000)
            }
        }
        val params = params(top = false, keepScreenOn = true)
        place(root, params, top = false)
        if (!add(root, params)) return false
        if (pending.value != null) { remove(root); return false }
        confirmCard = Card(root, params, tick)
        pendingConfirm = pending
        tick.run()
        enter(root)
        holdFold(FoldClock.Hold.CONFIRM)
        return true
    }

    private fun dismissConfirm() {
        val card = confirmCard ?: return
        card.tick?.let(main::removeCallbacks)
        remove(card.root)
        confirmCard = null
        pendingConfirm = null
        releaseFold(FoldClock.Hold.CONFIRM)
    }

    // ---- handoff --------------------------------------------------------------------------------

    private fun showHandoff(reason: String, timeoutMs: Long, pending: Pending<HandoffResult>, cause: HandoffCause?): Boolean {
        if (sharedPrompt != null || pending.value != null) return false
        pendingHandoff?.resolve(HandoffResult.STOP)
        dismissHandoff()
        val c = colors()
        darkBuilt = isDark()
        val deadline = SystemClock.uptimeMillis() + timeoutMs
        val root = FrameLayout(service).apply { setPadding(dp(6), dp(4), dp(6), dp(8)); clipToPadding = false }
        val card = LinearLayout(service).apply {
            orientation = LinearLayout.VERTICAL
            background = surface(c, dp(22).toFloat())
            elevation = dp(8).toFloat()
            setPadding(dp(18), dp(14), dp(14), dp(10))
        }
        val head = LinearLayout(service).apply { gravity = Gravity.CENTER_VERTICAL }
        head.addView(TextView(service).apply {
            text = cause?.let { PhonePromptUi.handoffCause(service, it) } ?: AppStrings.get(service, R.string.overlay_handoff_title)
            textSize = 12f; setTextColor(c.accent); typeface = Typeface.DEFAULT_BOLD
        }, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        val countdown = TextView(service).apply { textSize = 12f; setTextColor(c.muted) }
        head.addView(countdown)
        card.addView(head)
        card.addView(TextView(service).apply {
            text = reason; textSize = 15f; setTextColor(c.ink); maxLines = 4; ellipsize = TextUtils.TruncateAt.END
            setLineSpacing(0f, 1.25f); setPadding(0, dp(6), 0, dp(2))
        })
        card.addView(TextView(service).apply {
            text = AppStrings.get(service, R.string.overlay_handoff_hint); textSize = 12f; setTextColor(c.faint); setPadding(0, 0, 0, dp(6))
        })
        fun finish(r: HandoffResult) { if (pending.resolve(r)) main.post { if (pendingHandoff === pending) dismissHandoff() } }
        val row = LinearLayout(service).apply { gravity = Gravity.CENTER_VERTICAL }
        row.addView(textButton(AppStrings.get(service, R.string.overlay_stop), c.danger, c) { finish(HandoffResult.STOP) })
        row.addView(View(service), LinearLayout.LayoutParams(0, 1, 1f))
        val armedAt = SystemClock.uptimeMillis() + ARM_MS
        val go = GuardedButton(service, armedAt).apply {
            text = AppStrings.get(service, R.string.overlay_continue)
            style(this, c.accent, c.onAccent, c)
            setOnClickListener { finish(HandoffResult.CONTINUE) }
        }
        row.addView(go, LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, dp(44)))
        card.addView(row)
        root.addView(card, FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.WRAP_CONTENT))

        val tick = object : Runnable {
            override fun run() {
                val left = deadline - SystemClock.uptimeMillis()
                if (left <= 0) { finish(HandoffResult.TIMEOUT); return }
                val s = (left + 999) / 1000
                countdown.text = if (s >= 60) AppStrings.get(service, R.string.overlay_time_remaining, "${s / 60}:${"%02d".format(s % 60)}") else AppStrings.plural(service, R.plurals.overlay_seconds_remaining, s.toInt(), s)
                main.postDelayed(this, 1_000)
            }
        }
        val params = params(top = true, keepScreenOn = true)
        place(root, params, top = true)
        if (!add(root, params)) return false
        if (pending.value != null) { remove(root); return false }
        handoffCard = Card(root, params, tick)
        pendingHandoff = pending
        // The card says it all: pill and ball step aside, and the pill comes back open after.
        holdFold(FoldClock.Hold.HANDOFF)
        syncWindows()
        tick.run()
        enter(root)
        return true
    }

    private fun dismissHandoff() {
        val card = handoffCard ?: return
        card.tick?.let(main::removeCallbacks)
        remove(card.root)
        handoffCard = null
        pendingHandoff = null
        syncWindows()
        releaseFold(FoldClock.Hold.HANDOFF)
    }

    // ---- guarded buttons ------------------------------------------------------------------------

    /**
     * A confirm button that only real fingers can press:
     *  - not in its first [ARM_MS] (a tap already in flight when the card appeared);
     *  - not while this service is injecting a gesture (InjectGuard);
     *  - not when it looks like an accessibility service's stroke: a virtual device (id ≤ 0) and
     *    either FLAG_IS_ACCESSIBILITY_EVENT (0x800) or tool type UNKNOWN — unless TalkBack-style
     *    touch exploration is on, whose double-tap takes that same path;
     *  - ACTION_CLICK from any accessibility service is refused unless touch exploration is on.
     * And the Actuator makes the overlay untouchable for every stroke it injects.
     * Measured on the API 35 emulator (debug probe): our dispatchGesture tap = flags 0x800,
     * device -1, tool UNKNOWN; a hardware-touchscreen tap = flags 0x800 (!), device 12, tool FINGER;
     * shell `input tap` = flags 0, device -1, tool FINGER. So 0x800 alone would lock real fingers
     * out; the device id is what separates them.
     *
     * Obscured is deliberately not a reason to refuse (and filterTouchesWhenObscured stays off):
     * the system raises FLAG_WINDOW_IS_OBSCURED / FLAG_WINDOW_IS_PARTIALLY_OBSCURED for overlays
     * whenever another app, a landscape game or the immersive-mode decor sits above the touch, even
     * though the person can see and aim at the button. Treating that as tapjacking made every
     * approve / 继续 key dead until the countdown expired; the injected-stroke checks above are the
     * ones this overlay can actually verify.
     */
    private inner class GuardedButton(context: Context, private val armedAt: Long) : TextView(context) {
        private var rejected = false

        init { isClickable = true; isFocusable = true; gravity = Gravity.CENTER }

        override fun dispatchTouchEvent(event: MotionEvent): Boolean {
            if (event.actionMasked == MotionEvent.ACTION_DOWN) {
                val why = rejectReason(event)
                rejected = why != null
                lastGuardVerdict = "${why ?: "accepted"} flags=0x${Integer.toHexString(event.flags)} device=${event.deviceId} source=0x${Integer.toHexString(event.source)} tool=${event.getToolType(0)}"
                Log.i(TAG, "guarded '$text': $lastGuardVerdict")
            }
            if (rejected) {
                if (event.actionMasked == MotionEvent.ACTION_UP || event.actionMasked == MotionEvent.ACTION_CANCEL) isPressed = false
                return true
            }
            return super.dispatchTouchEvent(event)
        }

        override fun performAccessibilityAction(action: Int, arguments: Bundle?): Boolean {
            if ((action == AccessibilityNodeInfo.ACTION_CLICK || action == AccessibilityNodeInfo.ACTION_LONG_CLICK) && !a11y.isTouchExplorationEnabled) {
                lastGuardVerdict = "accessibility-action"
                Log.i(TAG, "guarded '$text': refused accessibility click")
                return false
            }
            return super.performAccessibilityAction(action, arguments)
        }

        private fun rejectReason(event: MotionEvent): String? = when {
            SystemClock.uptimeMillis() < armedAt -> "too-early"
            InjectGuard.active() && !debugIgnoreInjectGuard -> "injecting"
            event.deviceId <= 0 && (event.flags and FLAG_IS_ACCESSIBILITY_EVENT != 0 || event.getToolType(0) == MotionEvent.TOOL_TYPE_UNKNOWN) &&
                !a11y.isTouchExplorationEnabled -> "accessibility-injected"
            else -> null
        }
    }

    // ---- fold ------------------------------------------------------------------------------------
    //
    // Folding: the card narrows to a circle at its end on the ball's side, row fading first, the
    // ball takes its place and glides to its dock. Unfolding: the ball glides back to that end and
    // the card grows out of it. One window shows at a time, except a few frames of overlap at the
    // swap (both are the same circle there), so neither ever blinks.

    private fun now() = SystemClock.uptimeMillis()

    private fun scheduleFold() {
        main.removeCallbacks(foldTick)
        val at = fold.nextAt ?: return
        main.postAtTime(foldTick, at)
    }

    private fun onFoldTick() {
        when (fold.tick(now())) {
            FoldClock.Tick.FOLD -> foldPill(animationsOn())
            FoldClock.Tick.DIM -> applyDim(animated = true)
            FoldClock.Tick.NONE -> Unit
        }
        scheduleFold()
    }

    private fun onPillTouched() {
        // A touch on a pill that is still shrinking opens it again.
        if (fold.folded && !ballShown) { fold.unfold(now()); unfoldPill(animationsOn()) } else fold.touch(now())
        applyDim(animated = true)
        scheduleFold()
    }

    private fun onBallTouched() {
        fold.touch(now())
        applyDim(animated = true)
        scheduleFold()
    }

    private fun onBallTapped() {
        if (fold.unfold(now())) unfoldPill(animationsOn())
        applyDim(animated = true)
        scheduleFold()
    }

    /** The collapse key: folded until the ball is tapped, for the rest of this task. */
    private fun collapseByHand() {
        if (fold.foldByHand(now())) foldPill(animationsOn())
        scheduleFold()
    }

    private fun holdFold(hold: FoldClock.Hold) {
        // A handoff hides both anyway: open without a show.
        if (fold.hold(hold, now())) unfoldPill(animationsOn() && hold != FoldClock.Hold.HANDOFF)
        applyDim(animated = true)
        scheduleFold()
    }

    private fun releaseFold(hold: FoldClock.Hold) {
        fold.release(hold, now())
        scheduleFold()
    }

    private fun onPrefsChanged() {
        val p = OverlayPrefs.from(overlayPrefs)
        idleOpacity = p.idleOpacity
        fold.setAutoFold(p.autoFold, now())
        // A new 不透明度 shows at once on a dimmed pill or ball.
        applyDim(animated = false)
        scheduleFold()
    }

    /**
     * Fades the surfaces (pill card and ball) to the idle opacity, or back to full: slowly going
     * idle, quickly on a touch. Text and keys never fade: their halo (see [halo]) keeps them
     * readable on whatever the page shows through.
     */
    private fun applyDim(animated: Boolean) {
        val target = if (fold.dimmed) idleOpacity else 1f
        dimAnim?.cancel()
        dimAnim = null
        if (target == surfaceAlpha) return
        if (!animated || !animationsOn()) {
            setSurfaceAlpha(target)
            return
        }
        dimAnim = ValueAnimator.ofFloat(surfaceAlpha, target).apply {
            duration = if (target < surfaceAlpha) DIM_FADE_MS else UNDIM_FADE_MS
            interpolator = easing
            addUpdateListener { setSurfaceAlpha(it.animatedValue as Float) }
            start()
        }
    }

    private fun setSurfaceAlpha(a: Float) {
        surfaceAlpha = a
        pill?.let { p -> (p.card.background as? GradientDrawable)?.alpha = (255 * a).roundToInt() }
        ball?.setSurfaceAlpha(a)
    }

    /** The ball's window for this pill, added (hidden) on first use; null when the system refused it. */
    private fun ensureBall(): OverlayBall? {
        ball?.let { return it }
        val b = OverlayBall(service, wm, ::safeArea, ::onBallTapped, ::onBallTouched)
        val c = colors()
        b.setColors(OverlayBall.Colors(c.top, c.bottom, c.stroke, c.accent, c.muted))
        b.setSurfaceAlpha(surfaceAlpha)
        if (!b.attach(AppStrings.get(service, R.string.overlay_window_title), passThrough, b.dockPos())) return null
        ball = b
        renderPill()
        return b
    }

    private fun foldPill(animated: Boolean) {
        val p = pill ?: return
        cancelMorph()
        val b = ensureBall()
        if (b == null) {
            // No second window: the pill stays as it was.
            fold.unfold(now())
            scheduleFold()
            return
        }
        // Folding is a change worth seeing: at full from here, dimming again later.
        applyDim(animated = false)
        val shown = animated && p.root.isShown && p.card.width > 0
        if (!shown) {
            b.move(b.dockPos())
            b.fadeMark(1f, animated = false)
            ballShown = true
            syncWindows()
            renderPill()
            return
        }
        val side = b.dock.side
        b.move(pillEnd(p, side))
        morph = shapeCard(p, side, grow = false) {
            ballShown = true
            b.fadeMark(0f, animated = false)
            showWindow(b.root)
            b.fadeMark(1f, animated = true)
            // The pill goes (and gets its plain layout back) once the ball is surely drawn over it.
            b.root.postDelayed({ if (pill === p && ballShown) { syncWindows(); restoreCard(p) } }, SWAP_MS)
            renderPill()
            b.glideTo(b.dockPos(), animated = true)
        }
    }

    private fun unfoldPill(animated: Boolean) {
        val p = pill ?: return
        cancelMorph()
        val b = ball
        if (b == null || !ballShown) {
            restoreCard(p)
            ballShown = false
            syncWindows()
            renderPill()
            return
        }
        if (!animated || captureHidden || !b.root.isShown) {
            b.move(b.dockPos())
            ballShown = false
            syncWindows()
            renderPill()
            return
        }
        // Only the ball shows from here (a fold may have just ended with both up).
        syncWindows()
        val side = b.dock.side
        // The ball goes back to the pill's end first, its mark fading (cancelMorph stops this glide too).
        b.fadeMark(0f, animated = true, durationMs = UNFOLD_GLIDE_MS)
        b.glideTo(pillEnd(p, side), animated = true, durationMs = UNFOLD_GLIDE_MS) {
            if (pill !== p || !ballShown) return@glideTo
            ballShown = false
            morph = shapeCard(p, side, grow = true) { restoreCard(p) }
            showWindow(p.root)
            // The ball goes once the pill is surely drawn over it, back to its dock for next time.
            b.root.postDelayed({
                if (pill === p && !ballShown) { syncWindows(); b.move(b.dockPos()); b.fadeMark(1f, animated = false) }
            }, SWAP_MS)
            renderPill()
        }
    }

    /** Ends a fold or unfold where it stands (the ball's glide too), the pill back in its plain layout. */
    private fun cancelMorph() {
        ball?.cancelGlide()
        val m = morph
        morph = null
        m?.cancel()
        pill?.let { restoreCard(it) }
    }

    /**
     * Narrows ([grow] false) or widens the card between its full width and a circle at the end on
     * [side]. The row is pinned to that end at its full width, so nothing re-lays out while the
     * card's outline cuts it; it fades in the first 40 % of a fold and the last half of an unfold.
     */
    private fun shapeCard(p: Pill, side: Side, grow: Boolean, then: () -> Unit): Animator {
        val full = fullCardWidth(p)
        val circle = dp(OverlayBall.BALL_DP)
        prepareCard(p, side, narrow = grow)
        val lp = p.card.layoutParams as FrameLayout.LayoutParams
        return ValueAnimator.ofFloat(0f, 1f).apply {
            duration = MORPH_MS
            interpolator = easing
            addUpdateListener { a ->
                val t = a.animatedValue as Float
                val k = if (grow) t else 1f - t
                lp.width = (circle + (full - circle) * k).roundToInt()
                p.card.layoutParams = lp
                p.row.alpha = if (grow) ((t - 0.5f) / 0.5f).coerceIn(0f, 1f) else (1f - t / 0.4f).coerceIn(0f, 1f)
            }
            addListener(object : AnimatorListenerAdapter() {
                private var cancelled = false

                override fun onAnimationCancel(animation: Animator) {
                    cancelled = true
                }

                override fun onAnimationEnd(animation: Animator) {
                    if (morph === animation) morph = null
                    if (!cancelled) then()
                }
            })
            start()
        }
    }

    /** Pins the card to [side] at its full width, or at the circle when [narrow]; the row likewise. */
    private fun prepareCard(p: Pill, side: Side, narrow: Boolean) {
        val full = fullCardWidth(p)
        val end = if (side == Side.RIGHT) Gravity.END else Gravity.START
        val lp = p.card.layoutParams as FrameLayout.LayoutParams
        lp.width = if (narrow) dp(OverlayBall.BALL_DP) else full
        lp.gravity = end or Gravity.TOP
        p.card.layoutParams = lp
        val rowLp = p.row.layoutParams as LinearLayout.LayoutParams
        rowLp.width = full
        rowLp.gravity = end
        p.row.layoutParams = rowLp
        p.row.alpha = if (narrow) 0f else 1f
    }

    private fun restoreCard(p: Pill) {
        val lp = p.card.layoutParams as FrameLayout.LayoutParams
        if (lp.width != FrameLayout.LayoutParams.MATCH_PARENT) {
            lp.width = FrameLayout.LayoutParams.MATCH_PARENT
            lp.gravity = FrameLayout.LayoutParams.UNSPECIFIED_GRAVITY
            p.card.layoutParams = lp
        }
        val rowLp = p.row.layoutParams as LinearLayout.LayoutParams
        if (rowLp.width != LinearLayout.LayoutParams.MATCH_PARENT) {
            rowLp.width = LinearLayout.LayoutParams.MATCH_PARENT
            rowLp.gravity = -1
            p.row.layoutParams = rowLp
        }
        p.row.alpha = 1f
    }

    /** The card's width when open: the window less the root's side padding. */
    private fun fullCardWidth(p: Pill) = p.params.width - p.root.paddingLeft - p.root.paddingRight

    /**
     * The ball window's position that puts the ball on the card's end circle at [side] (the
     * pill window is centred horizontally at `params.y`; its root pads the card).
     */
    private fun pillEnd(p: Pill, side: Side): WindowPos = BallGeometry.pillEnd(
        screenW = safeArea().screenW, pillW = p.params.width, pillY = p.params.y,
        padL = p.root.paddingLeft, padR = p.root.paddingRight, padTop = p.root.paddingTop,
        ball = dp(OverlayBall.BALL_DP), pad = ball?.pad ?: dp(OverlayBall.PAD_DP), side = side,
    )

    /**
     * Pill and ball visibility from the state: the handoff card hides both, a screenshot makes
     * them invisible for its moment, otherwise the one [ballShown] says. GONE windows take no
     * touches, so the hidden one is never in the way.
     */
    private fun syncWindows() {
        val p = pill ?: return
        val handoff = handoffCard != null
        val shown = if (captureHidden) View.INVISIBLE else View.VISIBLE
        p.root.visibility = if (handoff || ballShown) View.GONE else shown
        ball?.root?.visibility = if (handoff || !ballShown) View.GONE else shown
    }

    private fun showWindow(root: View) {
        root.alpha = 1f
        root.visibility = if (captureHidden) View.INVISIBLE else View.VISIBLE
    }

    /** The screen and its bars and cutout, in px (the ball's dock is kept clear of them). */
    private fun safeArea(): SafeArea {
        if (Build.VERSION.SDK_INT >= 30) {
            val m = wm.currentWindowMetrics
            val i = m.windowInsets.getInsetsIgnoringVisibility(WindowInsets.Type.systemBars() or WindowInsets.Type.displayCutout())
            return SafeArea(m.bounds.width(), m.bounds.height(), i.left, i.top, i.right, i.bottom)
        }
        val dm = DisplayMetrics()
        @Suppress("DEPRECATION")
        val display = wm.defaultDisplay
        @Suppress("DEPRECATION")
        display.getRealMetrics(dm)
        val res = Resources.getSystem()
        fun dimen(name: String) = res.getIdentifier(name, "dimen", "android").takeIf { it != 0 }?.let(res::getDimensionPixelSize) ?: 0
        val status = dimen("status_bar_height")
        val nav = dimen("navigation_bar_height")
        return when (display.rotation) {
            Surface.ROTATION_90 -> SafeArea(dm.widthPixels, dm.heightPixels, 0, status, nav, 0)
            Surface.ROTATION_270 -> SafeArea(dm.widthPixels, dm.heightPixels, nav, status, 0, 0)
            else -> SafeArea(dm.widthPixels, dm.heightPixels, 0, status, 0, nav)
        }
    }

    // ---- window plumbing ------------------------------------------------------------------------

    private fun params(top: Boolean, keepScreenOn: Boolean) = WindowManager.LayoutParams(
        WindowManager.LayoutParams.MATCH_PARENT,
        WindowManager.LayoutParams.WRAP_CONTENT,
        WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY,
        WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
            WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH or WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
            (if (keepScreenOn) WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON else 0) or
            (if (passThrough) WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE else 0),
        PixelFormat.TRANSLUCENT,
    ).apply {
        gravity = (if (top) Gravity.TOP else Gravity.BOTTOM) or Gravity.CENTER_HORIZONTAL
        softInputMode = WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING
        title = AppStrings.get(service, R.string.overlay_window_title)
        if (Build.VERSION.SDK_INT >= 30) setFitInsetsTypes(0)
    }

    private fun place(root: View, params: WindowManager.LayoutParams, top: Boolean) {
        val (screenW, insetTop, insetBottom) = metrics()
        params.width = minOf(screenW - dp(12), dp(if (top) 492 else 472))
        params.y = if (top) insetTop + dp(2) else insetBottom + dp(6)
        if (root.isAttachedToWindow) update(root, params)
    }

    private fun applyPassThrough(on: Boolean): Boolean {
        if (passThrough == on) return false
        passThrough = on
        var any = false
        for ((root, params) in windows()) {
            params.flags = if (on) params.flags or WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
            else params.flags and WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE.inv()
            update(root, params)
            any = true
        }
        return any
    }

    private fun windows(): List<Pair<View, WindowManager.LayoutParams>> = listOfNotNull(
        pill?.let { it.root to it.params }, ball?.let { it.root to it.params },
        confirmCard?.let { it.root to it.params }, handoffCard?.let { it.root to it.params },
    )

    private fun add(view: View, params: WindowManager.LayoutParams): Boolean = try {
        wm.addView(view, params); true
    } catch (e: Exception) { Log.w(TAG, "overlay addView failed", e); false }

    private fun update(view: View, params: WindowManager.LayoutParams) {
        try { if (view.isAttachedToWindow) wm.updateViewLayout(view, params) } catch (e: Exception) { Log.w(TAG, "overlay update failed", e) }
    }

    private fun remove(view: View) {
        try { wm.removeView(view) } catch (_: Exception) {}
    }

    private fun enter(view: View) {
        if (!animationsOn()) return
        view.alpha = 0f
        view.translationY = dp(6).toFloat()
        view.animate().alpha(1f).translationY(0f).setDuration(180).setInterpolator(easing).start()
    }

    /** Runs [block] on the main thread and waits for it; null on timeout. */
    private fun <T> onMain(timeoutMs: Long, block: () -> T): T? {
        if (Looper.myLooper() == Looper.getMainLooper()) return block()
        val call = MainThreadCall { try { block() } catch (e: Exception) { Log.w(TAG, "overlay main-thread call failed", e); null } }
        main.post { call.run() }
        return call.await(timeoutMs)
    }

    private fun metrics(): Triple<Int, Int, Int> {
        if (Build.VERSION.SDK_INT >= 30) {
            val m = wm.currentWindowMetrics
            val insets = m.windowInsets.getInsetsIgnoringVisibility(WindowInsets.Type.systemBars() or WindowInsets.Type.displayCutout())
            return Triple(m.bounds.width(), insets.top, insets.bottom)
        }
        val res = Resources.getSystem()
        fun dimen(name: String) = res.getIdentifier(name, "dimen", "android").takeIf { it != 0 }?.let(res::getDimensionPixelSize) ?: 0
        @Suppress("DEPRECATION")
        val width = wm.defaultDisplay.width
        return Triple(width, dimen("status_bar_height"), dimen("navigation_bar_height"))
    }

    // ---- look -----------------------------------------------------------------------------------

    private class Palette(
        val top: Int, val bottom: Int, val stroke: Int, val ink: Int, val muted: Int, val faint: Int,
        val accent: Int, val onAccent: Int, val tonal: Int, val onTonal: Int, val field: Int, val ripple: Int, val danger: Int,
    )

    // The app's 雾蓝 (mist) accent and surfaces, see app/lib/ui/theme/accent.dart and palette.dart.
    private val light = Palette(
        top = 0xFFFBFCFF.toInt(), bottom = 0xFFEEF1F9.toInt(), stroke = 0xCCDCE0E8.toInt(), ink = 0xFF1E232E.toInt(),
        muted = 0xFF4F5562.toInt(), faint = 0xFF646974.toInt(), accent = 0xFF4B67B4.toInt(), onAccent = Color.WHITE,
        tonal = 0xFFDEE8FF.toInt(), onTonal = 0xFF213262.toInt(), field = 0xFFE7EBF4.toInt(), ripple = 0x224B67B4, danger = 0xFFB3261E.toInt(),
    )
    private val dark = Palette(
        top = 0xFF232730.toInt(), bottom = 0xFF1C1F28.toInt(), stroke = 0xCC343841.toInt(), ink = 0xFFE6E9F0.toInt(),
        muted = 0xFFB6BBC5.toInt(), faint = 0xFF9A9EA9.toInt(), accent = 0xFF97B1F0.toInt(), onAccent = 0xFF121C34.toInt(),
        tonal = 0xFF2E3C5F.toInt(), onTonal = 0xFFD8E1F6.toInt(), field = 0xFF2D323C.toInt(), ripple = 0x3397B1F0, danger = 0xFFFFB4AB.toInt(),
    )

    private fun isDark() = debugDark
        ?: (service.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK == Configuration.UI_MODE_NIGHT_YES)
    private fun colors() = if (isDark()) dark else light

    private fun surface(c: Palette, radius: Float) = GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, intArrayOf(c.top, c.bottom)).apply {
        cornerRadius = radius
        setStroke(dp(1), c.stroke)
    }

    private fun outlined(c: Palette) = RippleDrawable(ColorStateList.valueOf(c.ripple), GradientDrawable().apply {
        cornerRadius = dp(14).toFloat(); setStroke(dp(1), c.stroke); setColor(Color.TRANSPARENT)
    }, null)

    private fun style(button: TextView, fill: Int, ink: Int, c: Palette) {
        button.textSize = 15f
        button.setTextColor(ink)
        button.typeface = Typeface.DEFAULT_BOLD
        button.setPadding(dp(18), 0, dp(18), 0)
        button.background = RippleDrawable(ColorStateList.valueOf(c.ripple), GradientDrawable().apply { cornerRadius = dp(14).toFloat(); setColor(fill) }, null)
    }

    /**
     * A rim of the card's own colour around the glyphs (see [HaloText]): invisible on the opaque
     * pill; on a dimmed one it keeps the line readable over any page.
     */
    private fun halo(v: HaloText, c: Palette) {
        v.haloColor = haloColor(c)
        v.haloWidth = dpf(HALO_DP)
    }

    /** The card's colour halfway down its gradient, where the text sits, at the halo's strength. */
    private fun haloColor(c: Palette): Int {
        fun mix(shift: Int) = (((c.top shr shift) and 0xFF) + ((c.bottom shr shift) and 0xFF)) / 2
        return Color.argb(HALO_ALPHA, mix(16), mix(8), mix(0))
    }

    /**
     * The collapse key: Phosphor's arrows-in-simple, 22 dp in a 44 dp key at the card's right end
     * (its pressed circle is 36 dp, 4 dp in from the card on three sides: concentric with the end).
     */
    private inner class CollapseKey(context: Context, private val c: Palette) : View(context) {
        private val ink = android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG).apply {
            style = android.graphics.Paint.Style.STROKE
            strokeCap = android.graphics.Paint.Cap.ROUND
            strokeJoin = android.graphics.Paint.Join.ROUND
        }
        private val glyph = android.graphics.Path().apply {
            // 256-unit grid, as Phosphor draws it.
            moveTo(144f, 64f); lineTo(144f, 112f); lineTo(192f, 112f)
            moveTo(208f, 48f); lineTo(144f, 112f)
            moveTo(112f, 192f); lineTo(112f, 144f); lineTo(64f, 144f)
            moveTo(48f, 208f); lineTo(112f, 144f)
        }
        private val scaled = android.graphics.Path()
        private val matrix = android.graphics.Matrix()

        init {
            isClickable = true
            isFocusable = true
            val mask = android.graphics.drawable.InsetDrawable(GradientDrawable().apply { shape = GradientDrawable.OVAL; setColor(Color.WHITE) }, dp(4))
            background = RippleDrawable(ColorStateList.valueOf(c.ripple), null, mask)
        }

        override fun onDraw(canvas: android.graphics.Canvas) {
            super.onDraw(canvas)
            val size = dpf(22f)
            val scale = size / 256f
            matrix.setScale(scale, scale)
            matrix.postTranslate((width - size) / 2f, (height - size) / 2f)
            glyph.transform(matrix, scaled)
            // Halo first (as the text's), then the glyph in the secondary ink.
            ink.color = haloColor(c)
            ink.strokeWidth = dpf(1.5f) + dpf(HALO_DP)
            canvas.drawPath(scaled, ink)
            ink.color = c.muted
            ink.strokeWidth = dpf(1.5f)
            canvas.drawPath(scaled, ink)
        }
    }

    private fun textButton(label: String, ink: Int, c: Palette, withHalo: Boolean = false, action: () -> Unit) =
        (if (withHalo) HaloText(service).also { halo(it, c) } else TextView(service)).apply {
        text = label
        textSize = 14f
        setTextColor(ink)
        gravity = Gravity.CENTER
        minimumHeight = dp(40)
        minimumWidth = dp(48)
        setPadding(dp(12), 0, dp(12), 0)
        background = RippleDrawable(ColorStateList.valueOf(c.ripple), null, GradientDrawable().apply { cornerRadius = dp(14).toFloat(); setColor(Color.WHITE) })
        isClickable = true
        isFocusable = true
        setOnClickListener { action() }
    }

    private fun animationsOn() = if (Build.VERSION.SDK_INT >= 26) ValueAnimator.areAnimatorsEnabled() else true

    private fun dp(v: Int) = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v.toFloat(), service.resources.displayMetrics).toInt()

    private fun dpf(v: Float) = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, service.resources.displayMetrics)

    companion object {
        private const val TAG = "DshA11y"
        private const val ARM_MS = 600L

        /** The app's page link for 解除限制 (lib/ui/settings/index/spots.dart). */
        private const val UNLOCKS_LINK = "dshgo://open/phone-unlocks"

        /** The card's shrink and grow (the app's 胶囊变形, AppMotion.emphasized). */
        private const val MORPH_MS = 340L

        /** The ball's way back to the pill on a tap: quicker than the way out. */
        private const val UNFOLD_GLIDE_MS = 220L

        /** Frames both windows show at a swap, so the one going is surely covered (≈ 3 frames). */
        private const val SWAP_MS = 48L

        /** The card's height and the size of the keys at its round ends. */
        private const val END_DP = 44

        /** Going idle is slow and quiet; a touch brings it back at once. */
        private const val DIM_FADE_MS = 400L
        private const val UNDIM_FADE_MS = 120L

        /** The halo's stroke: 1.75 dp of surface around every glyph stroke. */
        private const val HALO_DP = 3.5f

        /** Near-opaque: under the glyphs the page barely shows. */
        private const val HALO_ALPHA = 0xE6

        /** MotionEvent.FLAG_IS_ACCESSIBILITY_EVENT (hidden, API 31+). Not decisive alone, see GuardedButton. */
        private const val FLAG_IS_ACCESSIBILITY_EVENT = 0x800

    }
}
