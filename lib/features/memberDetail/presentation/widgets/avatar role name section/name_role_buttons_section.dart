import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:roof_admin_panel/product/widgets/empty_box.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

class NameRoleButtonsSection extends StatelessWidget {
  const NameRoleButtonsSection({
    super.key,
    required this.member,
  });

  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleWidget(
          title: member?.name ?? '',
        ),
        Text(
          member?.role?.map((e) => e?.localizedText("")).join(" | ") ?? '',
          style: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.roleTextStyle,
        ),
        const EmptyBox.mediumGap(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: SpacingSizes.small,
          children: [
            Icon(
              Icons.edit,
              size: IconSizes.medium.width,
            ),
            Icon(
              Icons.delete_forever,
              size: IconSizes.medium.width,
            ),
          ],
        ),
      ],
    );
  }
}
