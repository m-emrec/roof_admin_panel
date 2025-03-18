import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/auth/data/services/auth_service.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class LogOutConfirmationDialog extends StatelessWidget {
  const LogOutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      content: Text(
        LocaleKeys.accountSettingView_logOutConfirmation.tr(),
      ),
      actions: [
        TextButton(
          onPressed: () => CustomAlertDialog.hideAlertDialog(context),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        TextButton(
          onPressed: AuthService().signOut,
          child: Text(LocaleKeys.accountSettingView_logOut.tr()),
        ),
      ],
    );
  }
}
