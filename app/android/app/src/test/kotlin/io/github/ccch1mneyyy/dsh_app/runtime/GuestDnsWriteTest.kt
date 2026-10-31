package io.github.ccch1mneyyy.dsh_app.runtime

import java.io.File
import java.io.IOException
import java.net.InetAddress
import java.nio.file.Files
import java.nio.file.StandardCopyOption.ATOMIC_MOVE
import java.nio.file.StandardCopyOption.REPLACE_EXISTING
import org.junit.Assert.*
import org.junit.Assume.assumeFalse
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder

class GuestDnsWriteTest {
    @get:Rule val temporary = TemporaryFolder()
    private val servers = listOf("1.1.1.1", "2001:4860:4860::8888", "223.5.5.5")
    private val expected = "# written by dsh-app from the device's active network\n" +
        "nameserver 1.1.1.1\nnameserver 2001:4860:4860::8888\nnameserver 223.5.5.5\n" +
        "options timeout:2 attempts:2\n"

    private fun replace(from: String, to: String) {
        Files.move(File(from).toPath(), File(to).toPath(), ATOMIC_MOVE, REPLACE_EXISTING)
    }

    private fun existing(root: File, text: String = "old configuration\n"): File =
        File(root, "etc/resolv.conf").apply { parentFile!!.mkdirs(); writeText(text) }

    private fun line(report: DnsConfigReport) = DnsConfigLog().line(report, DnsConfigSource.NETWORK, 123L, 456L)!!

    @Test fun newFileKeepsExactLegacyContents() {
        val root = temporary.newFolder()
        val report = GuestSetup.writeResolvConf(root, servers, ::replace)
        assertEquals(DnsConfigOutcome.WRITTEN, report.outcome)
        assertEquals(servers, report.requestedServers)
        assertEquals(expected, File(root, "etc/resolv.conf").readText())
        assertFalse(File(root, "etc/.resolv.conf.dsh-tmp").exists())
    }

    @Test fun matchingFileDoesNotWriteOrRename() {
        val root = temporary.newFolder()
        val file = existing(root, expected)
        assertTrue(file.setLastModified(123456789000L))
        val before = file.lastModified()
        var replacements = 0
        val report = GuestSetup.writeResolvConf(root, servers) { _, _ -> replacements++ }
        assertEquals(DnsConfigOutcome.UNCHANGED, report.outcome)
        assertEquals(0, replacements)
        assertEquals(before, file.lastModified())
        assertEquals(expected, file.readText())
        assertFalse(File(root, "etc/.resolv.conf.dsh-tmp").exists())
    }

    @Test fun changedSymlinkIsReplacedWithoutChangingItsReferent() {
        val root = temporary.newFolder()
        val referent = temporary.newFile().apply { writeText("other resolver\n") }
        val target = File(root, "etc/resolv.conf").apply { parentFile!!.mkdirs() }
        Files.createSymbolicLink(target.toPath(), referent.toPath())
        val report = GuestSetup.writeResolvConf(root, servers, ::replace)
        assertEquals(DnsConfigOutcome.WRITTEN, report.outcome)
        assertFalse(Files.isSymbolicLink(target.toPath()))
        assertEquals(expected, target.readText())
        assertEquals("other resolver\n", referent.readText())
    }

    @Test fun matchingSymlinkKeepsTheLegacyNoop() {
        val root = temporary.newFolder()
        val referent = temporary.newFile().apply { writeText(expected) }
        val target = File(root, "etc/resolv.conf").apply { parentFile!!.mkdirs() }
        Files.createSymbolicLink(target.toPath(), referent.toPath())
        val report = GuestSetup.writeResolvConf(root, servers) { _, _ -> fail("No rename expected") }
        assertEquals(DnsConfigOutcome.UNCHANGED, report.outcome)
        assertTrue(Files.isSymbolicLink(target.toPath()))
        assertEquals(expected, referent.readText())
    }

