// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/change%20email%20dialog/change_email_dialog.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/change%20password%20dialog/change_password_dialog.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/log_out_confirmation_dialog.dart';
import 'package:roof_admin_panel/features/auth/data/services/auth_service.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // alignment: WrapAlignment.center,
      direction: Axis.vertical,
      spacing: SpacingSizes.small,
      children: [
        // change email
        _Button(
          label: LocaleKeys.accountSettingView_changeEmail.tr(),
          onPressed: () => CustomAlertDialog.showAlertDialog(
            barrierDismissible: true,
            context: context,
            content: const ChangeEmailDialog(),
          ),
          icon: Icon(
            Icons.alternate_email_rounded,
            color: AppColors.secondaryColor[90],
          ),
        ),

        // change password
        _Button(
          label: LocaleKeys.accountSettingView_changePassword.tr(),
          onPressed: () => CustomAlertDialog.showAlertDialog(
            barrierDismissible: true,
            context: context,
            content: const ChangePasswordDialog(),
          ),
          icon: Icon(
            Icons.edit,
            color: AppColors.secondaryColor[90],
          ),
        ),

        // log out
        _Button(
          label: LocaleKeys.accountSettingView_logOut.tr(),
          onPressed: () => CustomAlertDialog.showAlertDialog(
            context: context,
            barrierDismissible: true,
            content: const LogOutConfirmationDialog(),
          ),
          icon: SvgPicture.asset(
            Assets.icons.logoutIcon,
            width: 16,
          ),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.label,
    required this.onPressed,
    required this.icon,
  });
  final String label;
  final VoidCallback onPressed;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        label,
      ),
      iconAlignment: IconAlignment.end,
      onPressed: onPressed,
      icon: icon,
    );
  }
}
