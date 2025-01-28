import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_data_table_extension.dart';
import 'package:roof_admin_panel/core/extensions/context_extension.dart';
import 'package:roof_admin_panel/core/utils/widgets/user_avatar.dart';
import 'package:roof_admin_panel/product/utility/constants/spacing_sizes.dart';

class TableUserAvatar extends StatelessWidget {
  final String userName;
  final String phoneNumber;
  final String? imageUrl;
  const TableUserAvatar({
    super.key,
    required this.userName,
    required this.phoneNumber,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: SpacingSizes.extraSmall,
      children: [
        const UserAvatar(imageUrl: ""),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userName,
              textAlign: TextAlign.left,
              style: context.theme
                  .extension<CustomDataTableThemeExtension>()
                  ?.nameTextStyle,
            ),
            Text(
              phoneNumber,
              textAlign: TextAlign.left,
              style: context.theme
                  .extension<CustomDataTableThemeExtension>()
                  ?.rowItemTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
