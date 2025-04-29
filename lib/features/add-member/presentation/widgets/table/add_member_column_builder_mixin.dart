import 'package:core/utils/constants/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/add_member_table.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/table_column_names.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
mixin AddMemberColumnBuilderMixin on ConsumerState<AddMemberTable> {
  /// This method is used to build the columns of the table
  /// It uses the AddMemberTableColumnNames enum to get the column names
  /// and creates a GridColumn for each column name
  List<GridColumn> get buildColumns {
    return AddMemberTableColumnNames.values.map(
      (e) {
        late double width;
        switch (e) {
          case AddMemberTableColumnNames.phoneNumber:
            width = 300;
          case AddMemberTableColumnNames.name:
          case AddMemberTableColumnNames.membershipStartDate:
          case AddMemberTableColumnNames.mentor:
            width = 200;
          case AddMemberTableColumnNames.memberNumber:
          case AddMemberTableColumnNames.role:
          case AddMemberTableColumnNames.gender:
          case AddMemberTableColumnNames.membershipDuration:
            width = 100;
        }
        return GridColumn(
          autoFitPadding: EdgeInsets.zero,
          columnWidthMode: ColumnWidthMode.fill,
          columnName: e.name,
          minimumWidth: width,
          label: Padding(
            padding: const AppPadding.horizontalxsSymmetric(),
            child: Text(
              e.name,
            ),
          ),
        );
      },
    ).toList();
  }
}
