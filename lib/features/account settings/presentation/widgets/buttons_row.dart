import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/auth/data/services/auth_service.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextButton.icon(
          onPressed: () {},
          iconAlignment: IconAlignment.end,
          icon: Icon(
            Icons.alternate_email_rounded,
            color: AppColors.secondaryColor[90],
          ),
          label: Text(
            LocaleKeys.accountSettingView_changeEmail.tr(),
            style: TextStyle(color: AppColors.secondaryColor[90]),
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          iconAlignment: IconAlignment.end,
          icon: Icon(
            Icons.edit,
            color: AppColors.secondaryColor[90],
          ),
          label: Text(
            LocaleKeys.accountSettingView_changePassword.tr(),
            style: TextStyle(color: AppColors.secondaryColor[90]),
          ),
        ),
        TextButton.icon(
          label: Text(
            LocaleKeys.accountSettingView_logOut.tr(),
            style: context.textTheme.labelMedium?.copyWith(
              color: AppColors.secondaryColor[90],
            ),
          ),
          iconAlignment: IconAlignment.end,
          onPressed: () => AuthService().signOut(),
          icon: SvgPicture.asset(
            Assets.icons.logoutIcon,
            width: 16,
          ),
        ),
      ],
    );
  }
}
