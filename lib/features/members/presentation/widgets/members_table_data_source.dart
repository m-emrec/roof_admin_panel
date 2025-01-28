import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/core/constants/enums/roles.dart';
import 'package:roof_admin_panel/features/members/domain/entities/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';
import 'package:roof_admin_panel/product/utility/constants/constant_values.dart';
import 'package:roof_admin_panel/product/utility/logger/logger.dart';
import 'package:roof_admin_panel/product/widgets/table/table_date_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_null_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_row_item.dart';
import 'package:roof_admin_panel/product/widgets/table/user_avatar_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MembersTableDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRows = [];
  final Ref ref;
  MembersTableDataSource({
    required List<UserModel> users,
    required this.ref,
  }) {
    buildDataGridRows(users);
  }

  void buildDataGridRows(List<UserModel> users) {
    _dataGridRows = users
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(
                columnName: TableNamesEnum.memberNumber.name,
                value: e.memberNumber,
              ),
              DataGridCell<List<String?>>(
                columnName: TableNamesEnum.memberName.name,
                value: [e.name, e.phoneNumber],
              ),
              DataGridCell<DateTime>(
                columnName: TableNamesEnum.membershipEndDate.name,
                value: e.membershipEndDate,
              ),
              DataGridCell<List<String?>>(
                columnName: TableNamesEnum.role.name,
                value: e.role?.map((e) => e?.text()).toList(),
              ),
              DataGridCell<DateTime>(
                columnName: TableNamesEnum.age.name,
                value: e.birthDate,
              ),
              DataGridCell<String>(
                columnName: TableNamesEnum.membershipDuration.name,
                value: DateTime.now()
                    .difference(e.membershipStartDate ?? DateTime.now())
                    .inDays
                    .toString(),
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;
  @override
  bool onCellBeginEdit(
    DataGridRow dataGridRow,
    RowColumnIndex rowColumnIndex,
    GridColumn column,
  ) {
    Log.debug(dataGridRow.getCells()[rowColumnIndex.columnIndex].value);
    return super.onCellBeginEdit(dataGridRow, rowColumnIndex, column);
  }

  @override
  Future<void> handleLoadMoreRows() async {
    final _users = ref.read(membersViewModelProvider);

    await ref.read(membersViewModelProvider.notifier).fetchNext20Users(
          _users.value?.last.uid ?? '',
        );

    buildDataGridRows(
      ref.read(membersViewModelProvider).value ?? [],
    );
    notifyListeners();
  }

  @override
  Future<void> onCellSubmit(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column) {
    return super.onCellSubmit(dataGridRow, rowColumnIndex, column);
  }

  /// Builds the cell widget
  Container buildCell(Widget child) {
    return Container(
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.value == null) {
          return buildCell(
            const TableNullItem(),
          );
        }
        switch (dataGridCell.columnName.toTableNamesEnum()) {
          case TableNamesEnum.membershipEndDate:
            if (dataGridCell.value is DateTime) {
              return buildCell(
                TableDateItem(date: dataGridCell.value as DateTime),
              );
            }
          case TableNamesEnum.age:
            return buildCell(
              TableRowItem(
                label: ConstantValues.getAge(dataGridCell.value as DateTime)
                    .toString(),
              ),
            );

          case TableNamesEnum.role:
            dataGridCell.value as List<String?>;
            return buildCell(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final role in dataGridCell.value as List<String?>)
                    TableRowItem(label: role.toString()),
                ],
              ),
            );

          case TableNamesEnum.memberName:
            return buildCell(
              TableUserAvatar(
                userName: dataGridCell.value[0].toString(),
                phoneNumber: dataGridCell.value[1].toString(),
              ),
            );
          // ignore: no_default_cases
          default:
            return buildCell(
              TableRowItem(label: dataGridCell.value.toString()),
            );
        }

        return Container(
          alignment: Alignment.center,
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }
}