    @Test fun replaceFailurePreservesOldFileAndDoesNotLogTheExceptionMessage() {
        val root = temporary.newFolder()
        val target = existing(root)
        val report = GuestSetup.writeResolvConf(root, servers) { _, _ -> throw IOException("secret-path-and-token") }
        assertEquals(DnsConfigOutcome.FAILED, report.outcome)
        assertEquals(DnsConfigStage.REPLACE, report.stage)
        assertEquals(DnsConfigError.IO, report.error)
        assertEquals("old configuration\n", target.readText())
        assertTrue(line(report).contains("result=failed requested=ns1=1.1.1.1"))
        assertFalse(line(report).contains("secret-path-and-token"))
        assertFalse(line(report).contains(root.path))
    }

    @Test fun occupiedTemporaryPathReportsWriteFailure() {
        val root = temporary.newFolder()
        val target = existing(root)
        assertTrue(File(root, "etc/.resolv.conf.dsh-tmp").mkdir())
        val report = GuestSetup.writeResolvConf(root, servers) { _, _ -> fail("Write failed before rename") }
        assertEquals(DnsConfigOutcome.FAILED, report.outcome)
        assertEquals(DnsConfigStage.WRITE, report.stage)
        assertEquals(DnsConfigError.IO, report.error)
        assertEquals("old configuration\n", target.readText())
    }

    @Test fun nonDirectoryEtcReportsPrepareFailure() {
        val root = temporary.newFolder()
        val etc = File(root, "etc").apply { writeText("keep me") }
        val report = GuestSetup.writeResolvConf(root, servers) { _, _ -> fail("Cannot prepare directory") }
        assertEquals(DnsConfigOutcome.FAILED, report.outcome)
        assertEquals(DnsConfigStage.PREPARE, report.stage)
        assertEquals(DnsConfigError.IO, report.error)
        assertEquals("keep me", etc.readText())
    }

    @Test fun unreadableCurrentFileReportsReadFailure() {
        val root = temporary.newFolder()
        val target = existing(root)
        assertTrue(target.setReadable(false, false))
        try {
            assumeFalse("This permission case requires an unprivileged test process", target.canRead())
            val report = GuestSetup.writeResolvConf(root, servers) { _, _ -> fail("Cannot read current file") }
            assertEquals(DnsConfigOutcome.FAILED, report.outcome)
            assertEquals(DnsConfigStage.READ, report.stage)
            assertEquals(DnsConfigError.IO, report.error)
        } finally {
            assertTrue(target.setReadable(true, true))
        }
        assertEquals("old configuration\n", target.readText())
    }

    @Test fun networkReadFailureStillWritesFallbackAndIsVisible() {
        val root = temporary.newFolder()
        val report = GuestSetup.writeResolvConfFromNetwork(root, { throw SecurityException("private-network-detail") }, ::replace)
        assertEquals(DnsConfigOutcome.WRITTEN, report.outcome)
        assertEquals(DnsNetworkRead.FAILED, report.networkRead)
        assertEquals(listOf("223.5.5.5", "119.29.29.29", "8.8.8.8"), report.requestedServers)
        assertTrue(File(root, "etc/resolv.conf").readText().contains("nameserver 8.8.8.8\n"))
        assertTrue(line(report).contains("networkRead=failed"))
        assertFalse(line(report).contains("private-network-detail"))
    }

    @Test fun emptyNetworkIsDistinctFromReadFailure() {
        val root = temporary.newFolder()
        val report = GuestSetup.writeResolvConfFromNetwork(root, { emptyList() }, ::replace)
        assertEquals(DnsConfigOutcome.WRITTEN, report.outcome)
        assertEquals(DnsNetworkRead.EMPTY, report.networkRead)
        assertEquals(listOf("223.5.5.5", "119.29.29.29", "8.8.8.8"), report.requestedServers)
    }

