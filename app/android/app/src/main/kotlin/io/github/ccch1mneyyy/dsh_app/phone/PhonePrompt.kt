package io.github.ccch1mneyyy.dsh_app.phone

import java.util.UUID
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit

/** Local UI protocol only: this does not add engine endpoints or executable content. */
data class EnginePhonePrompt(
    val requestId: String,
    val taskId: Long?,
    val sessionId: String,
    val host: String,
    val kind: PromptKind,
    val text: String,
) {
    companion object {
        fun parse(map: Map<*, *>?): EnginePhonePrompt? {
            fun text(key: String, max: Int): String? = (map?.get(key) as? String)
                ?.takeIf { it.isNotBlank() && it.length <= max }
            val rawTask = map?.get("taskId")
            val task = when (rawTask) {
                null -> null
                is Int -> rawTask.toLong().takeIf { it > 0 } ?: return null
                is Long -> rawTask.takeIf { it > 0 } ?: return null
                else -> return null
            }
            val kind = when (map?.get("kind")) {
                "approval" -> PromptKind.APPROVAL
                "review" -> PromptKind.REVIEW
                else -> return null
            }
            return EnginePhonePrompt(text("requestId", 200) ?: return null, task,
                text("sessionId", 200) ?: return null, text("host", 2048) ?: return null,
                kind, text("text", 4096) ?: return null)
        }
    }
}

enum class PromptKind { APPROVAL, REVIEW, NATIVE_CONFIRM, HANDOFF }
enum class PromptSurface(val wire: String) { NONE("none"), OVERLAY("overlay"), NOTIFICATION("notification"), APP("app") }
enum class PromptChoice { ALLOW_ONCE, ALLOW_APP, ALLOW_TASK, REJECT, OPEN, LATER, STOP, CONTINUE }

/** Main-thread presenter. A handle only removes this presentation, never a successor. */
interface PhonePromptPresenter {
    fun showPrompt(presentation: PromptPresentation): (() -> Unit)?
}
enum class PromptOutcome(val wire: String) {
    ALLOW_ONCE("allowed-once"), REJECT("rejected"), OPEN("open"), DISMISSED("dismissed"),
    TIMEOUT("timeout"), STOPPED("stopped"), UNAVAILABLE("unavailable"),
    ALLOW_APP("allowed-app"), ALLOW_TASK("allowed-task"), CONTINUE("continue"),
}

data class PromptContent(
    val kind: PromptKind,
    val text: String,
    val native: ConfirmRequest? = null,
    val sessionId: String? = null,
    val host: String? = null,
    /** [PromptKind.HANDOFF] only: the hard rule behind it, named in the title. */
    val cause: HandoffCause? = null,
) {
    /** Exact permitted actions. Neither engine kind can inherit native task/app waivers. */
    val choices: List<PromptChoice> get() = when (kind) {
        PromptKind.APPROVAL -> listOf(PromptChoice.ALLOW_ONCE, PromptChoice.REJECT)
        PromptKind.REVIEW -> listOf(PromptChoice.OPEN, PromptChoice.LATER)
        PromptKind.HANDOFF -> listOf(PromptChoice.CONTINUE, PromptChoice.STOP)
        PromptKind.NATIVE_CONFIRM -> buildList {
            if (native?.offerTaskWaiver == true) add(PromptChoice.ALLOW_TASK)
            else if (native?.firstInApp == true) add(PromptChoice.ALLOW_APP)
            add(PromptChoice.ALLOW_ONCE)
            add(PromptChoice.REJECT)
            add(PromptChoice.STOP)
        }
    }
}

data class PromptResult(val outcome: PromptOutcome, val presented: PromptSurface, val reason: String? = null) {
    fun toMap(): Map<String, Any?> = mapOf("decision" to outcome.wire, "presented" to presented.wire, "reason" to reason)
}

/** A tiny revocation cell survives a completed choice until its queued reply/navigation runs. */
internal class PromptRevocation {
    @Volatile var reason: String? = null
        private set
    private var listener: (() -> Unit)? = null

    fun listen(callback: () -> Unit) = synchronized(this) { listener = callback }
    fun clearListener() = synchronized(this) { listener = null }
    fun retire(value: String): Boolean {
        val notify = synchronized(this) {
            if (reason != null) return false
            reason = value
            listener.also { listener = null }
        }
        notify?.invoke()
        return true
    }
}

