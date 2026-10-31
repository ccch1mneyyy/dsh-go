package io.github.ccch1mneyyy.dsh_app.pet

import io.github.ccch1mneyyy.dsh_app.i18n.AppStrings
import io.github.ccch1mneyyy.dsh_app.R
import io.github.ccch1mneyyy.dsh_app.phone.PromptInputPolicy
import io.github.ccch1mneyyy.dsh_app.phone.a11y.InjectGuard
import android.annotation.SuppressLint
import android.content.Context
import android.content.res.Configuration
import android.graphics.Canvas
import android.graphics.ColorFilter
import android.graphics.Paint
import android.graphics.Path
import android.graphics.PixelFormat
import android.graphics.RectF
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.InsetDrawable
import android.graphics.drawable.StateListDrawable
import android.os.Bundle
import android.os.SystemClock
import android.text.TextUtils
import android.util.TypedValue
import android.view.Gravity
import android.view.MotionEvent
import android.view.View
import android.view.accessibility.AccessibilityManager
import android.view.accessibility.AccessibilityNodeInfo
import android.widget.LinearLayout
import android.widget.TextView

/** The app's 雾蓝 surfaces and ink (app/lib/ui/theme/palette.dart), as phone/a11y/ControlOverlay.kt uses them. */
internal class OverlayPalette(
    val fill: Int, val stroke: Int, val ink: Int, val muted: Int, val pressed: Int,
    val accent: Int, val onAccent: Int, val tonal: Int, val onTonal: Int, val danger: Int,
) {
    companion object {
        private val light = OverlayPalette(
            fill = 0xFFFBFCFF.toInt(), stroke = 0xFFDCE0E8.toInt(), ink = 0xFF1E232E.toInt(),
            muted = 0xFF646974.toInt(), pressed = 0xFFE7EBF4.toInt(),
            accent = 0xFF4B67B4.toInt(), onAccent = 0xFFFFFFFF.toInt(), tonal = 0xFFDEE8FF.toInt(), onTonal = 0xFF213262.toInt(),
            danger = 0xFFB3261E.toInt(),
        )
        private val dark = OverlayPalette(
            fill = 0xFF232730.toInt(), stroke = 0xFF343841.toInt(), ink = 0xFFE6E9F0.toInt(),
            muted = 0xFF9A9EA9.toInt(), pressed = 0xFF2D323C.toInt(),
            accent = 0xFF97B1F0.toInt(), onAccent = 0xFF121C34.toInt(), tonal = 0xFF2E3C5F.toInt(), onTonal = 0xFFD8E1F6.toInt(),
            danger = 0xFFFFB4AB.toInt(),
        )

        fun of(context: Context): OverlayPalette =
            if (context.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK == Configuration.UI_MODE_NIGHT_YES) dark else light
    }
}

internal fun Context.dp(v: Float): Int =
    TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, resources.displayMetrics).toInt()

/**
 * Rounded card with a small tail pointing at the pet: down when the bubble is above it, up when
 * below, sideways when beside it ([Tail]); [tailAt] is where along that edge.
 */
