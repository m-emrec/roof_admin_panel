part of "../app_theme.dart";

final class _FeedbackTileTheme {
  _FeedbackTileTheme._();

  static final FeedbackTileThemeExtension feedbackTileTheme =
      FeedbackTileThemeExtension(
    selectedTextColor: AppColors.backgroundColor[50],
    selectedTileColor: AppColors.primaryColor,
    subTitleTextStyle: TextStyles().textTheme.bodySmall,
    titleTextStyle: TextStyles().textTheme.titleMedium,
    tileTextStyle: TextStyles().textTheme.bodyMedium,
    expandedBackgroundColor: AppColors.backgroundColor[60],
    selectedSubTitleStyle: TextStyles().textTheme.labelLarge?.copyWith(
          color: AppColors.primaryColor,
        ),
  );
}
