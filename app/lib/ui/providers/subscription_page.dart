// 订阅详情 (a detail page): who is signed in, the models the subscription brings
// (its catalog group), 「退出登录」. 「暂无模型」 only when the catalog was read and
// lists none for it; a failed read is an error with 「重试」, no connection is
// the offline message.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../../state/models_state.dart';
import '../../state/read_list_cache.dart' show ReadListStatus;
import '../../state/subscriptions_state.dart';
import '../common/list_page_row.dart';
import '../common/page_hero.dart';
import '../common/read_list_status.dart';
import '../common/status_chip.dart';
import '../features/feature_kit.dart';
import '../features/feature_widgets.dart';
import '../shell/page_frame.dart';
import '../theme/app_icons.dart';
import '../theme/theme.dart';
import 'provider_widgets.dart';
import 'subscription_sheet.dart';

class SubscriptionPage extends ConsumerStatefulWidget {
  const SubscriptionPage({super.key, required this.subscription});

  final Subscription subscription;

  @override
  ConsumerState<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends ConsumerState<SubscriptionPage> {
  bool _busy = false;

  String get _label => subscriptionLabel(widget.subscription);

  Future<void> _signOut() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: Text(context.l10n.engineSubscriptionSignOutTitle(_label)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialog, false), child: Text(context.l10n.commonCancel)),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: DshColors.of(dialog).danger,
              foregroundColor: DshColors.of(dialog).onDanger,
            ),
            onPressed: () => Navigator.pop(dialog, true),
            child: Text(context.l10n.commonSignOut),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    final backend = ref.read(subscriptionBackendProvider);
    if (backend == null) return;
    setState(() => _busy = true);
    try {
      await backend.signOut(widget.subscription);
      refreshAfterSubscriptionChange(ref);
      if (mounted) Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      setState(() => _busy = false);
      ScaffoldMessenger.maybeOf(
        context,
      )?.showSnackBar(SnackBar(content: Text(context.l10n.engineSubscriptionSignOutFailed(describeLoginError(error)))));
    }
  }

  /// The catalog couldn't say which models the subscription brings: [error]
  /// when the read failed, null when the catalog reported this provider failing
  /// (its message is the engine's own text, not shown).
  Widget _modelsFailed(Object? error) {
    final title = context.l10n.engineSubscriptionModelsFailed;
    void retry() => ref.invalidate(modelCatalogProvider);
    return error == null
        ? FeatureMessage(icon: AppIcons.error, title: title, action: (context.l10n.commonRetry, retry))
        : FeatureMessage.error(title: title, error: error, onRetry: retry);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = DshColors.of(context);
    final snapshot = ref.watch(subscriptionsProvider).value;
    final status = snapshot?.of(widget.subscription);
    final signedIn = status?.signedIn ?? false;
    final catalog = ref.watch(modelCatalogProvider);
    final wire = widget.subscription.wire;
    final models = [
      for (final group in catalog.value?.groups ?? const [])
        if (group.id == wire) ...group.models,
    ];
    // The read failed, or the catalog says this subscription's provider did:
    // that doesn't show it has no models. (Other providers' failures don't
    // count against this one.)
    final failed = catalog.hasError || (catalog.value?.failures.any((f) => f.provider == wire) ?? false);
    final account = status?.account?.trim();
    const gap = SizedBox(height: 24);
    final modelsTitle = models.isEmpty ? l10n.engineModelTitle : l10n.engineProviderModelCount(models.length);

    return AppPage(
      title: _label,
      hero: PageHero(
        leading: Monogram(_label, size: 56, letter: subscriptionLetter(widget.subscription)),
        title: _label,
        subtitle: Row(
          children: [
            ProviderDot(signedIn ? StatusTone.ok : StatusTone.idle),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                signedIn ? l10n.commonSignedIn : l10n.engineAccountSignedOut,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      slivers: [
        SliverList.list(
          children: [
            ListPageCard(
              children: [
                ListPageRow(
                  icon: AppIcons.account,
                  title: l10n.engineAccountTitle,
                  value: account == null || account.isEmpty
                      ? (signedIn ? l10n.commonSignedIn : l10n.engineAccountSignedOut)
                      : account,
                ),
              ],
            ),
            gap,
            if (models.isEmpty && !catalog.isLoading && failed)
              _modelsFailed(catalog.error)
            else if (models.isEmpty && !catalog.isLoading && catalog.value == null)
              const FeatureOffline()
            else
              ListPageCard(
                // Models kept from before a failed refresh: shown, marked as such.
                title: failed ? readListHeading(modelsTitle, ReadListStatus.failed) : modelsTitle,
                children: [
                  if (catalog.isLoading && models.isEmpty)
                    const QuietSpinner(padding: EdgeInsets.symmetric(vertical: 16))
                  else if (models.isEmpty)
                    ListPageRow(
                      icon: AppIcons.modelItem,
                      iconColor: colors.textTertiary,
                      title: l10n.engineSubscriptionNoModels,
                    )
                  else
                    for (final model in models)
                      ListPageRow(
                        icon: AppIcons.modelItem,
                        title: model.name,
                        subtitle: model.name == model.id ? null : model.id,
                      ),
                ],
              ),
            gap,
            Center(
              child: TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: colors.danger),
                onPressed: _busy || !signedIn ? null : _signOut,
                icon: const Icon(AppIcons.logout, size: 19),
                label: Text(l10n.commonSignOut),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