internal class BubbleBackground(
    private val palette: OverlayPalette,
    private val radius: Float,
    private val tailW: Float,
    val tailH: Float,
    private val strokeW: Float,
) : Drawable() {
    var tailAt = 0f
    var tail = Tail.DOWN
    private val fill = Paint(Paint.ANTI_ALIAS_FLAG).apply { color = palette.fill; style = Paint.Style.FILL }
    private val stroke = Paint(Paint.ANTI_ALIAS_FLAG).apply { color = palette.stroke; style = Paint.Style.STROKE; strokeWidth = strokeW }
    private val path = Path()
    private val box = RectF()

    override fun draw(canvas: Canvas) {
        val b = bounds
        val inset = strokeW / 2
        box.set(
            b.left + inset + (if (tail == Tail.LEFT) tailH else 0f),
            b.top + inset + (if (tail == Tail.UP) tailH else 0f),
            b.right - inset - (if (tail == Tail.RIGHT) tailH else 0f),
            b.bottom - inset - (if (tail == Tail.DOWN) tailH else 0f),
        )
        path.reset()
        path.addRoundRect(box, radius, radius, Path.Direction.CW)
        val tail = Path()
        when (this.tail) {
            Tail.DOWN, Tail.UP -> {
                val tx = tailAt.coerceIn(box.left + radius, maxOf(box.left + radius, box.right - radius))
                val edge = if (this.tail == Tail.DOWN) box.bottom - inset else box.top + inset
                val tip = if (this.tail == Tail.DOWN) box.bottom + tailH else box.top - tailH
                tail.moveTo(tx - tailW / 2, edge)
                tail.lineTo(tx, tip)
                tail.lineTo(tx + tailW / 2, edge)
            }
            Tail.LEFT, Tail.RIGHT -> {
                // A short card: the tail may start on the corners' curve, the union covers it.
                val ty = tailAt.coerceIn(box.top + tailW / 2, maxOf(box.top + tailW / 2, box.bottom - tailW / 2))
                val edge = if (this.tail == Tail.RIGHT) box.right - inset else box.left + inset
                val tip = if (this.tail == Tail.RIGHT) box.right + tailH else box.left - tailH
                tail.moveTo(edge, ty - tailW / 2)
                tail.lineTo(tip, ty)
                tail.lineTo(edge, ty + tailW / 2)
            }
        }
        tail.close()
        path.op(tail, Path.Op.UNION)
        canvas.drawPath(path, fill)
        canvas.drawPath(path, stroke)
    }

    override fun setAlpha(alpha: Int) {
        fill.alpha = alpha
        stroke.alpha = alpha
    }

    override fun setColorFilter(colorFilter: ColorFilter?) {
        fill.colorFilter = colorFilter
        stroke.colorFilter = colorFilter
    }

    @Deprecated("Deprecated in Java")
    override fun getOpacity(): Int = PixelFormat.TRANSLUCENT
}

/**
 * The bubble: one line, 「标题 · 做完了」; under it 问一句's reply (its first two lines), or a request
 * with its answers (docs/design/pets.md §2.7). Nothing else from a conversation ever shows here.
 */
@SuppressLint("ViewConstructor")
internal class BubbleView(context: Context, onTap: () -> Unit) : LinearLayout(context) {
    private val palette = OverlayPalette.of(context)
    private val bg = BubbleBackground(
        palette,
        radius = context.dp(14f).toFloat(),
        tailW = context.dp(12f).toFloat(),
        tailH = context.dp(6f).toFloat(),
        strokeW = context.dp(1f).coerceAtLeast(1).toFloat(),
    )
    private val padH = context.dp(14f)
    private val padV = context.dp(8f)
    private val text = TextView(context).apply {
        textSize = 14f
        setTextColor(palette.ink)
        typeface = Typeface.create(Typeface.DEFAULT, Typeface.BOLD)
        maxLines = 1
        ellipsize = TextUtils.TruncateAt.END
    }

    /** The reply's first lines, or what a request asks: under the line. */
    private val detail = TextView(context).apply {
        textSize = 13f
        setTextColor(palette.ink)
        setLineSpacing(0f, 1.15f)
        ellipsize = TextUtils.TruncateAt.END
        visibility = GONE
    }
    private val actions = LinearLayout(context).apply { orientation = VERTICAL; visibility = GONE }
    private var wide = false

