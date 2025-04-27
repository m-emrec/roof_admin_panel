import 'package:core/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class BanMemberDialog extends ConsumerWidget {
  const BanMemberDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAlertDialog<void>(
      content: Text(
        LocaleKeys.memberDetailView_options_areYouSure.tr(
          args: [
            ref.read(membershipDetailNotifierProvider)?.name ?? '',
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => CustomAlertDialog.hideAlertDialog<void>(
            context,
            forceClose: true,
          ),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        FilledButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              AppColors.accentError[50],
            ),
            foregroundColor: WidgetStatePropertyAll(
              AppColors.accentError[20],
            ),
          ),
          onPressed: () =>
              _banMember(ref, context).showLoading(context: context),
          child: Text(
            LocaleKeys.memberDetailView_options_ban.tr(),
          ),
        ),
      ],
    );
  }

  Future<void> _banMember(
    WidgetRef ref,
    BuildContext context,
  ) async {
    final member = ref.read(membershipDetailNotifierProvider);
    if (member == null) return;
    ref.read(banMemberProvider(member));
    CustomAlertDialog.hideAlertDialog<void>(context, forceClose: true);
  }
}
