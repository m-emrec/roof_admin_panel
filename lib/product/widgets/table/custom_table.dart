import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_data_table_extension.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
part 'custom_table_selection_manager.dart';
part 'custom_table_load_more_view.dart';

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
    this.onCellTap,
    this.rowsPerPage = 10,
    this.controller,
    this.onSelectionChanged,
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

  /// The callback function that is called when a cell is tapped.
  final void Function(DataGridCellTapDetails)? onCellTap;

  /// The callback function that is called when the selection is changed.
  final void Function(List<DataGridRow>, List<DataGridRow>)? onSelectionChanged;

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable>
    with _CustomTableLoadMoreViewBuilder {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.extension<CustomDataTableThemeExtension>();

    return LayoutBuilder(
      builder: (context, constraints) {
        loadMoreIfNotScrollable(
          constraints.maxHeight,
        );
        return SfDataGridTheme(
          data: theme?.tableTheme ?? const SfDataGridThemeData(),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: theme?.border,
            ),
            child: SfDataGrid(
              rowHeight: theme?.rowHeight ?? double.nan,
              showVerticalScrollbar: false,
              loadMoreViewBuilder: buildLoadMore,
              controller: widget.controller,
              onCellTap: widget.onCellTap,

              checkboxColumnSettings: const DataGridCheckboxColumnSettings(
                showCheckboxOnHeader: false,
              ),
              showCheckboxColumn: true,
              checkboxShape: theme?.checkboxShape,
              headerGridLinesVisibility: GridLinesVisibility.none,

              rowsPerPage: widget.rowsPerPage,
              gridLinesVisibility: GridLinesVisibility.none,
              onSelectionChanged: widget.onSelectionChanged,
              selectionMode: SelectionMode.multiple,
              navigationMode: GridNavigationMode.cell,
              source: widget.source,
              selectionManager: _CustomTableSelectionManager(),
              allowEditing: true,

              /// If the width of the table is less than the minimum width,
              /// the column width mode is set to auto, otherwise it is set to fill.
              /// This is done to prevent the table from overflowing.
              columnWidthMode:
                  constraints.maxWidth < (theme?.minTableWidth ?? 700)
                      ? ColumnWidthMode.auto
                      : ColumnWidthMode.fill,
              columns: widget.columns,
            ),
          ),
        );
      },
    );
  }
}
