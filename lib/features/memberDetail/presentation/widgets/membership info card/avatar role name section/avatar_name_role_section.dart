import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/avatar%20role%20name%20section/name_role_section.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

///
class AvatarNameRoleSection extends StatelessWidget {
  ///
  const AvatarNameRoleSection({
    required this.member,
    super.key,
  });

  ///
  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return _buildAvatarNameRoleSection(
      context,
      [
        Avatar(
          imageUrl: member?.imageUrl,
          radius: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.avatarRadius,
        ),
        NameAndRoleSection(
          member: member,
          crossAxisAlignment: context.responsiveSelector(
            mobile: CrossAxisAlignment.center,
            desktop: CrossAxisAlignment.start,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarNameRoleSection(
    BuildContext context,
    List<Widget> children,
  ) {
    return context.responsiveSelector(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: SpacingSizes.extraSmall,
        children: children,
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: SpacingSizes.small,
        children: children,
      ),
    );
  }
}
