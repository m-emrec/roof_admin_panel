import 'package:core/utils/logger/logger.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/domain/entities/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/utility/extensions/make_selectable_extension.dart';
import 'package:roof_admin_panel/product/widgets/table/table_date_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_null_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_cell_item.dart';
import 'package:roof_admin_panel/product/widgets/table/user_avatar_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// This is the data source for the members table.
/// It provides the data to the table.
///
/// It also handles the data related operations like sorting, filtering, and loading more data.
class MembersTableDataSource extends DataGridSource {
  /// This is the data source for the members table.
  /// It provides the data to the table.
  ///
  /// It also handles the data related operations like sorting, filtering, and loading more data.
  MembersTableDataSource({
    required List<UserModel> users,
    required this.ref,
  }) {
    generateUserDataGridRows(users);
  }
  List<DataGridRow> _dataGridRows = [];

  /// The reference to the provider container.
  ///
  /// This is necessary because I need to call the [membersViewModelProvider]
  /// to fetch the next 20 users.
  final Ref ref;

  /// Builds the data grid rows from the [users].
  ///
  /// This method is called when the data source is initialized.
  void generateUserDataGridRows(List<UserModel> users) {
    _dataGridRows = users
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(
                columnName: MemberTableNames.memberNumber.name,
                value: e.memberNumber,
              ),
              DataGridCell<List<String?>>(
                columnName: MemberTableNames.memberName.name,
                value: [e.name, e.phoneNumber],
              ),
              DataGridCell<DateTime>(
                columnName: MemberTableNames.membershipEndDate.name,
                value: e.membershipEndDate,
              ),
              DataGridCell<List<String?>>(
                columnName: MemberTableNames.role.name,
                value: e.role?.map((e) => e?.localizedText()).toList(),
              ),
              DataGridCell<int>(
                columnName: MemberTableNames.age.name,
                value: e.birthDate?.getAge(),
              ),
              DataGridCell<String>(
                columnName: MemberTableNames.membershipDuration.name,
                value:
                    "${e.membershipStartDate?.getMembershipDuration().inDays} ${LocaleKeys.common_date_day.tr()}",
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  Future<void> handleLoadMoreRows() async {
    final users = ref.read(membersViewModelProvider);
    if ((users.value?.length ?? 0) <
        (ref.read(totalMembersCountProvider).value ?? 0)) {
      await ref.read(membersViewModelProvider.notifier).fetchNext20Users(
            users.value?.last.uid ?? '',
          );

      generateUserDataGridRows(
        ref.read(membersViewModelProvider).value ?? [],
      );
      notifyListeners();
    }
  }

  /// Builds the cell widget
  Container cell(Widget child) {
    return Container(
      alignment: Alignment.center,
      child: child,
    );
  }

  /// Builds the cell widget based on the [columnName] and given [value].
  Widget _cellBuilder(MemberTableNames columnName, dynamic value) {
    if (value == null) {
      return cell(
        const TableNullItem(),
      );
    }
    switch (columnName) {
      case MemberTableNames.membershipEndDate:
        if (value is DateTime) {
          return cell(
            TableDateItem(date: value),
          );
        }
      case MemberTableNames.age:
        return cell(
          TableCellItem(
            label: value.toString(),
          ),
        );

      case MemberTableNames.role:
        value as List<String?>;
        return cell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final role in value) TableCellItem(label: role.toString()),
            ],
          ),
        );

      case MemberTableNames.memberName:
        value as List<String?>;
        return cell(
          TableUserAvatar(
            userName: value[0].toString(),
            phoneNumber: value[1].toString(),
          ),
        );

      /// I use default case here because rest of the fields are
      /// [TableRowItem]
      // ignore: no_default_cases
      default:
        return cell(
          TableCellItem(label: value.toString()),
        );
    }
    return Container(
      alignment: Alignment.center,
      child: Text(value.toString()),
    );
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return _cellBuilder(
          dataGridCell.columnName.toTableNamesEnum(),
          dataGridCell.value,
        ).makeSelectable();
      }).toList(),
    );
  }
}
