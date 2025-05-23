import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_data_table_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';

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
  const TableDateItem({
    required this.date,
    this.showIsMembershipExpiringSoon = true,
    super.key,
  });

  /// The date to be shown in the table cell.
  final DateTime date;

  /// If true, the text color is set to red if the membership is about to expire.
  /// If false, the text color is set to the default color.
  final bool showIsMembershipExpiringSoon;
  @override
  Widget build(BuildContext context) {
    return Text(
      date.formatDate(context),
      style: context.theme
          .extension<CustomDataTableThemeExtension>()
          ?.rowItemTextStyle
          ?.copyWith(
            // If the membership is about to expire, the text color is set to red.
            color: showIsMembershipExpiringSoon
                ? ConstantValues.isMembershipExpiringSoon(date)
                    ? AppColors.accentError[90]
                    : null
                : null,
          ),
    );
  }
}
