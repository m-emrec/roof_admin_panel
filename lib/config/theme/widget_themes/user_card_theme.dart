part of '../app_theme.dart';

final class _UserCardTheme {
  _UserCardTheme._();
  static UserCardThemeExtension get theme => UserCardThemeExtension(
        backgroundColor: Colors.transparent,
        dividerColor: AppColors.secondaryColor[70],
        dividerThickness: 1,
        avatarRadius: 64,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.large(),
        ),
        elevation: 0,
        padding: const AppPadding.horizontalxsSymmetric() +
            const AppPadding.verticalxsSymmetric(),
        nameTextStyle: TextStyles().textTheme.titleMedium ?? const TextStyle(),
        emailTextStyle: TextStyles().textTheme.labelMedium ?? const TextStyle(),
        roleTextStyle: TextStyles().textTheme.labelMedium?.copyWith(
                  color: AppColors.secondaryColor[40],
                ) ??
            const TextStyle(),
      );
}
