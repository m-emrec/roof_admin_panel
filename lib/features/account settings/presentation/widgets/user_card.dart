import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/user_card_theme_extension.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/buttons_row.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/info_column.dart';
import 'package:roof_admin_panel/product/utility/current_manager.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';
import "dart:html" as html;

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // html.
    /// TODO: Try GestureDetector type of thing to recognize Enter key press
    return Card(
      elevation: context.theme.extension<UserCardThemeExtension>()?.elevation,
      // shape: context.theme.extension<UserCardThemeExtension>()?.shape,
      color: context.theme.extension<UserCardThemeExtension>()?.backgroundColor,
      child: Padding(
        padding: context.theme.extension<UserCardThemeExtension>()?.padding ??
            (const AppPadding.horizontalxsSymmetric() +
                const AppPadding.verticalxsSymmetric()),
        child: Wrap(
          runSpacing: SpacingSizes.medium,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          spacing: SpacingSizes.medium,
          children: [
            Avatar(
              imageUrl: CurrentManager.instance.managerModel.imageUrl,
              radius: context.theme
                  .extension<UserCardThemeExtension>()
                  ?.avatarRadius,
            ),
            GestureDetector(
                // on
                ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        ),
      ),
    );
  }
}
