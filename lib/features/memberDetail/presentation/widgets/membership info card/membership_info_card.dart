import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/ban_member_dialog.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/avatar%20role%20name%20section/avatar_name_role_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_fields/base_member_ship_info_field.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/section_card.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/utility/handlers/permissions_handler.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
part './membership-card-options-badge/membership_card_options_badge.dart';
part './membership-card-options-badge/option_badge_field.dart';

/// A card that displays the membership related information.
///
/// This is the upper part of the card that contains the avatar, name, role, and
/// membership information sections. It is used in the [MemberDetailDialog].
///
/// The card is responsive and adapts to different screen sizes.
///
/// It uses the [MembershipInfoCardThemeExtension] for theming and styling.
class MembershipInfoCard extends StatelessWidget {
  /// Creates a card that displays the membership related information.
  const MembershipInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.extension<MembershipInfoCardThemeExtension>();

    return _MembershipCardOptionBadge(
      MembersDetailSectionCard(
        child: Padding(
          padding: context.responsiveSelector(
            mobile: EdgeInsets.zero,
            desktop: theme?.padding ?? EdgeInsets.zero,
          ),
          child: Flex(
            direction: context.responsiveSelector(
              mobile: Axis.vertical,
              desktop: Axis.horizontal,
            ),
            spacing: SpacingSizes.medium,
            children: [
              const AvatarNameRoleSection(),
              SizedBox(
                height: context.responsiveSelector(
                  mobile: 0,
                  desktop: context.dynamicHeight(0.1),
                ),
                child: VerticalDivider(
                  thickness: theme?.dividerTheme.thickness,
                  color: theme?.dividerTheme.color,
                ),
              ),
              const MembershipInfoSection(),
            ],
          ),
        ),
      ),
    );
  }
}
