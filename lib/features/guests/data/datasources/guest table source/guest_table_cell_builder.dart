part of 'guests_table_source.dart';

/// This class is responsible for building the cell of the [GuestsTable]
///
/// It has a [build] method that takes a [columnName] and a [value] and returns
/// a [Widget]
///
/// It is used in [GuestsTableSource] to build the cell of the [GuestsTable]
/// based on the [columnName] and [value]
///
///
class _GuestsTableCellBuilder {
  _GuestsTableCellBuilder(this.columnName, this.dataGridRow);
  final String columnName;
  final DataGridRow dataGridRow;

  Widget build(dynamic value) {
    final column = _GuestColumnNameConverter.toGuestTableEnum(columnName);
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
        return JoinedEventCountButtons(
          dataGridRow,
          value as int,
        );
      case GuestTableNames.role:
        return TableCellItem(
          label: value.toString(),
        );
    }
  }
}
