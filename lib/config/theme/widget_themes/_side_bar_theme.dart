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
        backgroundColor: AppColors.backgroundColor[80],
        iconSize: IconSizes.small,
        selectedItemColor: AppColors.backgroundColor[40],
        unSelectedItemColor: Colors.transparent,
        textStyle: TextStyles().textTheme.labelMedium,
        boxShadow: [
          BoxShadow(
            color: AppColors.backgroundColor[30] ?? Colors.transparent,
            blurRadius: 2,
            offset: const Offset(0.5, 0),
          ),
        ],
      );
}
