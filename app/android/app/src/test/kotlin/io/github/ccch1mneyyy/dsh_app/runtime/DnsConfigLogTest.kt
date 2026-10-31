package io.github.ccch1mneyyy.dsh_app.runtime

import org.junit.Assert.*
import org.junit.Test

class DnsConfigLogTest {
    private val unchanged = DnsConfigReport(DnsConfigOutcome.UNCHANGED, listOf("1.1.1.1", "::1"))
    private val failed = unchanged.copy(outcome = DnsConfigOutcome.FAILED, stage = DnsConfigStage.REPLACE,
        error = DnsConfigError.NATIVE, errno = 13)

    @Test fun lineCarriesBothClocksSourceRequestedConfigurationAndOutcome() {
        val text = DnsConfigLog().line(unchanged, DnsConfigSource.START, 1700000000000L, 1234L)!!
        assertTrue(text.contains("atMs=1700000000000 elapsedMs=1234 source=start"))
        assertTrue(text.contains("result=unchanged requested=ns1=1.1.1.1,ns2=::1"))
        assertTrue(text.contains("options=\"timeout:2 attempts:2\""))
        assertFalse(text.contains("stage="))
        assertFalse(text.contains("error="))
    }

    @Test fun repeatedNetworkNoopIsSuppressedButEveryStartIsKept() {
        val log = DnsConfigLog()
        assertNotNull(log.line(unchanged, DnsConfigSource.NETWORK, 1, 2))
        assertNull(log.line(unchanged, DnsConfigSource.NETWORK, 3, 4))
        assertNotNull(log.line(unchanged, DnsConfigSource.START, 5, 6))
        assertNotNull(log.line(unchanged, DnsConfigSource.START, 7, 8))
    }

    @Test fun repeatedFailureIsSuppressedAndRecoveryAndRelapseRemainVisible() {
        val log = DnsConfigLog()
        assertNotNull(log.line(failed, DnsConfigSource.NETWORK, 1, 2))
        assertNull(log.line(failed, DnsConfigSource.NETWORK, 3, 4))
        assertNotNull(log.line(unchanged, DnsConfigSource.NETWORK, 5, 6))
        assertNotNull(log.line(failed, DnsConfigSource.NETWORK, 7, 8))
    }

    @Test fun everyRealRewriteIsLoggedEvenForTheSameRequestedServers() {
        val log = DnsConfigLog()
        val written = unchanged.copy(outcome = DnsConfigOutcome.WRITTEN)
        assertNotNull(log.line(written, DnsConfigSource.NETWORK, 1, 2))
        assertNotNull(log.line(written, DnsConfigSource.NETWORK, 3, 4))
    }

    @Test fun changedServerAndChangedFailureEachProduceAnEntry() {
        val log = DnsConfigLog()
        assertNotNull(log.line(failed, DnsConfigSource.NETWORK, 1, 2))
        assertNotNull(log.line(failed.copy(requestedServers = listOf("9.9.9.9")), DnsConfigSource.NETWORK, 3, 4))
        assertNotNull(log.line(failed.copy(errno = 28), DnsConfigSource.NETWORK, 5, 6))
        assertNotNull(log.line(failed.copy(stage = DnsConfigStage.WRITE), DnsConfigSource.NETWORK, 7, 8))
    }

    @Test fun networkDiscoveryFailureAndItsRecoveryAreNotDeduplicatedAway() {
        val log = DnsConfigLog()
        assertNotNull(log.line(unchanged, DnsConfigSource.NETWORK, 1, 2))
        assertNotNull(log.line(unchanged.copy(networkRead = DnsNetworkRead.FAILED), DnsConfigSource.NETWORK, 3, 4))
        assertNotNull(log.line(unchanged.copy(networkRead = DnsNetworkRead.READ), DnsConfigSource.NETWORK, 5, 6))
    }

    @Test fun fieldsAreBoundedAndCannotInjectFreeTextOrExtraLines() {
        val malicious = failed.copy(requestedServers = listOf("token=secret\nforged", "f".repeat(10000), "2001:db8::1", "8.8.8.8"),
            errno = Int.MIN_VALUE)
        val text = DnsConfigLog().line(malicious, DnsConfigSource.NETWORK, Long.MIN_VALUE, Long.MAX_VALUE)!!
        assertTrue(text.contains("requested=ns1=invalid,ns2=invalid,ns3=2001:db8::1"))
        assertFalse(text.contains("secret"))
        assertFalse(text.contains("forged"))
        assertFalse(text.contains("8.8.8.8"))
        assertFalse(text.contains('\n'))
        assertTrue(text.length < 512)
    }

    @Test fun failedAttemptDoesNotClaimThatItsConfigurationBecameEffective() {
        val text = DnsConfigLog().line(failed, DnsConfigSource.NETWORK, 1, 2)!!
        assertTrue(text.contains("result=failed requested="))
        assertTrue(text.contains("stage=replace error=native errno=13"))
        assertFalse(text.contains("effective="))
        assertFalse(text.contains("active="))
    }

    @Test fun noAaaaIsVisibleInTheLine() {
        val text = DnsConfigLog().line(unchanged.copy(noAaaa = true), DnsConfigSource.START, 1, 2)!!
        assertTrue(text.contains("options=\"timeout:2 attempts:2 no-aaaa\""))
    }
}
