import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/user_card_theme_extension.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/buttons_row.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/info_column.dart';
import 'package:roof_admin_panel/product/utility/current_manager.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          spacing: SpacingSizes.medium,
          children: [
            FittedBox(
              child: Avatar(
                imageUrl: CurrentManager.instance.managerModel.imageUrl,
                radius: context.theme
                    .extension<UserCardThemeExtension>()
                    ?.avatarRadius,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoColumn(),
                ButtonsRow(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
