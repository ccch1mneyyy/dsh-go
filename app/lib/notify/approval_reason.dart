/// Picks the first nonblank approval reason in the app's language fallback order.
String? localizedApprovalReason(Map<String, String> reasons, String languageCode) {
  final locales = switch (languageCode) {
    'pt' => const ['pt-BR', 'pt', 'en', 'zh-CN', 'zh-Hans', 'zh'],
    'en' => const ['en', 'zh-CN', 'zh-Hans', 'zh'],
    _ => const ['zh-CN', 'zh-Hans', 'zh', 'en'],
  };
  for (final locale in locales) {
    final reason = reasons[locale]?.trim();
    if (reason != null && reason.isNotEmpty) return reason;
  }
  return null;
}
