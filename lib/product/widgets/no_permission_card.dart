import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

/// A card widget that displays a message indicating that the user has no permission.
///
class NoPermissionCard extends StatelessWidget {
  /// Creates a [NoPermissionCard].
  const NoPermissionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: ListTile(
          title: Text(
            LocaleKeys.permissions_noPermission.tr(),
            style: TextStyles().textTheme.labelLarge?.copyWith(
                  color: AppColors.accentError[90],
                ),
          ),
          iconColor: AppColors.accentError[90],
          leading: const Icon(Icons.warning),
        ),
      ),
    );
  }
}