/** One process-wide slot. The 64 recent id/owner cells retain no text, Activity or callback. */
class PromptArbiter(
    private val clock: () -> Long = { System.nanoTime() / 1_000_000 },
    private val nonce: () -> String = { UUID.randomUUID().toString() },
) {
    private val lock = Any()
    private var active: PromptTicket? = null
    private val recent = linkedMapOf<String, Pair<Any, PromptRevocation>>()

    fun begin(requestId: String?, owner: Any, content: PromptContent, timeoutMs: Long,
              current: () -> Boolean): PromptTicket? = synchronized(lock) {
        active?.check()
        if (active != null || (requestId != null && requestId in recent) || !runCatching(current).getOrDefault(false)) return null
        val revoked = PromptRevocation()
        if (requestId != null) {
            recent[requestId] = owner to revoked
            // Eviction retires even a completed choice whose main-thread continuation has
            // not run yet. Bounded history must not turn a forgotten request into authority.
            while (recent.size > 64) recent.remove(recent.keys.first())?.second?.retire("stale")
        }
        PromptTicket(requestId, owner, content, clock() + timeoutMs.coerceIn(1, 600_000), clock, nonce, current, revoked)
            .also { ticket ->
                active = ticket
                ticket.onFinished { synchronized(lock) { if (active === ticket) active = null } }
            }
    }

    fun cancel(requestId: String): Boolean {
        val cell = synchronized(lock) { recent[requestId]?.second } ?: return false
        return cell.retire("cancelled")
    }

    fun cancelOwner(owner: Any) {
        val (ticket, cells) = synchronized(lock) {
            active?.takeIf { it.owner === owner } to recent.values.filter { it.first === owner }.map { it.second }
        }
        cells.forEach { it.retire("stale") }
        ticket?.stop("stale")
    }

    fun stopAll() { synchronized(lock) { active }?.stop("stale") }
    fun check() { synchronized(lock) { active }?.check() }
    fun current(): PromptTicket? = synchronized(lock) { active }
}

/** A total deadline and immutable owner check shared by every presentation attempt. */
class PromptTicket internal constructor(
    val requestId: String?,
    val owner: Any,
    val content: PromptContent,
    val deadline: Long,
    private val clock: () -> Long,
    private val nonce: () -> String,
    private val ownerCurrent: () -> Boolean,
    private val revoked: PromptRevocation,
) {
    private val lock = Any()
    private val latch = CountDownLatch(1)
    private var result: PromptResult? = null
    private var surface = PromptSurface.NONE
    private var presentation: PromptPresentation? = null
    private val callbacks = mutableListOf<(PromptResult) -> Unit>()

    init { revoked.listen { finish(PromptOutcome.STOPPED, revoked.reason ?: "stale") } }

    val remainingMs: Long get() = (deadline - clock()).coerceAtLeast(0)
    val live: Boolean get() { check(); return synchronized(lock) { result == null } }

    fun check() {
        if (revoked.reason != null) finish(PromptOutcome.STOPPED, revoked.reason)
        else if (!ownerValid()) stop("stale")
        else if (clock() >= deadline) finish(PromptOutcome.TIMEOUT)
    }

    fun attempt(surface: PromptSurface): PromptPresentation? {
        if (!live) return null
        return synchronized(lock) {
            if (result != null) return null
            PromptPresentation(this, surface, nonce()).also { presentation = it }
        }
    }

    internal fun owns(p: PromptPresentation): Boolean = live && synchronized(lock) { presentation === p }

    internal fun shown(p: PromptPresentation): Boolean {
        if (!owns(p)) return false
        return synchronized(lock) {
            if (result != null || presentation !== p) return false
            surface = p.surface
            p.shown = true
            true
        }
    }

    internal fun retire(p: PromptPresentation) { synchronized(lock) { if (presentation === p) presentation = null } }

    internal fun choose(p: PromptPresentation, choice: PromptChoice): Boolean {
        if (!owns(p) || !p.shown || choice !in content.choices) return false
        val outcome = when (choice) {
            PromptChoice.ALLOW_ONCE -> PromptOutcome.ALLOW_ONCE
            PromptChoice.ALLOW_APP -> PromptOutcome.ALLOW_APP
            PromptChoice.ALLOW_TASK -> PromptOutcome.ALLOW_TASK
            PromptChoice.REJECT -> PromptOutcome.REJECT
            PromptChoice.OPEN -> PromptOutcome.OPEN
            PromptChoice.LATER -> PromptOutcome.DISMISSED
            PromptChoice.STOP -> PromptOutcome.STOPPED
            PromptChoice.CONTINUE -> PromptOutcome.CONTINUE
        }
        return finish(outcome, expected = p)
    }

    fun unavailable() = finish(PromptOutcome.UNAVAILABLE, "unavailable")
    fun stop(reason: String = "stale") = revoked.retire(reason)
    fun dismiss() = finish(PromptOutcome.DISMISSED)

    private fun finish(outcome: PromptOutcome, reason: String? = null, expected: PromptPresentation? = null): Boolean {
        val finished: PromptResult
        val listeners: List<(PromptResult) -> Unit>
        synchronized(lock) {
            if (result != null || (expected != null && presentation !== expected)) return false
            // Recheck at the action's linearization point, not just when the view received DOWN.
            val retired = expected != null && (!ownerValid() || revoked.reason != null)
            val expired = expected != null && clock() >= deadline
            finished = when {
                retired -> PromptResult(PromptOutcome.STOPPED, surface, "stale")
                expired -> PromptResult(PromptOutcome.TIMEOUT, surface)
                else -> PromptResult(outcome, surface, reason)
            }
            result = finished
            presentation = null
            listeners = callbacks.toList()
            callbacks.clear()
        }
        revoked.clearListener()
        latch.countDown()
        listeners.forEach { runCatching { it(finished) } }
        return true
    }

    fun onFinished(callback: (PromptResult) -> Unit) {
        val finished = synchronized(lock) {
            result.also { if (it == null) callbacks += callback }
        }
        if (finished != null) callback(finished)
    }

    /** Native bridge worker only. Engine requests use [onFinished] and never block main/IO. */
    fun await(): PromptResult {
        try {
            if (!latch.await(remainingMs, TimeUnit.MILLISECONDS)) finish(PromptOutcome.TIMEOUT)
        } catch (_: InterruptedException) {
            stop()
            Thread.currentThread().interrupt()
        }
        return finalResult()
    }

    /** A reply queued to Dart cannot carry an allow after its native owner has retired. */
    fun finalResult(): PromptResult {
        check()
        val r = synchronized(lock) { result } ?: return PromptResult(PromptOutcome.UNAVAILABLE, surface, "unavailable")
        val authorizesContinuation = when (r.outcome) {
            PromptOutcome.ALLOW_ONCE, PromptOutcome.ALLOW_APP, PromptOutcome.ALLOW_TASK,
            PromptOutcome.OPEN, PromptOutcome.CONTINUE -> true
            else -> false
        }
        return when {
            !ownerValid() || revoked.reason != null -> PromptResult(PromptOutcome.STOPPED, r.presented, revoked.reason ?: "stale")
            // A choice made in time does not extend the total deadline of a queued reply/open.
            authorizesContinuation && clock() >= deadline -> PromptResult(PromptOutcome.TIMEOUT, r.presented)
            else -> r
        }
    }

    private fun ownerValid() = runCatching(ownerCurrent).getOrDefault(false)

    fun presentation(nonce: String): PromptPresentation? = synchronized(lock) { presentation?.takeIf { it.nonce == nonce } }
    fun finalPresentationSurface(): PromptSurface = synchronized(lock) { surface }
}

