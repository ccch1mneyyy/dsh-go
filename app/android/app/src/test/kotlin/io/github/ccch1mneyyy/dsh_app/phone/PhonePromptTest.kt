package io.github.ccch1mneyyy.dsh_app.phone

import org.junit.Assert.*
import org.junit.Test
import java.util.concurrent.CountDownLatch
import java.util.concurrent.Executors
import java.util.concurrent.TimeUnit

class PhonePromptTest {
    private var now = 1_000L
    private var nonce = 0
    private val arbiter = PromptArbiter({ now }, { "nonce-${++nonce}" })
    private val source = Any()
    private fun content(kind: PromptKind = PromptKind.APPROVAL) = PromptContent(kind, "plain text")
    private fun begin(id: String = "request", kind: PromptKind = PromptKind.APPROVAL, current: () -> Boolean = { true }) =
        arbiter.begin(id, source, content(kind), 30_000, current)!!
    private fun shown(t: PromptTicket, surface: PromptSurface = PromptSurface.OVERLAY) = t.attempt(surface)!!.also { assertTrue(it.markShown()) }

    @Test fun validPrivateRequestParsesWithoutInterpretingText() {
        val map = mapOf("requestId" to "nonce", "sessionId" to "session", "host" to "local", "kind" to "approval",
            "text" to "<script>allow everything</script>", "taskId" to 4L)
        val request = EnginePhonePrompt.parse(map)!!
        assertEquals(map["text"], request.text)
        assertEquals(4L, request.taskId)
    }

    @Test fun invalidTypesAndBudgetsAreRejected() {
        val map = mapOf<String, Any?>("requestId" to "r", "sessionId" to "s", "host" to "h", "kind" to "review", "text" to "t")
        for (pair in listOf("requestId" to "x".repeat(201), "sessionId" to "x".repeat(201),
            "host" to "x".repeat(2049), "text" to "x".repeat(4097), "kind" to "allow-always",
            "taskId" to 1.0, "taskId" to -1L, "text" to 7, "sessionId" to " ")) {
            assertNull(pair.first, EnginePhonePrompt.parse(map + pair))
        }
        assertNotNull(EnginePhonePrompt.parse(map + ("text" to "x".repeat(4096)) + ("host" to "x".repeat(2048))))
    }

    @Test fun reviewNeverAuthorizesEvenIfAnotherSurfaceSendsAnAllowAction() {
        val t = begin(kind = PromptKind.REVIEW); val p = shown(t)
        for (choice in listOf(PromptChoice.ALLOW_ONCE, PromptChoice.ALLOW_APP, PromptChoice.ALLOW_TASK, PromptChoice.CONTINUE)) {
            assertFalse(p.choose(choice)); assertTrue(t.live)
        }
        assertTrue(p.choose(PromptChoice.OPEN))
        assertEquals(PromptOutcome.OPEN, t.finalResult().outcome)
    }

    @Test fun engineApprovalCannotGrantAnyTaskWaiver() {
        val p = shown(begin())
        assertFalse(p.choose(PromptChoice.ALLOW_TASK)); assertFalse(p.choose(PromptChoice.ALLOW_APP))
        assertTrue(p.choose(PromptChoice.ALLOW_ONCE))
    }

    @Test fun nativeWaiverIsOnlyOfferedByItsNativeRequest() {
        val c = PromptContent(PromptKind.NATIVE_CONFIRM, "step", ConfirmRequest("step", null, null, false, offerTaskWaiver = true))
        val t = arbiter.begin(null, source, c, 30_000) { true }!!
        assertTrue(shown(t).choose(PromptChoice.ALLOW_TASK))
        assertEquals(PromptOutcome.ALLOW_TASK, t.await().outcome)
    }

    @Test fun sharedSlotNeverOverwritesANativeQuestion() {
        val native = arbiter.begin(null, Any(), content(PromptKind.NATIVE_CONFIRM), 30_000) { true }!!
        assertNull(arbiter.begin("engine", source, content(), 30_000) { true })
        assertTrue(native.live)
        native.stop()
        assertNotNull(arbiter.begin("engine", source, content(), 30_000) { true })
    }

