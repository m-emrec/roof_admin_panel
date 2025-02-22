import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_table_names.dart';
import 'package:roof_admin_panel/product/widgets/table/table_cell_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_date_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_null_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
part 'guest_table_cell_builder.dart';
part 'guests_table_data_grid_row_generator.dart';
part 'guests_table_color_generator.dart';

/// DataGridSource for GuestsTable
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
      color: _GuestsTableColorGenerator.generate(row),
    );
  }
}
