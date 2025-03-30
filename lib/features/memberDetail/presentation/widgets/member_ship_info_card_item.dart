import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';

class MemberInfoCardItem extends StatelessWidget {
  const MemberInfoCardItem({
    required this.label,
    super.key,
    this.value,
  });

  final String label;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: SpacingSizes.extraSmall,
      children: [
        Text(
          "$label:",
          style: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.membershipInfoLabelTextStyle,
        ),
        Text(
          value ?? '',
          style: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.membershipInfoValueTextStyle,
        ),
      ],
    );
  }
}
