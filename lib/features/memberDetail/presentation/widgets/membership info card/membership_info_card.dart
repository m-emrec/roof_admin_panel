import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/avatar%20role%20name%20section/avatar_name_role_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership_info_section.dart';
import 'package:roof_admin_panel/product/widgets/responsive_builder.dart';
part 'desktop_view.dart';

class MembershipInfoCard extends StatelessWidget {
  const MembershipInfoCard({
    super.key,
    required this.member,
  });

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
