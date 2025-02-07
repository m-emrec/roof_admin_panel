part of '../app_theme.dart';

final class _CustomDataTableTheme {
  _CustomDataTableTheme._();

  static final CustomDataTableThemeExtension theme =
      CustomDataTableThemeExtension(
    tableTheme: SfDataGridThemeData(
      selectionColor: AppColors.backgroundColor[40],
      filterIcon: const Icon(Icons.filter_alt_outlined),
      sortIcon: const Icon(Icons.sort),
    ),
    headerTextStyle: TextStyles().textTheme.titleSmall?.copyWith(
          color: AppColors.darkTextColors[30],
          fontWeight: FontWeight.w600,
        ),
    rowItemTextStyle: TextStyles().textTheme.labelLarge?.copyWith(
          color: AppColors.darkTextColors[30],
        ),
    nameTextStyle: TextStyles().textTheme.titleMedium?.copyWith(
          color: AppColors.secondaryColor[30],
        ),
  );
}
