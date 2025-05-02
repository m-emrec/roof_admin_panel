part of '../app_theme.dart';

final class _FeedbackTileTheme {
  _FeedbackTileTheme._();
  static FeedbackTileThemeExtension feedbackTileTheme(BuildContext context) {
    return FeedbackTileThemeExtension(
      gapBetweenContentAndFooter: SpacingSizes.small,
      gapBetweenHeaderAndContent: SpacingSizes.small,
      titleTextStyle: AppTextTheme(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ) ??
          const TextStyle(),
      subTitleTextStyle:
          AppTextTheme(context).textTheme.labelLarge ?? const TextStyle(),
      createdAtTextStyle:
          AppTextTheme(context).textTheme.labelMedium ?? const TextStyle(),
      userNameLabelTextStyle: AppTextTheme(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: FontWeight.w600) ??
          const TextStyle(),
      userImageRadius: 16,
      contentTextStyle:
          AppTextTheme(context).textTheme.bodyMedium ?? const TextStyle(),
      imageSize: const Size(64, 64),
      imageShape: const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.small(),
      ),
    );
  }
}
