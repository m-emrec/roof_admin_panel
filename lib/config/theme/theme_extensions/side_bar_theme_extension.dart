import 'package:flutter/material.dart';

class SideBarThemeExtension extends ThemeExtension<SideBarThemeExtension> {
  final double expandedWidth;
  final double collapsedWidth;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  SideBarThemeExtension({
    required this.expandedWidth,
    required this.collapsedWidth,
    this.backgroundColor,
    this.boxShadow,
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