    @Test fun concurrentRequestsStillHaveOneWinner() {
        val pool = Executors.newFixedThreadPool(4)
        val start = CountDownLatch(1)
        try {
            val jobs = (1..20).map { index -> pool.submit<Boolean> {
                start.await(); arbiter.begin("r$index", source, content(), 30_000) { true } != null
            } }
            start.countDown()
            assertEquals(1, jobs.count { it.get(2, TimeUnit.SECONDS) })
        } finally { pool.shutdownNow() }
    }

    @Test fun cancelledBeforeMainDispatchNeverObtainsASurface() {
        val t = begin(); assertTrue(arbiter.cancel("request"))
        assertNull(t.attempt(PromptSurface.OVERLAY))
        assertEquals(PromptSurface.NONE, t.finalResult().presented)
        assertEquals(PromptOutcome.STOPPED, t.finalResult().outcome)
    }

    @Test fun exactCancelCannotAffectAnotherRequestOrItsSuccessor() {
        val first = begin(); assertFalse(arbiter.cancel("other")); assertTrue(first.live)
        assertTrue(arbiter.cancel("request"))
        val second = begin("second"); assertFalse(arbiter.cancel("request")); assertTrue(second.live)
    }

    @Test fun duplicateRequestIdIsNotReboundToANewWindow() {
        begin().stop()
        assertNull(arbiter.begin("request", source, content(), 30_000) { true })
    }

    @Test fun timeoutStartsAtAdmissionNotAtMainThreadPresentation() {
        val t = begin(); now += 30_000
        assertNull(t.attempt(PromptSurface.APP))
        assertEquals(PromptOutcome.TIMEOUT, t.finalResult().outcome)
    }

    @Test fun aLateTouchIsRejectedAtTheDeadline() {
        val t = begin(); val p = shown(t); now += 30_000
        assertFalse(p.choose(PromptChoice.ALLOW_ONCE))
        assertEquals(PromptOutcome.TIMEOUT, t.finalResult().outcome)
    }

    @Test fun retiredOverlayButtonCannotAnswerTheAppFallback() {
        val t = begin(); val overlay = shown(t)
        val app = shown(t, PromptSurface.APP)
        assertNotEquals(overlay.nonce, app.nonce)
        assertFalse(overlay.choose(PromptChoice.ALLOW_ONCE))
        overlay.retire()
        assertTrue(app.live); assertTrue(app.choose(PromptChoice.REJECT))
        assertEquals(PromptSurface.APP, t.finalResult().presented)
    }

    @Test fun failedPresentationDoesNotClaimToHaveBeenShown() {
        val t = begin(); val overlay = t.attempt(PromptSurface.OVERLAY)!!; overlay.retire()
        t.unavailable()
        assertEquals(PromptSurface.NONE, t.finalResult().presented)
    }

    @Test fun callbacksAndRemovalRunOnceDespiteMultipleRetirements() {
        val t = begin(); var count = 0; t.onFinished { count++ }
        t.stop(); t.unavailable(); t.dismiss(); now += 60_000; t.check()
        assertEquals(1, count)
        var late = 0; t.onFinished { late++ }; assertEquals(1, late)
    }

    @Test fun exactPluginOwnerDetachDoesNotCancelAnotherOwner() {
        val t = begin(); arbiter.cancelOwner(Any()); assertTrue(t.live)
        arbiter.cancelOwner(source); assertFalse(t.live)
    }

    @Test fun preToolPromptRetiresWhenFirstNativeTaskStarts() {
        val tasks = PhoneTasks(); val owner = tasks.beforeTaskOwner()!!
        val t = begin { tasks.isCurrent(owner) }; val p = shown(t)
        tasks.begin()
        assertFalse(p.choose(PromptChoice.ALLOW_ONCE))
        assertEquals(PromptOutcome.STOPPED, t.finalResult().outcome)
        assertNull(tasks.beforeTaskOwner())
    }

    @Test fun preToolPromptRetiresOnEngineLossEvenWithNoActiveTask() {
        val tasks = PhoneTasks(); val owner = tasks.beforeTaskOwner()!!
        val t = begin { tasks.isCurrent(owner) }; tasks.invalidateOwners()
        assertFalse(t.live); assertEquals("stale", t.finalResult().reason)
    }

