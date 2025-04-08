// ignore_for_file: public_member_api_docs

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/change%20password%20dialog/change_password_dialog.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

mixin ChangePasswordDialogStateMixin on ConsumerState<ChangePasswordDialog> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> submit() async {
    if (formKey.currentState?.validate() ?? false) {
      await ref
          .read(accountSettingsNotifierProvider.notifier)
          .changePassword(
            passwordController.text,
          )
          .showLoading(context: context);
      CustomAlertDialog.hideAlertDialog(context);
    }
  }

  ///
  String? validator(String? text) {
    if (text != confirmPasswordController.text) {
      return LocaleKeys.accountSettingView_validators_confirmPassword.tr();
    }
    return ValidatorMethods(text: text).validatePassword;
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    formKey.currentState?.dispose();

    super.dispose();
  }
}
