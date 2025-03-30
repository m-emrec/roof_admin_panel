import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/avatar%20role%20name%20section/avatar_name_role_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/section_card.dart';
import 'package:roof_admin_panel/product/widgets/responsive_builder.dart';
part '_desktop_view.dart';
part '_mobile_view.dart';

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
    return ResponsiveBuilder(
      mobile: _MobileView(member),
      desktop: _DesktopView(member),
    );
  }
}
