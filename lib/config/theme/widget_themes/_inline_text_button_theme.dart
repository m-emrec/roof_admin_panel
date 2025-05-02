part of "../app_theme.dart";

final class _InlineTextButtonTheme {
  _InlineTextButtonTheme._();
  static InlineTextButtonTheme inlineTextButtonTheme(BuildContext ctx) =>
      InlineTextButtonTheme(
        style: AppTextTheme(ctx)
            .textTheme
            .labelLarge
            ?.copyWith(color: AppColors.secondaryColor[50]),
      );
}
