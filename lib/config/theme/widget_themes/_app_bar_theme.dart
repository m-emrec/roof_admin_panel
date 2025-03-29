part of "../app_theme.dart";

final class _AppBarTheme extends AppBarTheme {
  _AppBarTheme()
      : super(
          actionsIconTheme: IconThemeData(
            color: AppColors.secondaryColor[50],
          ),
          scrolledUnderElevation: 0,
          color: AppColors.backgroundColor[50],
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.backgroundColor.withValues(alpha: 0.1),
            systemNavigationBarColor: AppColors.backgroundColor,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
}
