import 'package:flutter/material.dart';

class SideBarThemeExtension extends ThemeExtension<SideBarThemeExtension> {
  final double expandedWidth;
  final double collapsedWidth;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final Color? selectedItemColor;
  final Color? unSelectedItemColor;
  final TextStyle? textStyle;
  final Size? iconSize;
  SideBarThemeExtension({
    required this.expandedWidth,
    required this.collapsedWidth,
    this.backgroundColor,
    this.boxShadow,
    this.selectedItemColor,
    this.unSelectedItemColor,
    this.textStyle,
    this.iconSize,
  });

  @override
  ThemeExtension<SideBarThemeExtension> copyWith({
    double? expandedWidth,
    double? collapsedWidth,
    Color? backgroundColor,
    List<BoxShadow>? boxShadow,
  }) {
    return SideBarThemeExtension(
      expandedWidth: expandedWidth ?? this.expandedWidth,
      collapsedWidth: collapsedWidth ?? this.collapsedWidth,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      boxShadow: boxShadow ?? this.boxShadow,
    );
  }

  @override
  ThemeExtension<SideBarThemeExtension> lerp(
      covariant ThemeExtension<SideBarThemeExtension>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
