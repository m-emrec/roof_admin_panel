import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_data_table_extension.dart';
import 'package:roof_admin_panel/core/extensions/context_extension.dart';

class TableRowItem extends StatelessWidget {
  final String label;
  const TableRowItem({super.key, required this.label});

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
