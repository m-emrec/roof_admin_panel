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
        backgroundColor: AppColors.primaryColor[80],
        iconSize: IconSizes.small,
        selectedItemColor: AppColors.backgroundColor[80],
        unSelectedItemColor: Colors.transparent,
        textStyle: TextStyles().textTheme.labelMedium?.copyWith(
              color: AppColors.neutralGray500[10],
            ),
        selectedTextStyle: TextStyles().textTheme.labelMedium,
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor[50] ?? Colors.transparent,
            blurRadius: 2,
            offset: const Offset(1, 0),
          ),
        ],
      );
}
