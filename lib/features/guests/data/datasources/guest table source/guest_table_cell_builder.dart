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

  /// This method returns the [GuestTableNames] based on given the [columnName]
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
}
