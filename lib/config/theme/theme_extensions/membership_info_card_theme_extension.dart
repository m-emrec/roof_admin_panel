import 'package:flutter/material.dart';

class MembershipInfoCardThemeExtension
    extends ThemeExtension<MembershipInfoCardThemeExtension> {
  const MembershipInfoCardThemeExtension({
    required this.dividerTheme,
    required this.elevation,
    required this.backgroundColor,
    required this.padding,
    required this.avatarRadius,
    required this.roleTextStyle,
    this.membershipInfoLabelTextStyle,
    this.membershipInfoValueTextStyle,
  });

  final DividerThemeData dividerTheme;
  final double elevation;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final double avatarRadius;
  final TextStyle? roleTextStyle;
  final TextStyle? membershipInfoLabelTextStyle;
  final TextStyle? membershipInfoValueTextStyle;
  @override
  ThemeExtension<MembershipInfoCardThemeExtension> copyWith() {
    return MembershipInfoCardThemeExtension(
      dividerTheme: dividerTheme,
      elevation: elevation,
      backgroundColor: backgroundColor,
      padding: padding,
      avatarRadius: avatarRadius,
      roleTextStyle: roleTextStyle,
    );
  }

  @override
  ThemeExtension<MembershipInfoCardThemeExtension> lerp(
      covariant ThemeExtension<MembershipInfoCardThemeExtension>? other,
      double t) {
    throw UnimplementedError();
  }
}
