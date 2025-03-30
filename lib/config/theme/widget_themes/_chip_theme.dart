part of '../app_theme.dart';

final class _ChipTheme extends ChipThemeData {
  _ChipTheme()
      : super(
          backgroundColor: AppColors.backgroundColor[60],
          labelStyle: TextStyles().textTheme.labelLarge?.copyWith(
                color: AppColors.darkTextColors[50],
              ),
          color: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryColor[80] ?? Colors.transparent;
            }
            return AppColors.backgroundColor[60] ?? Colors.transparent;
          }),
          side: BorderSide.none,
          deleteIconColor: AppColors.accentError[40],
        );
}
