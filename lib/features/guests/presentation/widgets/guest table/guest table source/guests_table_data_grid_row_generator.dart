part of 'guests_table_source.dart';

/// This class is responsible for generating DataGridRow for GuestsTable
///
/// It has a [generate] method that takes a list of [Guest] and returns a
/// list of [DataGridRow]
///
final class _GuestsTableDataGridRowGenerator {
  _GuestsTableDataGridRowGenerator._();

  static List<DataGridRow> generate(List<Guest> guests) {
    return guests.map<DataGridRow>((e) {
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
}
