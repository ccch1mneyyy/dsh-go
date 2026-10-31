package io.github.ccch1mneyyy.dsh_app.i18n

import android.content.Context
import android.content.res.Configuration
import androidx.annotation.PluralsRes
import androidx.annotation.StringRes
import java.util.Locale

/**
 * Native text in the language the app shows (设置 → 语言), not the system's.
 *
 * The Flutter side stores the choice in SharedPreferences as `app_language`
 * (`system` / `zh` / `en` / `pt`, lib/state/locale_state.dart); here it is
 * `flutter.app_language` in `FlutterSharedPreferences`. `values/` holds
 * English, `values-zh/` Chinese, so "follow the system" is plain resource
 * resolution: any Chinese system language gets Chinese, everything else
 * English and `values-pt/` holds Brazilian Portuguese, matching
 * AppLocale.resolve in Dart.
 */
object AppStrings {
    /** The app's name as the phone shows it (`android:label` in AndroidManifest.xml), in every
     *  language: notification titles and their fallbacks. */
    const val APP_NAME = "DSH Go"

    private const val PREFS = "FlutterSharedPreferences"
    private const val KEY = "flutter.app_language"

    @Volatile private var cache: Pair<String, Context>? = null

    /** `zh`, `en`, `pt`, or null to follow the system. */
    fun language(ctx: Context): String? =
        (ctx.applicationContext ?: ctx)
            .getSharedPreferences(PREFS, Context.MODE_PRIVATE)
            .getString(KEY, null)
            ?.takeIf { it == "zh" || it == "en" || it == "pt" }

    /** True when native text comes out in English. */
    fun isEnglish(ctx: Context): Boolean =
        context(ctx).resources.configuration.locales[0].language != "zh"

    /** A context whose resources are in the app language. */
    fun context(ctx: Context): Context {
        val app = ctx.applicationContext ?: ctx
        val lang = language(app) ?: return app
        cache?.let { (l, c) -> if (l == lang) return c }
        val locale = when (lang) {
            "zh" -> Locale.SIMPLIFIED_CHINESE
            "pt" -> Locale.forLanguageTag("pt-BR")
            else -> Locale.ENGLISH
        }
        val config = Configuration(app.resources.configuration).apply { setLocale(locale) }
        return app.createConfigurationContext(config).also { cache = lang to it }
    }

    fun get(ctx: Context, @StringRes id: Int): String = context(ctx).getString(id)

    fun get(ctx: Context, @StringRes id: Int, vararg args: Any): String = context(ctx).getString(id, *args)

    fun plural(ctx: Context, @PluralsRes id: Int, count: Int, vararg args: Any): String =
        context(ctx).resources.getQuantityString(id, count, *args)
}
