import 'package:core/core.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_data_table_extension.dart';

/// This widget displays the user avatar,name and phone number in a cell.
///
/// Use it when you want to display the user avatar, name and phone number in a cell.
class TableUserAvatar extends StatelessWidget {
  /// This widget displays the user avatar,name and phone number in a cell.
  ///
  /// Use it when you want to display the user avatar, name and phone number in a cell.
  const TableUserAvatar({
    required this.phoneNumber,
    required this.userName,
    super.key,
    this.imageUrl,
  });

  /// The name of the user.
  final String userName;

  /// The phone number of the user.
  final String phoneNumber;

  /// The image url of the user.
  final String? imageUrl;

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
