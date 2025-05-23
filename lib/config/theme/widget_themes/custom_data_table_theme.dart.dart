part of '../app_theme.dart';

final class _CustomDataTableTheme {
  _CustomDataTableTheme._();

  static CustomDataTableThemeExtension theme(BuildContext context) =>
      CustomDataTableThemeExtension(
        tableTheme: SfDataGridThemeData(
          headerHoverColor: Colors.transparent,
          selectionColor: AppColors.backgroundColor[40],
          filterIcon: const Icon(Icons.filter_alt_outlined),
          sortIcon: const Icon(Icons.sort),
        ),

        headerTextStyle: AppTextTheme(context).textTheme.titleSmall?.copyWith(
              color: AppColors.darkTextColors[30],
              fontWeight: FontWeight.w600,
            ),

        rowItemTextStyle: AppTextTheme(context).textTheme.labelLarge?.copyWith(
              color: AppColors.darkTextColors[30],
            ),
        nameTextStyle: AppTextTheme(context).textTheme.titleMedium?.copyWith(
              color: AppColors.secondaryColor[30],
            ),
        border: Border(
          top: BorderSide(
            color: AppColors.backgroundColor[40] ?? Colors.transparent,
            width: 2,
          ),
        ),
        rowHeight: 96,
        avatarRadius: 16,

        /// I found this value by trial and error.
        /// 700 is the minimum width that the table can be displayed properly.
        minTableWidth: 700,
        checkboxShape: const ContinuousRectangleBorder(
          borderRadius: AppBorderRadius.small(),
        ),
      );
}
