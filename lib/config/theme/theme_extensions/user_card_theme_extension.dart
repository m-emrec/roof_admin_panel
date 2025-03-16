// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class UserCardThemeExtension extends ThemeExtension<UserCardThemeExtension> {
  UserCardThemeExtension({
    this.backgroundColor,
    this.dividerColor,
    this.dividerThickness,
    required this.avatarRadius,
    required this.shape,
    required this.elevation,
    required this.padding,
    required this.nameTextStyle,
    required this.emailTextStyle,
    required this.roleTextStyle,
  });
  final Color? backgroundColor;
  final Color? dividerColor;
  final double? dividerThickness;

  final double avatarRadius;
  final ShapeBorder shape;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final TextStyle nameTextStyle;
  final TextStyle emailTextStyle;
  final TextStyle roleTextStyle;
  @override
  ThemeExtension<UserCardThemeExtension> copyWith(
      {Color? backgroundColor,
      Color? dividerColor,
      double? dividerThickness,
      double? avatarRadius,
      ShapeBorder? shape,
      double? elevation,
      EdgeInsetsGeometry? padding,
      TextStyle? nameTextStyle,
      TextStyle? emailTextStyle,
      TextStyle? roleTextStyle}) {
    return UserCardThemeExtension(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerThickness: dividerThickness ?? this.dividerThickness,
      avatarRadius: avatarRadius ?? this.avatarRadius,
      shape: shape ?? this.shape,
      elevation: elevation ?? this.elevation,
      padding: padding ?? this.padding,
      nameTextStyle: nameTextStyle ?? this.nameTextStyle,
      emailTextStyle: emailTextStyle ?? this.emailTextStyle,
      roleTextStyle: roleTextStyle ?? this.roleTextStyle,
    );
  }

  @override
  ThemeExtension<UserCardThemeExtension> lerp(
      covariant ThemeExtension<UserCardThemeExtension>? other, double t) {
    if (other == null) {
      return this;
    }
    if (other is UserCardThemeExtension) {
      return UserCardThemeExtension(
        backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
        dividerColor: Color.lerp(dividerColor, other.dividerColor, t),
        shape: ShapeBorder.lerp(shape, other.shape, t) ?? shape,
        padding: EdgeInsetsGeometry.lerp(padding, other.padding, t) ?? padding,
        nameTextStyle: TextStyle.lerp(nameTextStyle, other.nameTextStyle, t) ??
            nameTextStyle,
        emailTextStyle:
            TextStyle.lerp(emailTextStyle, other.emailTextStyle, t) ??
                emailTextStyle,
        roleTextStyle: TextStyle.lerp(roleTextStyle, other.roleTextStyle, t) ??
            roleTextStyle,
        dividerThickness: dividerThickness,
        avatarRadius: avatarRadius,
        elevation: elevation,
      );
    }
    return this;
  }
}
