part of '../app_theme.dart';

final class _TooltipTheme {
  _TooltipTheme._();
  static TooltipThemeData tooltipTheme(BuildContext context) =>
      TooltipThemeData(
        textStyle: AppTextTheme(context).textTheme.labelLarge,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor[50],
          borderRadius: const AppBorderRadius.small(),
          boxShadow: [
            BoxShadow(
              color: AppColors.backgroundColor[20] ?? Colors.black,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
      );
}