    init {
        orientation = VERTICAL
        background = bg
        addView(text, LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT))
        addView(detail, LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT).apply { topMargin = context.dp(2f) })
        addView(actions, LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT).apply { topMargin = context.dp(8f) })
        isClickable = true
        setOnClickListener { onTap() }
        importantForAccessibility = IMPORTANT_FOR_ACCESSIBILITY_YES
        accessibilityLiveRegion = ACCESSIBILITY_LIVE_REGION_POLITE
        setTail(0, Tail.DOWN)
    }

    /** One line fits in 240 dp; a request with its buttons gets a little more. */
    val maxBubbleWidth: Int get() = context.dp(if (wide) 272f else 240f)

    /** How far the tail reaches out of the card. */
    val tailPx: Int get() = bg.tailH.toInt()

    fun bind(b: PetBubble) {
        text.text = b.line
        val more = b.ask?.text ?: b.detail
        detail.text = more
        detail.maxLines = if (b.ask != null) ASK_LINES else DETAIL_LINES
        detail.visibility = if (more == null) GONE else VISIBLE
        wide = b.ask != null
        contentDescription = listOfNotNull(b.line, more).joinToString("\n")
    }

    /** After [measureCard]: the request's text shows whole, nothing cut off at its last line. */
    fun detailWhole(): Boolean {
        val layout = detail.layout ?: return detail.visibility == GONE
        return layout.lineCount <= detail.maxLines && layout.getEllipsisCount(layout.lineCount - 1) == 0
    }

    private val buttons = ArrayList<TextView>()

    /**
     * Puts [list] under the text, each calling [onAction]. Answers (not 「去回答」) are guarded as
     * phone control's prompt is: no touch before [armedAt], none through another window, none injected.
     */
    fun setActions(list: List<BubbleAction>, kind: String?, armedAt: Long, onAction: (BubbleAction) -> Unit) {
        actions.removeAllViews()
        buttons.clear()
        actions.visibility = if (list.isEmpty()) GONE else VISIBLE
        if (list.isEmpty()) return
        val gap = context.dp(8f)
        val pair = list.size == 2 && list.all { it.kind == BubbleAction.Kind.REJECT || it.kind == BubbleAction.Kind.ALLOW }
        val row = if (pair) LinearLayout(context).apply { orientation = HORIZONTAL }.also { actions.addView(it) } else actions
        for ((i, a) in list.withIndex()) {
            val primary = a.kind == BubbleAction.Kind.ALLOW
            val label = when (a.kind) {
                // The notification's own words: one grant, this call only.
                BubbleAction.Kind.ALLOW -> AppStrings.get(context, R.string.notify_allow_once)
                BubbleAction.Kind.REJECT -> AppStrings.get(context, R.string.notify_decline)
                BubbleAction.Kind.CHOOSE -> a.choice.orEmpty()
                BubbleAction.Kind.OPEN -> AppStrings.get(context, if (kind == PetAsk.QUESTION) R.string.pet_go_answer else R.string.pet_go_review)
            }
            val b = (if (a.kind == BubbleAction.Kind.OPEN) TextView(context) else GuardedButton(context, armedAt)).apply {
                text = label
                textSize = 14f
                typeface = Typeface.create(Typeface.DEFAULT, Typeface.BOLD)
                gravity = Gravity.CENTER
                // Choice labels are consent: wrap them instead of hiding a suffix.
                maxLines = if (a.kind == BubbleAction.Kind.CHOOSE) Int.MAX_VALUE else 1
                ellipsize = if (a.kind == BubbleAction.Kind.CHOOSE) null else TextUtils.TruncateAt.END
                minHeight = context.dp(40f)
                setPadding(context.dp(12f), 0, context.dp(12f), 0)
                setTextColor(if (primary) palette.onAccent else if (a.kind == BubbleAction.Kind.OPEN) palette.onTonal else palette.ink)
                background = GradientDrawable().apply {
                    cornerRadius = context.dp(12f).toFloat()
                    setColor(if (primary) palette.accent else if (a.kind == BubbleAction.Kind.OPEN) palette.tonal else palette.fill)
                    if (!primary && a.kind != BubbleAction.Kind.OPEN) setStroke(context.dp(1f).coerceAtLeast(1), palette.stroke)
                }
                isClickable = true
                isFocusable = true
                setOnClickListener { onAction(a) }
            }
            buttons += b
            val lp = if (pair) {
                LayoutParams(0, LayoutParams.WRAP_CONTENT, 1f).apply { if (i > 0) marginStart = gap }
            } else {
                LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT).apply { if (i > 0) topMargin = gap }
            }
            row.addView(b, lp)
        }
        // Guarded answers read as off until they take touches, as on phone control's prompt.
        val wait = (armedAt - SystemClock.uptimeMillis()).coerceAtLeast(0)
        for (b in buttons) {
            if (b !is GuardedButton || wait == 0L) continue
            b.alpha = 0.5f
            b.animate().alpha(1f).setStartDelay(wait).setDuration(120).start()
        }
    }

    /** An answer is on its way: [busy]'s button says so, none takes another tap. */
    fun setBusy(busy: BubbleAction?) {
        for (b in buttons) {
            b.isEnabled = busy == null
            b.alpha = if (busy == null) 1f else 0.5f
        }
    }

    /** The answer didn't go through: [message] in place of the request, one button to the chat. */
    fun showFailed(message: String, kind: String?, onOpen: () -> Unit) {
        detail.text = message
        detail.visibility = VISIBLE
        setActions(listOf(BubbleAction(BubbleAction.Kind.OPEN)), kind, 0L) { onOpen() }
        contentDescription = listOfNotNull(text.text, message).joinToString("\n")
    }

    /** Points the tail [tail]wards, [at] px along that edge; the window grows by [tailPx] on that side. */
    fun setTail(at: Int, tail: Tail) {
        bg.tailAt = at.toFloat()
        bg.tail = tail
        val t = tailPx
        setPadding(
            padH + (if (tail == Tail.LEFT) t else 0), padV + (if (tail == Tail.UP) t else 0),
            padH + (if (tail == Tail.RIGHT) t else 0), padV + (if (tail == Tail.DOWN) t else 0),
        )
        invalidate()
    }

    /** The card's size, the tail left out, within [maxBubbleWidth]. */
    fun measureCard(): Pair<Int, Int> {
        measure(
            MeasureSpec.makeMeasureSpec(maxBubbleWidth, MeasureSpec.AT_MOST),
            MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED),
        )
        return when (bg.tail) {
            Tail.DOWN, Tail.UP -> measuredWidth to measuredHeight - tailPx
            Tail.LEFT, Tail.RIGHT -> measuredWidth - tailPx to measuredHeight
        }
    }

    private companion object {
        /** 问一句's reply: its first two lines. */
        const val DETAIL_LINES = 2

        /** A request: up to four lines, and answered only when it fits them whole. */
        const val ASK_LINES = 4
    }
}