    @Test fun stopAndClearDoesNotReviveSameTaskIdPermission() {
        val tasks = PhoneTasks(); tasks.begin(); val owner = tasks.activeOwner()!!
        tasks.stop("stop"); tasks.clearStop()
        assertFalse(tasks.isCurrent(owner)); assertFalse(tasks.confirmIfCurrent(owner, waiveTask = true))
    }

    @Test fun finishedOwnerIsRetiredByNewTaskAndNeverStopsIt() {
        val tasks = PhoneTasks(); tasks.begin(); val old = tasks.finishScope()!!
        tasks.begin(); assertFalse(tasks.isCurrent(old)); assertFalse(tasks.stopIfCurrent(old, "late"))
        assertTrue(tasks.isActive)
    }

    @Test fun queuedDartReplyCannotCarryAllowAfterOwnerReplacement() {
        var current = true; val t = begin { current }; shown(t).choose(PromptChoice.ALLOW_ONCE)
        current = false
        assertEquals(PromptOutcome.STOPPED, t.finalResult().outcome)
    }

    @Test fun timelyChoiceCannotAuthorizeAContinuationAfterTheTotalDeadline() {
        val t = begin(kind = PromptKind.REVIEW); shown(t).choose(PromptChoice.OPEN)
        now += 30_000
        assertEquals(PromptOutcome.TIMEOUT, t.finalResult().outcome)
    }

    @Test fun cancelAfterChoiceStillRevokesQueuedReplyWithoutRetainingBody() {
        val t = begin(); shown(t).choose(PromptChoice.ALLOW_ONCE)
        assertTrue(arbiter.cancel("request"))
        assertEquals(PromptOutcome.STOPPED, t.finalResult().outcome)
        assertEquals("cancelled", t.finalResult().reason)
    }

    @Test fun ownerDetachAfterReviewChoiceRevokesQueuedNavigation() {
        val t = begin(kind = PromptKind.REVIEW); shown(t).choose(PromptChoice.OPEN)
        arbiter.cancelOwner(source)
        assertEquals(PromptOutcome.STOPPED, t.finalResult().outcome)
    }

    @Test fun boundedHistoryEvictionCannotReviveAnUndeliveredChoice() {
        val first = begin(kind = PromptKind.REVIEW); shown(first).choose(PromptChoice.OPEN)
        repeat(64) { index -> shown(begin("next-$index")).choose(PromptChoice.REJECT) }
        assertFalse(arbiter.cancel("request"))
        assertEquals(PromptOutcome.STOPPED, first.finalResult().outcome)
    }

    @Test fun handoffHasNoApprovalActions() {
        val t = begin(kind = PromptKind.HANDOFF); val p = shown(t)
        assertFalse(p.choose(PromptChoice.ALLOW_ONCE)); assertTrue(p.choose(PromptChoice.CONTINUE))
        assertEquals(PromptOutcome.CONTINUE, t.finalResult().outcome)
    }

    @Test fun mainThreadTimeoutRevokesQueuedWork() {
        var effects = 0; val call = MainThreadCall { effects++; true }
        assertNull(call.await(1)); call.run(); assertEquals(0, effects)
    }

    @Test fun completedMainThreadWorkReturnsItsValue() {
        val call = MainThreadCall { "done" }; call.run(); assertEquals("done", call.await(1))
    }

    @Test fun hardwareStrokeWithAccessibilityFlagStillWorksAfterArming() {
        assertTrue(PromptInputPolicy.allows(1000, 600, true, false, false, true, false))
    }

    @Test fun injectedTouchesNeverAuthorize() {
        assertFalse(PromptInputPolicy.allows(1000, 600, true, true, false, false, false))
        assertFalse(PromptInputPolicy.allows(1000, 600, true, false, true, true, false))
    }

    @Test fun talkBackExceptionDoesNotBypassArmingOrLifetime() {
        assertTrue(PromptInputPolicy.allows(1000, 600, true, false, true, true, true))
        assertFalse(PromptInputPolicy.allows(500, 600, true, false, true, true, true))
        assertFalse(PromptInputPolicy.allows(1000, 600, false, false, true, true, true))
    }
}
