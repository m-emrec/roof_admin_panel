part of '../app_theme.dart';

final class _UserCardTheme {
  _UserCardTheme._();
  static UserCardThemeExtension theme(BuildContext ctx) =>
      UserCardThemeExtension(
        backgroundColor: Colors.transparent,
        dividerColor: AppColors.secondaryColor[70],
        dividerThickness: 3,
        avatarRadius: 64,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.large(),
        ),
        elevation: 0,
        padding: const AppPadding.horizontalxsSymmetric() +
            const AppPadding.verticalxsSymmetric(),
        nameTextStyle: ctx.textTheme.titleLarge ?? const TextStyle(),
        emailTextStyle: ctx.textTheme.titleMedium ?? const TextStyle(),
        roleTextStyle: ctx.textTheme.titleSmall?.copyWith(
              color: AppColors.secondaryColor[40],
              fontWeight: FontWeight.w600,
            ) ??
            const TextStyle(),
      );
}
