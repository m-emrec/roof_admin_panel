import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/avatar%20role%20name%20section/name_role_buttons_section.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

class AvatarNameRoleSection extends StatelessWidget {
  const AvatarNameRoleSection({
    super.key,
    required this.member,
  });

  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: SpacingSizes.small,
      children: [
        Avatar(
          imageUrl: member?.imageUrl,
          radius: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.avatarRadius,
        ),
        NameRoleButtonsSection(member: member),
      ],
    );
  }
}
