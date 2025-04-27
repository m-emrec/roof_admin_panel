import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/user_card_theme_extension.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/user%20card/account_setting_avatar.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/user%20card/buttons_row.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/user%20card/info_column.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';
import 'package:roof_admin_panel/product/widgets/responsive_builder.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const AppPadding.horizontalMSymmetric(),
      child: Wrap(
        runSpacing: SpacingSizes.medium,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: SpacingSizes.medium,
        children: [
          const AccountSettingAvatar(),
          context.responsiveSelector(
            mobile: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SpacingSizes.medium,
              children: [
                const InfoColumn(),
                // divider
                SizedBox(
                  width: context.dynamicWidth(0.2),
                  child: Divider(
                    color: context.theme
                        .extension<UserCardThemeExtension>()
                        ?.dividerColor,
                    thickness: context.theme
                        .extension<UserCardThemeExtension>()
                        ?.dividerThickness,
                  ),
                ),
                const ButtonsRow(),
              ],
            ),
            desktop: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SpacingSizes.medium,
              children: [
                const InfoColumn(),
                // divider
                SizedBox(
                  height: context.dynamicHeight(0.2),
                  child: VerticalDivider(
                    color: context.theme
                        .extension<UserCardThemeExtension>()
                        ?.dividerColor,
                    thickness: context.theme
                        .extension<UserCardThemeExtension>()
                        ?.dividerThickness,
                  ),
                ),
                const ButtonsRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
