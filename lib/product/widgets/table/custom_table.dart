import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_data_table_extension.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// A custom table widget that displays data in a table format.
///
/// It returns a [SfDataGrid] widget with the given [columns] and [source].
class CustomTable extends StatefulWidget {
  /// A custom table widget that displays data in a table format.
  ///
  /// It returns a [SfDataGrid] widget with the given [columns] and [source].
  const CustomTable({
    required this.source,
    required this.columns,
    this.rowsPerPage = 10,
    this.controller,
    super.key,
  });

  /// The columns of the table.
  ///
  /// These columns are used to display the data in the table.
  final List<GridColumn> columns;

  /// The source of the table.
  ///
  /// This source is used to provide the data to the table.
  final DataGridSource source;

  /// The number of rows per page.
  final int rowsPerPage;

  /// The controller of the table.
  final DataGridController? controller;
  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  /// The minimum width of the table.
  /// If the width of the table is less than this value, the column width mode is set to auto.
  ///
  /// I found this value by trial and error.
  /// 600 is the minimum width that the table can be displayed properly.
  final double _minWidth = 600;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SfDataGridTheme(
          data: context.theme
                  .extension<CustomDataTableThemeExtension>()
                  ?.tableTheme ??
              const SfDataGridThemeData(),
          child: SfDataGrid(
            loadMoreViewBuilder: (context, loadMoreRows) {
              return FutureBuilder(
                future: loadMoreRows(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: 48,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const LoadingIndicator(),
                    );
                  }
                  return const SizedBox();
                },
              );
            },
            controller: widget.controller,
            onCellTap: (details) {},
            showCheckboxColumn: true,
            headerGridLinesVisibility: GridLinesVisibility.none,
            isScrollbarAlwaysShown: true,

            rowsPerPage: widget.rowsPerPage,
            // editingGestureType: EditingGestureType.tap,
            gridLinesVisibility: GridLinesVisibility.none,
            onCellLongPress: (details) =>
                Log.debug(details.rowColumnIndex.rowIndex),

            onSelectionChanged: (addedRows, removedRows) =>
                Log.debug(addedRows.first.getCells().toString()),
            selectionMode: SelectionMode.multiple,
            navigationMode: GridNavigationMode.cell,
            source: widget.source,

            /// If the width of the table is less than the minimum width,
            /// the column width mode is set to auto, otherwise it is set to fill.
            /// This is done to prevent the table from overflowing.
            columnWidthMode:
                ColumnWidthMode.auto, //constraints.maxWidth < _minWidth
            // ? ColumnWidthMode.auto
            // : ColumnWidthMode.fill,
            columns: widget.columns,
          ),
        );
      },
    );
  }
}
