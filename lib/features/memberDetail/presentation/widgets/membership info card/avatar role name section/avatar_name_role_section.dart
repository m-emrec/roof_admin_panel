import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/avatar%20role%20name%20section/name_role_section.dart';
import 'package:roof_admin_panel/product/utility/extensions/animation_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

///
class AvatarNameRoleSection extends ConsumerWidget {
  ///
  const AvatarNameRoleSection({
    super.key,
  });

  ///

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl =
        ref.watch(membershipDetailNotifierProvider.select((m) => m?.imageUrl));
    return Flex(
      direction: context.responsiveSelector(
        mobile: Axis.vertical,
        desktop: Axis.horizontal,
      ),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: context.responsiveSelector(
        mobile: CrossAxisAlignment.center,
        desktop: CrossAxisAlignment.start,
      ),
      spacing: context.responsiveSelector(
        mobile: SpacingSizes.extraSmall,
        desktop: SpacingSizes.small,
      ),
      children: [
        Avatar(
          imageUrl: imageUrl,
          radius: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.avatarRadius,
        ),
        NameAndRoleSection(
          crossAxisAlignment: context.responsiveSelector(
            mobile: CrossAxisAlignment.center,
            desktop: CrossAxisAlignment.start,
          ),
        ),
      ],
    ).fadeAnimation();
  }
}
