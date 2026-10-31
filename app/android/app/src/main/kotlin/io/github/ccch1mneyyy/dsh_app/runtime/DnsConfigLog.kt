package io.github.ccch1mneyyy.dsh_app.runtime

enum class DnsConfigOutcome(val wire: String) { WRITTEN("written"), UNCHANGED("unchanged"), FAILED("failed") }
enum class DnsConfigStage(val wire: String) { NONE("none"), PREPARE("prepare"), READ("read"), WRITE("write"), REPLACE("replace") }
enum class DnsConfigError(val wire: String) { NONE("none"), IO("io"), SECURITY("security"), NATIVE("native"), OTHER("other") }
enum class DnsNetworkRead(val wire: String) { PROVIDED("provided"), READ("read"), EMPTY("empty"), FAILED("failed") }
enum class DnsConfigSource(val wire: String) { START("start"), NETWORK("network") }

/** An attempted configuration. A failed write says nothing about the file still in use. */
data class DnsConfigReport(
    val outcome: DnsConfigOutcome,
    val requestedServers: List<String>,
    val stage: DnsConfigStage = DnsConfigStage.NONE,
    val error: DnsConfigError = DnsConfigError.NONE,
    val errno: Int? = null,
    val networkRead: DnsNetworkRead = DnsNetworkRead.PROVIDED,
    /** The device refused to send an AAAA query, so glibc is told not to ask (issue #55). */
    val noAaaa: Boolean = false,
) {
    val options: String get() = options(noAaaa)

    companion object {
        const val OPTIONS = "timeout:2 attempts:2"
        fun options(noAaaa: Boolean) = if (noAaaa) "$OPTIONS no-aaaa" else OPTIONS
    }
}

/** Used on RuntimeController's worker; keeps only the last bounded, content-free report. */
class DnsConfigLog {
    private var last: String? = null

    fun line(report: DnsConfigReport, source: DnsConfigSource, wallClockMs: Long, elapsedMs: Long): String? {
        val detail = buildString {
            append("result=${report.outcome.wire} requested=")
            append(report.requestedServers.take(3).mapIndexed { i, value -> "ns${i + 1}=${address(value)}" }.joinToString(","))
            append(" options=\"${report.options}\" networkRead=${report.networkRead.wire}")
            if (report.outcome == DnsConfigOutcome.FAILED) {
                append(" stage=${report.stage.wire} error=${report.error.wire}")
                report.errno?.let { append(" errno=$it") }
            }
        }
        // Repeated callbacks with the same no-op/failure do not fill the log. A real write,
        // a changed report, recovery, and every startup remain visible.
        val repeated = detail == last
        last = detail
        if (source == DnsConfigSource.NETWORK && repeated && report.outcome != DnsConfigOutcome.WRITTEN) return null
        return "[dsh-app] resolv.conf: atMs=$wallClockMs elapsedMs=$elapsedMs source=${source.wire} $detail"
    }

    // Production values come from InetAddress.hostAddress, never hostnames or exception text.
    // Keep this boundary bounded even if another caller supplies an unexpected value.
    private fun address(value: String): String =
        if (value.length in 1..45 && value.any { it == '.' || it == ':' } &&
            value.all { it in '0'..'9' || it in 'a'..'f' || it in 'A'..'F' || it == '.' || it == ':' }
        ) value else "invalid"
}
