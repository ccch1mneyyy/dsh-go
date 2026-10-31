package io.github.ccch1mneyyy.dsh_app.runtime

import java.net.DatagramPacket
import java.net.DatagramSocket
import java.net.InetAddress
import java.net.InetSocketAddress
import java.net.SocketException

/**
 * Some VPN/proxy apps "disable IPv6" with a content-matching rule that REJECTs every
 * outgoing UDP/53 packet carrying an AAAA question (issue #55). glibc's dual-stack
 * getaddrinfo then discards the A answers too, so every request in the guest fails.
 *
 * The probe only sends one AAAA query to the resolver and never waits for a reply: a
 * rule like that fails `send()` locally with EPERM, so no network round trip is needed.
 * Any other outcome (sent, unreachable, no IPv4 server) keeps IPv6 lookups enabled, so
 * IPv6-only and ordinary dual-stack networks are unaffected.
 */
object AaaaProbe {
    /** True only when the local stack refuses to send an AAAA query to [server]. */
    fun blocked(server: String, send: (DatagramPacket) -> Unit = ::sendOnce): Boolean {
        val address = try {
            if (!isLiteral(server)) return false
            InetAddress.getByName(server)
        } catch (_: Exception) {
            return false
        }
        val query = query()
        return try {
            send(DatagramPacket(query, query.size, InetSocketAddress(address, 53)))
            false
        } catch (e: SocketException) {
            isPermissionDenied(e)
        } catch (_: Exception) {
            false
        }
    }

    internal fun isPermissionDenied(e: Throwable): Boolean {
        var cause: Throwable? = e
        while (cause != null) {
            val message = cause.message.orEmpty()
            if (message.contains("EPERM") || message.contains("Operation not permitted")) return true
            cause = cause.cause
        }
        return false
    }

    private fun sendOnce(packet: DatagramPacket) {
        DatagramSocket().use { it.send(packet) }
    }

    // Numeric addresses only: InetAddress.getByName must never start a DNS lookup here.
    private fun isLiteral(value: String) = value.isNotEmpty() &&
        value.all { it in '0'..'9' || it in 'a'..'f' || it in 'A'..'F' || it == '.' || it == ':' }

    /** A minimal recursive AAAA question for a fixed public name (qtype 28, qclass IN). */
    internal fun query(): ByteArray {
        val header = byteArrayOf(0x44, 0x53, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
        val name = "dns.google".split('.').flatMap { listOf(it.length.toByte()) + it.toByteArray().toList() } + 0.toByte()
        return header + name.toByteArray() + byteArrayOf(0x00, 0x1c, 0x00, 0x01)
    }
}
