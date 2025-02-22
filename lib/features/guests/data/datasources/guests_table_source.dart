import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_table_names.dart';
import 'package:roof_admin_panel/product/utility/extensions/make_selectable_extension.dart';
import 'package:roof_admin_panel/product/widgets/table/table_cell_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_date_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_null_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// DataGridSource for GuestsTable
class GuestsTableSource extends DataGridSource {
  /// DataGridSource for GuestsTable
  GuestsTableSource(this._guests) {
    _generateDataGridRows(_guests);
  }

  /// List of guests
  final List<Guest> _guests;
  List<DataGridRow> _dataGridRows = [];

  void _generateDataGridRows(List<Guest> guests) {
    _dataGridRows = guests.map<DataGridRow>((e) {
      return DataGridRow(
        cells: [
          DataGridCell<String>(
            columnName: GuestTableNames.name.name,
            value: e.name,
          ),
          DataGridCell<String>(
            columnName: GuestTableNames.phoneNumber.name,
            value: e.phoneNumber,
          ),
          DataGridCell<String>(
            columnName: GuestTableNames.gender.name,
            value: e.gender?.localizedText,
          ),
          DataGridCell<DateTime>(
            columnName: GuestTableNames.guestStartDate.name,
            value: e.guestStartDate,
          ),
          DataGridCell<int>(
            columnName: GuestTableNames.joinedEventCount.name,
            value: e.joinedEventCount ?? 0,
          ),
          DataGridCell<String>(
            columnName: GuestTableNames.role.name,
            value: e.role?.first.localizedText(),
          ),
        ],
      );
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  Widget _cell(Widget child) {
    return Container(
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          return _cell(
            _GuestsTableCellBuilder.build(
              dataGridCell.columnName,
              dataGridCell.value,
            ),
          );
        },
      ).toList(),
      color: row
                  .getCells()
                  .where(
                    (element) {
                      return element.columnName == GuestTableNames.role.name;
                    },
                  )
                  .first
                  .value ==
              Role.approvedGuest.localizedText()
          ? AppColors.backgroundColor[60]
          : Colors.transparent,
    );
  }
}

class _GuestsTableCellBuilder {
  static GuestTableNames _getColumnName(String columnName) {
    switch (columnName) {
      case "name":
        return GuestTableNames.name;
      case 'phoneNumber':
        return GuestTableNames.phoneNumber;
      case "gender":
        return GuestTableNames.gender;
      case "guestStartDate":
        return GuestTableNames.guestStartDate;
      case "joinedEventCount":
        return GuestTableNames.joinedEventCount;
      case "role":
        return GuestTableNames.role;
      default:
        return GuestTableNames.name;
    }
  }

  static Widget build(String columnName, dynamic value) {
    final column = _getColumnName(columnName);
    if (value == null) {
      return const TableNullItem();
    }
    switch (column) {
      case GuestTableNames.name:
        return TableCellItem(label: value.toString());
      case GuestTableNames.phoneNumber:
        return TableCellItem(label: value.toString());
      case GuestTableNames.gender:
        return TableCellItem(label: value.toString());
      case GuestTableNames.guestStartDate:
        return TableDateItem(
          date: value as DateTime,
          showIsMembershipExpiringSoon: false,
        );
      case GuestTableNames.joinedEventCount:
        return TableCellItem(label: value.toString());
      case GuestTableNames.role:
        return TableCellItem(
          label: value.toString(),
        );
    }
  }
}
