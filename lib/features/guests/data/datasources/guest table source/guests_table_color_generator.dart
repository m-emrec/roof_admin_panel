part of 'guests_table_source.dart';

/// This class is responsible for generating the color of the row of the [GuestsTable]
/// based on the [Role] of the guest
///
/// It has a [generate] method that takes a [DataGridRow] and returns a [Color]
///
final class _GuestsTableColorGenerator {
  _GuestsTableColorGenerator._();

  /// This method generates the color of the row of the [GuestsTable]
  /// based on the [Role] of the guest
  ///
  /// - If the role of the guest is [Role.approvedGuest] then it returns
  /// [AppColors.backgroundColor[60]]
  /// - Otherwise it returns [Colors.transparent]
  static Color? generate(DataGridRow row) {
    return row
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
        : Colors.transparent;
  }
}
