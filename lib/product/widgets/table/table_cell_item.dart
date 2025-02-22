import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_data_table_extension.dart';

/// [TableCellItem] is a widget that shows the text in a table cell.
///
/// It is the default widget that should be used in any table cell.
///
class TableCellItem extends StatelessWidget {
  /// TableCellItem is a widget that shows the text in a table cell.
  ///
  /// It is the default widget that should be used in any table cell.
  ///
  const TableCellItem({required this.label, super.key});

  /// Label to be displayed in the table cell.
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: context.theme
          .extension<CustomDataTableThemeExtension>()
          ?.rowItemTextStyle,
    );
  }
}
