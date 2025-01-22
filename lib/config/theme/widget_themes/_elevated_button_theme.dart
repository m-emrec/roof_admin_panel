part of "../app_theme.dart";

final class _ElevatedButtonTheme {
  _ElevatedButtonTheme._();
  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.lightTextColors[90],
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingSizes.medium,
        vertical: SpacingSizes.small,
      ),
      maximumSize: const Size.fromHeight(52),
      shape: const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.small(),
      ),
    ),
  );
}
