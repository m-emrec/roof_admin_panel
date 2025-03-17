import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      // title: Text("Change Password"),
      content: Form(
        key: formKey,
        child: SizedBox(
          width: 300,
          child: Column(
            spacing: SpacingSizes.medium,
            mainAxisSize: MainAxisSize.min,
            children: [
              PasswordField(
                passwordController: passwordController,
                validator: validator,
              ),
              PasswordField(
                passwordController: confirmPasswordController,
                validator: validator,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: submit,
          child: Text("Change"),
        ),
      ],
    ).submitOnEnter(
      onKeyEnter: submit,
    );
  }
}
