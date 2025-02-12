part of '../app_theme.dart';

final class _FeedbackTileTheme {
  _FeedbackTileTheme._();
  static FeedbackTileThemeExtension feedbackTileTheme(BuildContext context) =>
      FeedbackTileThemeExtension(
        gapBetweenContentAndFooter: SpacingSizes.small,
        gapBetweenHeaderAndContent: SpacingSizes.small,
        titleTextStyle: context.textTheme.titleLarge ?? const TextStyle(),
        subTitleTextStyle: context.textTheme.titleMedium ?? const TextStyle(),
        createdAtTextStyle: context.textTheme.bodySmall ?? const TextStyle(),
        userNameLabelTextStyle:
            context.textTheme.labelLarge ?? const TextStyle(),
        userImageRadius: 16,
        contentTextStyle: context.textTheme.bodyLarge ?? const TextStyle(),
        imageSize: const Size(64, 64),
        imageShape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.small(),
        ),
      );
}
