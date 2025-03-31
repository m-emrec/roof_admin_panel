import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

class NameAndRoleSection extends StatelessWidget {
  const NameAndRoleSection({
    super.key,
    required this.member,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final UserModel? member;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
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
      ],
    );
  }
}
