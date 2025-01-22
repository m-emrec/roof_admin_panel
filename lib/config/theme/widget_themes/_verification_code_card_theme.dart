part of "../app_theme.dart";

final class _VerificationCodeCardTheme {
  _VerificationCodeCardTheme._();
  static final VerificationCodeCardTheme verificationCodeCardTheme =
      VerificationCodeCardTheme(
    textStyle: TextStyles().textTheme.titleLarge?.copyWith(
          foreground: Paint()
            ..color = AppColors.primaryColor[10] ?? Colors.black, //
        ),
    labelStyle: TextStyles().textTheme.labelLarge?.copyWith(
          color: AppColors.neutralGray500[50], //
        ),
    backgroundColor: AppColors.backgroundColor[40], //
    elevation: 2,
    aspectRatio: 1,
    cursorColor: AppColors.primaryColor,
  );
}
