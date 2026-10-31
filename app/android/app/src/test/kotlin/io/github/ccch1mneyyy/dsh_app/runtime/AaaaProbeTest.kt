package io.github.ccch1mneyyy.dsh_app.runtime

import java.net.DatagramPacket
import java.net.SocketException
import org.junit.Assert.*
import org.junit.Test

class AaaaProbeTest {
    @Test fun queryAsksForAaaaInClassIn() {
        val query = AaaaProbe.query()
        assertArrayEquals(byteArrayOf(0x00, 0x1c, 0x00, 0x01), query.copyOfRange(query.size - 4, query.size))
        assertEquals(1, query[5].toInt()) // one question
    }

    @Test fun epermOnSendMeansBlocked() {
        var sent: DatagramPacket? = null
        assertTrue(AaaaProbe.blocked("223.5.5.5") { sent = it; throw SocketException("sendto failed: EPERM (Operation not permitted)") })
        assertEquals(53, sent!!.port)
    }

    @Test fun sentOrOtherFailuresAreNotBlocked() {
        assertFalse(AaaaProbe.blocked("2001:db8::53") { })
        assertFalse(AaaaProbe.blocked("223.5.5.5") { throw SocketException("Network is unreachable") })
        assertFalse(AaaaProbe.blocked("223.5.5.5") { throw IllegalStateException("EPERM") })
    }

    @Test fun nonLiteralServerIsNeverResolved() {
        assertFalse(AaaaProbe.blocked("dns.example") { fail("must not send"); })
    }
}
