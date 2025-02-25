import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_table_names.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/guests/presentation/widgets/joined_event_count_buttons.dart';
import 'package:roof_admin_panel/product/widgets/table/table_cell_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_date_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_null_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'guest_table_cell_builder.dart';
part 'guests_table_data_grid_row_generator.dart';
part 'guests_table_color_generator.dart';
part 'guest_table_name_converter.dart';
part 'guest_table_edit_widget_builder.dart';

/// DataGridSource for GuestsTable
///
/// Used in [GuestsTable] to provide data to the [SfDataGrid]
///
/// It takes a list of [Guest] and generates [DataGridRow] based on the [Guest]
///
/// It uses [_GuestsTableDataGridRowGenerator] to generate [DataGridRow]
///
///
class GuestsTableSource extends DataGridSource {
  /// DataGridSource for GuestsTable
  GuestsTableSource(this._guests) {
    _dataGridRows = _GuestsTableDataGridRowGenerator.generate(
      _guests,
    );
  }

  /// List of guests
  final List<Guest> _guests;
  List<DataGridRow> _dataGridRows = [];

  @override
  List<DataGridRow> get rows => _dataGridRows;

  Guest find(String phoneNumber) {
    return _guests.firstWhere(
      (element) => element.phoneNumber == phoneNumber,
    );
  }

  @override
  Widget? buildEditWidget(
    DataGridRow dataGridRow,
    RowColumnIndex rowColumnIndex,
    GridColumn column,
    CellSubmit submitCell,
  ) =>
      _GuestTableEditWidgetBuilder(
        dataGridRow: dataGridRow,
        rowColumnIndex: rowColumnIndex,
        column: column,
      ).build(
        submitCell,
      );

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          return Container(
            alignment: Alignment.center,
            child: _GuestsTableCellBuilder(
              dataGridCell.columnName,
              row,
            ).build(
              dataGridCell.value,
            ),
          );
        },
      ).toList(),
      color: _GuestsTableColorGenerator.generate(row),
    );
  }
}

mixin A on GuestsTableSource {
  void a() {
    Log.debug(_guests);
  }
}