/**
 * A bubble's answer key, as careful as phone control's prompt ([PromptInputPolicy]): no touch before
 * [armedAt] (the bubble may pop up under a finger), none injected by an accessibility service unless
 * TalkBack is the one reading. An obscured window is not refused here: the system marks overlays
 * obscured whenever another app or a landscape game is in front, which left these keys dead.
 */
@SuppressLint("ViewConstructor")
internal class GuardedButton(context: Context, private val armedAt: Long) : TextView(context) {
    private val a11y = context.getSystemService(AccessibilityManager::class.java)
    private var rejected = false

    init {
        isClickable = true
        isFocusable = true
    }

    override fun dispatchTouchEvent(event: MotionEvent): Boolean {
        if (event.actionMasked == MotionEvent.ACTION_DOWN) {
            rejected = !PromptInputPolicy.allows(
                SystemClock.uptimeMillis(), armedAt, isEnabled, InjectGuard.active(),
                event.deviceId <= 0, event.flags and FLAG_IS_ACCESSIBILITY_EVENT != 0 || event.getToolType(0) == MotionEvent.TOOL_TYPE_UNKNOWN,
                a11y.isTouchExplorationEnabled,
            )
        }
        if (rejected) {
            if (event.actionMasked == MotionEvent.ACTION_UP || event.actionMasked == MotionEvent.ACTION_CANCEL) isPressed = false
            return true
        }
        return super.dispatchTouchEvent(event)
    }

    override fun performClick(): Boolean {
        if (!isEnabled || SystemClock.uptimeMillis() < armedAt || InjectGuard.active()) return false
        return super.performClick()
    }

    override fun performAccessibilityAction(action: Int, arguments: Bundle?): Boolean {
        if ((action == AccessibilityNodeInfo.ACTION_CLICK || action == AccessibilityNodeInfo.ACTION_LONG_CLICK) &&
            (SystemClock.uptimeMillis() < armedAt || InjectGuard.active() || !a11y.isTouchExplorationEnabled)
        ) {
            return false
        }
        return super.performAccessibilityAction(action, arguments)
    }

