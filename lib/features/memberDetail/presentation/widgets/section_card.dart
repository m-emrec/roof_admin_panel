import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';

///
class MembersDetailSectionCard extends StatelessWidget {
  /// A card widget used in the members detail section.
  /// It provides a consistent design for displaying member information.
  /// The card has a background color, padding, and elevation defined in the theme extension.
  const MembersDetailSectionCard({required this.child, super.key});

  ///
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
