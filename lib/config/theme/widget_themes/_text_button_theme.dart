part of "../app_theme.dart";

final class _TextButtonTheme {
  _TextButtonTheme._();
  static TextButtonThemeData textButtonTheme(BuildContext context) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: AppTextTheme(context).textTheme.labelMedium,
          foregroundColor: AppColors.secondaryTextColor,
        ),
      );
}
