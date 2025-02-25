part of 'guests_table_source.dart';

final class _GuestTableEditWidgetBuilder {
  _GuestTableEditWidgetBuilder({
    required this.dataGridRow,
    required this.column,
    required this.rowColumnIndex,
  });

  final DataGridRow dataGridRow;
  final RowColumnIndex rowColumnIndex;
  final GridColumn column;
  Widget? build(
    CellSubmit submitCell,
  ) {
    final columnName = _GuestColumnNameConverter.toGuestTableEnum(
      column.columnName,
    );
    switch (columnName) {
      case GuestTableNames.joinedEventCount:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filledTonal(
              onPressed: () {
                submitCell();
              },
              icon: const Icon(Icons.add),
            ),
            TableCellItem(
              label: _isValueNull ? "0" : _getCellValue<int?>().toString(),
            ),
            IconButton.filledTonal(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              icon: const Icon(Icons.add),
            ),
          ],
        );

      /// For this table, other columns are not editable so we return null
      // ignore: no_default_cases
      default:
        return null;
    }
  }

  bool get _isValueNull =>
      // Log.debug(dataGridRow.getCells());
      dataGridRow.getCells()[_findIndex].value == null;

  T? _getCellValue<T>() {
    return dataGridRow.getCells()[_findIndex].value as T;
  }

  int get _findIndex => dataGridRow
      .getCells()
      .indexWhere((cell) => cell.columnName == column.columnName);
}