/** Separate identity for every fallback. Buttons from a discarded surface cannot answer its successor. */
class PromptPresentation internal constructor(val ticket: PromptTicket, val surface: PromptSurface, val nonce: String) {
    internal var shown = false
    val live: Boolean get() = ticket.owns(this)
    fun markShown() = ticket.shown(this)
    fun choose(choice: PromptChoice) = ticket.choose(this, choice)
    fun retire() = ticket.retire(this)
}

/** Handler calls that time out before dispatch must not perform their queued side effect later. */
class MainThreadCall<T>(private val block: () -> T) {
    private val lock = Any()
    private val done = CountDownLatch(1)
    private var cancelled = false
    private var result: T? = null

    fun run() {
        synchronized(lock) { if (cancelled) return }
        try {
            val value = block()
            synchronized(lock) { if (!cancelled) result = value }
        } finally { done.countDown() }
    }

    fun await(timeoutMs: Long): T? {
        val ready = try { done.await(timeoutMs, TimeUnit.MILLISECONDS) } catch (_: InterruptedException) {
            Thread.currentThread().interrupt(); false
        }
        synchronized(lock) {
            if (!ready) cancelled = true
            return if (ready && !cancelled) result else null
        }
    }
}

/**
 * Input facts are supplied by Android; policies stay testable without pretending to inject a real touch.
 *
 * Neither [android.view.MotionEvent.FLAG_WINDOW_IS_OBSCURED] nor the platform's
 * `filterTouchesWhenObscured` gate is consulted: for an overlay window the system raises those
 * flags for windows the person can see and aim at (another app in front, a landscape game, the
 * immersive-mode decor), and a rate that swallowed every such touch left the approval buttons
 * dead until the countdown expired. Injection is what the remaining checks cover, and a real
 * finger is the one thing an overlay cannot fake.
 */
object PromptInputPolicy {
    fun allows(now: Long, armedAt: Long, live: Boolean, injecting: Boolean,
               virtualDevice: Boolean, suspiciousStroke: Boolean, touchExploration: Boolean): Boolean =
        live && now >= armedAt && !injecting &&
            !(virtualDevice && suspiciousStroke && !touchExploration)
}
