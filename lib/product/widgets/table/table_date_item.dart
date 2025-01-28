import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_data_table_extension.dart';
import 'package:roof_admin_panel/core/extensions/context_extension.dart';
import 'package:roof_admin_panel/product/utility/constants/app_colors.dart';
import 'package:roof_admin_panel/product/utility/constants/constant_values.dart';

/// TableDateItem is a widget that shows the date in a table cell.
/// It is used in the [CustomDataTable] widget.
/// It takes a [DateTime] as a parameter.
/// It returns a [Text] widget with the formatted date.
///
/// Example:
/// ```dart
///
/// TableDateItem(date: DateTime.now())
///
///  ```
///
class TableDateItem extends StatelessWidget {
  /// TableDateItem is a widget that shows the date in a table cell.
  /// It is used in the [CustomDataTable] widget.
  /// It takes a [DateTime] as a parameter.
  /// It returns a [Text] widget with the formatted date.
  ///
  /// Example:
  /// ```dart
  ///
  /// TableDateItem(date: DateTime.now())
  ///
  ///  ```
  ///
  const TableDateItem({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Text(
      ConstantValues.formattedDate(context, date),
      style: context.theme
          .extension<CustomDataTableThemeExtension>()
          ?.rowItemTextStyle
          ?.copyWith(
            // If the membership is about to expire, the text color is set to red.
            color: ConstantValues.isMembershipExpiringSoon(date)
                ? AppColors.accentError[60]
                : null,
          ),
    );
  }
}
