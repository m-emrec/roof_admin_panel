part of '../app_theme.dart';

final class _SliderTheme {
  _SliderTheme._();

  static SliderThemeData theme(BuildContext context) => SliderThemeData(
        // rangeThumbShape:RangeSliderThumbShape
        // rangeTickMarkShape:
        activeTrackColor: AppColors.secondaryColor[50],
        inactiveTrackColor: AppColors.backgroundColor[60],
        thumbColor: AppColors.secondaryColor[40],
        // overlayColor: AppColors.secondaryColor[50],
        valueIndicatorColor: AppColors.backgroundColor[40],
        valueIndicatorTextStyle: context.textTheme.labelLarge,
        rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
      );
}