    private companion object {
        /** MotionEvent.FLAG_IS_ACCESSIBILITY_EVENT (hidden): dispatched by an accessibility service. */
        const val FLAG_IS_ACCESSIBILITY_EVENT = 0x800
    }
}

/** The 「×」 at the bottom middle while dragging; [setArmed] grows it when the pet is over it. */
internal class DismissTargetView(context: Context) : View(context) {
    private val palette = OverlayPalette.of(context)
    private val disc = Paint(Paint.ANTI_ALIAS_FLAG).apply { color = palette.fill; style = Paint.Style.FILL }
    private val ring = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = palette.stroke; style = Paint.Style.STROKE; strokeWidth = context.dp(1f).coerceAtLeast(1).toFloat()
    }
    private val cross = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = palette.ink; style = Paint.Style.STROKE; strokeWidth = context.dp(2f).toFloat(); strokeCap = Paint.Cap.ROUND
    }
    var armed = false
        private set

    fun setArmed(on: Boolean) {
        if (on == armed) return
        armed = on
        animate().scaleX(if (on) 1.2f else 1f).scaleY(if (on) 1.2f else 1f).setDuration(120).start()
    }

    override fun onDraw(canvas: Canvas) {
        val c = width / 2f
        val r = c / 1.2f - ring.strokeWidth
        canvas.drawCircle(c, c, r, disc)
        canvas.drawCircle(c, c, r, ring)
        val a = r * 0.36f
        canvas.drawLine(c - a, c - a, c + a, c + a, cross)
        canvas.drawLine(c - a, c + a, c + a, c - a, cross)
    }
}

/**
 * Long-press menu ([PetMenuItem]): 「问一句」 first, the shortcuts that apply, 「今天不再显示」,
 * 「宠物设置」; 切换主机 swaps the rows for the hosts ([setRows]). A touch outside closes it.
 */
@SuppressLint("ViewConstructor")
internal class PetMenuView(
    context: Context,
    rows: List<Row>,
    private val onOutside: () -> Unit,
) : LinearLayout(context) {
    /** One row; [muted]: the host already in use. */
    class Row(val label: String, val muted: Boolean = false, val action: () -> Unit)

    private val palette = OverlayPalette.of(context)

    init {
        orientation = VERTICAL
        val pad = context.dp(4f)
        setPadding(0, pad, 0, pad)
        background = GradientDrawable().apply {
            cornerRadius = context.dp(16f).toFloat()
            setColor(palette.fill)
            setStroke(context.dp(1f).coerceAtLeast(1), palette.stroke)
        }
        setRows(rows)
    }

    fun setRows(rows: List<Row>) {
        removeAllViews()
        for (r in rows) addView(row(r.label, r.muted, r.action))
    }

    private fun row(label: String, muted: Boolean, action: () -> Unit) = TextView(context).apply {
        text = label
        textSize = 15f
        setTextColor(if (muted) palette.muted else palette.ink)
        maxLines = 1
        ellipsize = TextUtils.TruncateAt.END
        maxWidth = context.dp(240f)
        gravity = Gravity.CENTER_VERTICAL
        minHeight = context.dp(44f)
        minWidth = context.dp(168f)
        // A rounded highlight inset from the card's edge: software windows can't clip to the card.
        // Set before the padding: a background with insets would replace it.
        val inset = context.dp(4f)
        background = StateListDrawable().apply {
            addState(
                intArrayOf(android.R.attr.state_pressed),
                InsetDrawable(GradientDrawable().apply { cornerRadius = context.dp(12f).toFloat(); setColor(palette.pressed) }, inset, 0, inset, 0),
            )
        }
        setPadding(context.dp(16f), 0, context.dp(16f), 0)
        isClickable = true
        isFocusable = true
        setOnClickListener { action() }
    }

    override fun dispatchTouchEvent(event: MotionEvent): Boolean {
        if (event.actionMasked == MotionEvent.ACTION_OUTSIDE) {
            onOutside()
            return true
        }
        return super.dispatchTouchEvent(event)
    }

    fun measureFor(): Pair<Int, Int> {
        measure(
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
        )
        return measuredWidth to measuredHeight
    }
}
