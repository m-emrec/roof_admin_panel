import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/pages/add_member_table.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/table_column_names.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

mixin AddMemberColumnBuilderMixin on ConsumerState<AddMemberTable> {
  /// This method is used to build the columns of the table
  /// It uses the AddMemberTableColumnNames enum to get the column names
  /// and creates a GridColumn for each column name
  List<GridColumn> buildColumns() {
    return AddMemberTableColumnNames.values.map(
      (e) {
        if (e == AddMemberTableColumnNames.phoneNumber ||
            e == AddMemberTableColumnNames.mentor) {
          return GridColumn(
            columnWidthMode: ColumnWidthMode.auto,
            columnName: e.name,
            width: 300,
            label: Center(
              child: Text(e.name),
            ),
          );
        }

        return GridColumn(
          columnWidthMode: ColumnWidthMode.auto,
          columnName: e.name,
          label: Center(
            child: Text(e.name),
          ),
        );
      },
    ).toList();
  }
}
