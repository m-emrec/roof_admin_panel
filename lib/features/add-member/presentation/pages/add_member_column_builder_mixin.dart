import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/pages/add_member_table.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/table_column_names.dart';
import 'package:roof_admin_panel/product/utility/extensions/animated_text_Extension.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

mixin AddMemberColumnBuilderMixin on ConsumerState<AddMemberTable> {
  /// This method is used to build the columns of the table
  /// It uses the AddMemberTableColumnNames enum to get the column names
  /// and creates a GridColumn for each column name
  List<GridColumn> buildColumns() {
    return AddMemberTableColumnNames.values.map(
      (e) {
        late ColumnWidthMode columnWidthMode;
        late double width;
        switch (e) {
          case AddMemberTableColumnNames.phoneNumber:
            columnWidthMode = ColumnWidthMode.auto;
            width = 300;
          case AddMemberTableColumnNames.memberNumber:
            columnWidthMode = ColumnWidthMode.fill;
            width = 100;
          case AddMemberTableColumnNames.name:
          case AddMemberTableColumnNames.mentor:
            width = 200;
            columnWidthMode = ColumnWidthMode.fill;
          case AddMemberTableColumnNames.role:
          case AddMemberTableColumnNames.gender:
          case AddMemberTableColumnNames.membershipStartDate:
          case AddMemberTableColumnNames.membershipDuration:
            columnWidthMode = ColumnWidthMode.fill;
            width = 100;
        }
        return GridColumn(
          autoFitPadding: EdgeInsets.zero,
          columnWidthMode: columnWidthMode,
          columnName: e.name,
          width: width,
          label: Padding(
            padding: const AppPadding.horizontalxsSymmetric(),
            child: Text(
              e.toLocale,
              style: context.textTheme.labelLarge?.copyWith(
                color: AppColors.neutralGray100[10],
              ),
              // maxLines: 1,
            ).animatedText,
          ),
        );
      },
    ).toList();
  }
}
