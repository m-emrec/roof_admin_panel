import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/avatar%20role%20name%20section/avatar_name_role_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/section_card.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/permissions_handler.dart';
import 'package:roof_admin_panel/product/widgets/responsive_builder.dart';

///
class MembershipInfoCard extends StatelessWidget {
  /// Creates a card that displays the membership related information.
  const MembershipInfoCard({
    required this.member,
    super.key,
  });

  ///
  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      offset: const Offset(-SpacingSizes.large, SpacingSizes.medium),
      label: PermissionBasedVisibility(
        necessaryPermissions: [
          Permissions.canEdit,
          Permissions.canEditMembers,
        ],
        child: PopupMenuButton(
          itemBuilder: _popMenuItemBuilder,
        ),
      ).visibleIfAllowed,
      child: SizedBox(
        width: context.dynamicWidth(0.9),
        child: ResponsiveBuilder(
          mobile: _MobileView(member),
          desktop: _DesktopView(member),
        ),
      ),
    );
  }

  List<PopupMenuEntry<int>> _popMenuItemBuilder(BuildContext context) => [
        const PopupMenuItem(
          value: 1,
          child: Text(
            'Edit',
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            'Delete',
          ),
        ),
      ];
}

class _DesktopView extends StatelessWidget {
  const _DesktopView(this.member);
  final UserModel? member;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.extension<MembershipInfoCardThemeExtension>();
    return MembersDetailSectionCard(
      child: Padding(
        padding: theme?.padding ?? EdgeInsets.zero,
        child: Row(
          spacing: SpacingSizes.medium,
          children: [
            AvatarNameRoleSection(member: member),
            SizedBox(
              height: context.dynamicHeight(0.1),
              child: VerticalDivider(
                thickness: theme?.dividerTheme.thickness,
                color: theme?.dividerTheme.color,
              ),
            ),
            MembershipInfoSection(member: member),
          ],
        ),
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView(this.member);
  final UserModel? member;
  @override
  Widget build(BuildContext context) {
    return MembersDetailSectionCard(
      child: Column(
        spacing: SpacingSizes.medium,
        children: [
          AvatarNameRoleSection(member: member),
          MembershipInfoSection(member: member),
        ],
      ),
    );
  }
}
