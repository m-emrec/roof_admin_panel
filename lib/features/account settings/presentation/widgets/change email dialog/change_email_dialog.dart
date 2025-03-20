import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/form_submit_on_key_enter_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/email_field.dart';

class ChangeEmailDialog extends ConsumerWidget {
  const ChangeEmailDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();

    return CustomAlertDialog(
      content: EmailField(emailController),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        TextButton(
          onPressed: () => submit(context, emailController, ref),
          child: Text(LocaleKeys.common_save.tr()),
        ),
      ],
    ).submitOnEnter(
      onKeyEnter: () => submit(context, emailController, ref),
    );
  }

  Future<void> submit(
    BuildContext context,
    TextEditingController emailController,
    WidgetRef ref,
  ) async =>
      await ref
          .read(accountSettingsNotifierProvider.notifier)
          .updateEmail(emailController.text)
          .showLoading(context: context)
          .then((_) => CustomAlertDialog.hideAlertDialog(context));
}
