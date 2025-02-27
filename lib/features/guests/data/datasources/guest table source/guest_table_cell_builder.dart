part of 'guests_table_source.dart';

class _GuestsTableSourceCellBuilder {
  /// This class is responsible for building the cell of the [GuestsTable]
  ///
  /// It has a [_buildCell] method that takes a [columnName] and a [value] and returns
  /// a [Widget]
  ///
  /// It is used in [GuestsTableSource] to build the cell of the [GuestsTable]
  /// based on the [columnName] and [value]
  ///
  ///
  _GuestsTableSourceCellBuilder(
    this.row,
  );
  final DataGridRow row;

  String get getPhoneNumber {
    return row
        .getCells()
        .firstWhere(
          (element) => element.columnName == GuestTableNames.phoneNumber.name,
        )
        .value
        .toString();
  }

  List<Widget> build() {
    return row
        .getCells()
        .map<Widget>(
          _buildCell,
        )
        .toList();
  }

  Widget _buildCell(DataGridCell cell) {
    final column = _GuestColumnNameConverter.toGuestTableEnum(cell.columnName);

    return Container(
      alignment: Alignment.center,
      child: _buildWidget(column, cell.value),
    );
  }

  /// Returns the appropriate widget based on column type
  Widget _buildWidget(GuestTableNames column, dynamic value) {
    if (value == null) return const TableNullItem();

    switch (column) {
      case GuestTableNames.name:
      case GuestTableNames.phoneNumber:
      case GuestTableNames.gender:
      case GuestTableNames.role:
        return _buildTextCell(value);
      case GuestTableNames.guestStartDate:
        return _buildDateCell(value);
      case GuestTableNames.joinedEventCount:
        return _buildEventCountCell(value);
    }
  }

  Widget _buildTextCell(dynamic value) {
    return TableCellItem(label: value.toString());
  }

  Widget _buildDateCell(dynamic value) {
    return TableDateItem(
      date: value as DateTime,
      showIsMembershipExpiringSoon: false,
    );
  }

  Widget _buildEventCountCell(dynamic value) {
    return GuestsTableJoinedEventCountItem(value as int, getPhoneNumber);
  }
}
