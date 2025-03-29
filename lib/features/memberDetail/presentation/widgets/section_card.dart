import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';

class MembersDetailSectionCard extends StatelessWidget {
  const MembersDetailSectionCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.extension<MembershipInfoCardThemeExtension>();

    return Card(
      elevation: theme?.elevation,
      color: theme?.backgroundColor,
      child: Padding(
        padding: theme?.padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
