part of '../app_theme.dart';

final class _SideBarTheme {
  _SideBarTheme._();

  /// The default theme for the [SideBar] widget.
  ///
  /// This theme is used by [SideBar] widget by default.
  ///
  ///
  /// The default value is:
  /// ```dart
  ///
  /// SideBarThemeExtension(
  /// expandedWidth: 300,
  /// collapsedWidth: 64,
  /// backgroundColor: AppColors.backgroundColor[60],
  /// boxShadow: const [
  ///
  ///
  ///
  ///
  /// ```
  ///
  ///
  static SideBarThemeExtension sideBarTheme(BuildContext ctx) =>
      SideBarThemeExtension(
        expandedWidth: 200,
        collapsedWidth: 64,
        backgroundColor: AppColors.backgroundColor[60],
        iconSize: const Size(16, 16),
        selectedItemColor: AppColors.backgroundColor[40],
        unSelectedItemColor: Colors.transparent,
        textStyle: ctx.textTheme.labelMedium,
        boxShadow: const [
          BoxShadow(
            color: Color(0x1915382A),
            blurRadius: 13,
            offset: Offset(6, 0),
          ),
          BoxShadow(
            color: Color(0x1615382A),
            blurRadius: 23,
            offset: Offset(23, 0),
          ),
          BoxShadow(
            color: Color(0x0C15382A),
            blurRadius: 31,
            offset: Offset(51, 0),
          ),
          BoxShadow(
            color: Color(0x0215382A),
            blurRadius: 37,
            offset: Offset(91, 0),
          ),
          BoxShadow(
            color: Color(0x0015382A),
            blurRadius: 40,
            offset: Offset(143, 0),
          ),
        ],
      );
}
