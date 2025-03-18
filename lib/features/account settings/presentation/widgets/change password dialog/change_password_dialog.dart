import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/change%20password%20dialog/change_password_dialog_state_mixin.dart';
import 'package:roof_admin_panel/product/utility/extensions/form_submit_on_key_enter_extension.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/password_field.dart';

class ChangePasswordDialog extends ConsumerStatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends ConsumerState<ChangePasswordDialog>
    with ChangePasswordDialogStateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      content: Form(
        key: formKey,
        child: SizedBox(
          width:
              context.dynamicWidth(0.3) > 500 ? 500 : context.dynamicWidth(0.3),
          child: Column(
            spacing: SpacingSizes.large,
            mainAxisSize: MainAxisSize.min,
            children: [
              // new password
              PasswordField(
                passwordController: passwordController,
                validator: validator,
                label:
                    LocaleKeys.accountSettingView_inputFields_newPassword.tr(),
              ),
              // confirm password
              PasswordField(
                passwordController: confirmPasswordController,
                validator: validator,
                label: LocaleKeys.accountSettingView_inputFields_confirmPassword
                    .tr(),
              ),
            ],
          ),
        ),
      ).submitOnEnter(
        onKeyEnter: submit,
      ),
      actions: [
        TextButton(
          onPressed: context.pop,
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        ElevatedButton(
          onPressed: submit,
          child: Text(LocaleKeys.common_save.tr()),
        ),
      ],
    );
  }
}
