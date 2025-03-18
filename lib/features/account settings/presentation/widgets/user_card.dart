import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/logger/logger.dart';
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
    return Padding(
      padding: const AppPadding.horizontalMSymmetric(),
      child: Wrap(
        runSpacing: SpacingSizes.medium,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: SpacingSizes.medium,
        children: [
          Avatar(
            imageUrl: CurrentManager.instance.managerModel.imageUrl,
            radius:
                context.theme.extension<UserCardThemeExtension>()?.avatarRadius,
          ),
          LayoutBuilder(
            builder: (context, c) {
              Log.info('maxWidth: ${c.maxHeight}');
              return Row(
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
              );
            },
          ),
        ],
      ),
    );
  }
}
