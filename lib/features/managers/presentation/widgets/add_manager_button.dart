import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/add%20new%20manager/add_manager_dialog.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/permissions_handler.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

///
class AddManagerButton extends StatelessWidget {
  ///
  const AddManagerButton({super.key});

  ///
  void onTapAdd(BuildContext context) {
    CustomAlertDialog.showAlertDialog(
      context: context,
      barrierDismissible: true,
      content: const AddManagerDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: PermissionBasedAction(
        () => onTapAdd(context),
        necessaryPermissions: [Permissions.canEditManagers],
      ).call(),
      child: Text(LocaleKeys.managersView_addManager.tr()),
    );
  }
}
