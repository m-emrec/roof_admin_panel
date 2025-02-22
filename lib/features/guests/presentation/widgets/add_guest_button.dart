import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/guests/presentation/widgets/add%20guest%20dialog/add_guest_dialog.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

/// This button displayed at the top of the guests table
/// to add a new guest
class AddGuestButton extends StatelessWidget {
  /// This button displayed at the top of the guests table
  /// to add a new guest
  const AddGuestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () => CustomAlertDialog.showAlertDialog(
            context: context,
            content: const AddGuestDialog(),
          ),
          child: Text(
            LocaleKeys.guestsView_addGuest.tr(),
          ),
        ),
      ],
    );
  }
}
