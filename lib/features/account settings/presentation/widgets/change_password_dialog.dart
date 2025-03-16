import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/password_field.dart';

class ChangePasswordDialog extends ConsumerStatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends ConsumerState<ChangePasswordDialog> {
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: Text("Change Password"),
      content: Column(
        spacing: SpacingSizes.medium,
        mainAxisSize: MainAxisSize.min,
        children: [
          PasswordField(
            passwordController: TextEditingController(),
          ),
          PasswordField(
            passwordController: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