    @Test fun networkDiscoveryKeepsIpv4FirstAndTheFallback() {
        val root = temporary.newFolder()
        val v6 = InetAddress.getByName("2001:4860:4860::8888")
        val v4 = InetAddress.getByName("1.1.1.1")
        val report = GuestSetup.writeResolvConfFromNetwork(root, { listOf(v6, v4) }, ::replace)
        assertEquals(DnsNetworkRead.READ, report.networkRead)
        assertEquals(listOf("1.1.1.1", v6.hostAddress, "223.5.5.5"), report.requestedServers)
    }

    @Test fun failedWriteAndFailedDiscoveryAreBothPreserved() {
        val root = temporary.newFolder()
        File(root, "etc").writeText("not a directory")
        val report = GuestSetup.writeResolvConfFromNetwork(root, { throw IOException("private") }, ::replace)
        assertEquals(DnsConfigOutcome.FAILED, report.outcome)
        assertEquals(DnsConfigStage.PREPARE, report.stage)
        assertEquals(DnsNetworkRead.FAILED, report.networkRead)
        assertTrue(line(report).contains("networkRead=failed stage=prepare error=io"))
    }

    @Test fun unexpectedReplaceExceptionDoesNotEscapeOrDiscloseText() {
        val root = temporary.newFolder()
        val target = existing(root)
        val report = GuestSetup.writeResolvConf(root, servers) { _, _ -> throw IllegalStateException("private-account") }
        assertEquals(DnsConfigError.OTHER, report.error)
        assertEquals(DnsConfigOutcome.FAILED, report.outcome)
        assertEquals("old configuration\n", target.readText())
        assertFalse(line(report).contains("private-account"))
    }

    @Test fun securityReplaceExceptionIsReportedWithoutItsMessage() {
        val root = temporary.newFolder()
        val target = existing(root)
        val report = GuestSetup.writeResolvConf(root, servers) { _, _ -> throw SecurityException("private-path") }
        assertEquals(DnsConfigError.SECURITY, report.error)
        assertEquals(DnsConfigStage.REPLACE, report.stage)
        assertEquals("old configuration\n", target.readText())
        assertFalse(line(report).contains("private-path"))
    }

    @Test fun blockedAaaaProbeAddsNoAaaa() {
        val root = temporary.newFolder()
        val probed = mutableListOf<String>()
        val report = GuestSetup.writeResolvConfFromNetwork(root, { listOf(InetAddress.getByName("192.0.2.53")) }, ::replace) {
            probed += it; true
        }
        assertEquals(listOf("192.0.2.53"), probed)
        assertTrue(report.noAaaa)
        assertTrue(File(root, "etc/resolv.conf").readText().endsWith("options timeout:2 attempts:2 no-aaaa\n"))
        assertTrue(line(report).contains("options=\"timeout:2 attempts:2 no-aaaa\""))
    }

    @Test fun workingAaaaProbeKeepsIpv6Lookups() {
        val root = temporary.newFolder()
        val v6 = InetAddress.getByName("2001:db8::53")
        val report = GuestSetup.writeResolvConfFromNetwork(root, { listOf(v6) }, ::replace) { false }
        assertFalse(report.noAaaa)
        assertFalse(File(root, "etc/resolv.conf").readText().contains("no-aaaa"))
    }

    @Test fun failingProbeIsTreatedAsNotBlocked() {
        assertFalse(GuestSetup.aaaaBlocked(servers) { throw IllegalStateException("probe") })
        assertFalse(GuestSetup.aaaaBlocked(emptyList()) { true })
    }

    @Test fun noAaaaIsDroppedWhenTheNetworkRecovers() {
        val root = temporary.newFolder()
        assertEquals(DnsConfigOutcome.WRITTEN, GuestSetup.writeResolvConf(root, servers, true, ::replace).outcome)
        assertEquals(DnsConfigOutcome.WRITTEN, GuestSetup.writeResolvConf(root, servers, ::replace).outcome)
        assertEquals(expected, File(root, "etc/resolv.conf").readText())
    }
}
