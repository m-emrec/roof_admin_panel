import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/avatar%20role%20name%20section/avatar_name_role_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/section_card.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/responsive_builder.dart';
part 'desktop_view.dart';
part 'membership_info_section.dart';
part 'member_ship_info_card_item.dart';

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
      mobile: const Text("Mobile"),
      tablet: const Text("Tablet"),
      desktop: _DesktopView(member),
    );
  }
}
