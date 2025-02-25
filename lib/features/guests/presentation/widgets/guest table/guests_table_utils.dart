part of 'guests_table.dart';

final class _GuestsTableUtils {
  _GuestsTableUtils(
    this.added,
    this.removed,
    this.ref,
    // WidgetRef ref,
  );

  final List<DataGridRow> added;

  final List<DataGridRow> removed;

  final WidgetRef ref;

  static Guest _generateGuestModel(DataGridRow row) {
    final cells = row.getCells();
    return Guest(
      id: IDGenerator.generateId(
        cells
            .singleWhere(
              (cell) => cell.columnName == GuestTableNames.phoneNumber.name,
            )
            .value
            .toString(),
      ),
      name: cells
          .singleWhere(
            (cell) => cell.columnName == GuestTableNames.name.name,
          )
          .value
          .toString(),
      phoneNumber: cells
          .singleWhere(
            (cell) => cell.columnName == GuestTableNames.phoneNumber.name,
          )
          .value
          .toString(),
      gender: cells
          .singleWhere(
            (cell) => cell.columnName == GuestTableNames.gender.name,
          )
          .value
          .toString()
          .fromLocalizedStringToGenderEnum(),
      guestStartDate: DateTime.parse(
        cells
            .singleWhere(
              (cell) => cell.columnName == GuestTableNames.guestStartDate.name,
            )
            .value
            .toString(),
      ),
      joinedEventCount: int.tryParse(
        cells
            .singleWhere(
              (cell) =>
                  cell.columnName == GuestTableNames.joinedEventCount.name,
            )
            .value
            .toString(),
      ),
      role: [
        cells
            .singleWhere(
              (cell) => cell.columnName == GuestTableNames.role.name,
            )
            .value
            .toString()
            .fromLocalizedStringToRoleEnum(),
      ],
    );
  }

  void onSelectionChanged() {
    if (added.isNotEmpty) {
      _addToSelected();
    } else if (removed.isNotEmpty) {
      _removeFromSelected();
    }
  }

  void _addToSelected() {
    ref.read(selectedGuestsProvider.notifier).update(
          (selectedRows) => [
            ...selectedRows,
            _generateGuestModel(added.first),
          ],
        );
  }

  void _removeFromSelected() {
    ref.read(selectedGuestsProvider.notifier).update(
          (selectedRows) => [
            for (final row in selectedRows)
              if (row.id !=
                  removed.first
                      .getCells()
                      .where(
                        (cell) =>
                            cell.columnName == GuestTableNames.phoneNumber.name,
                      )
                      .map(
                        (cell) => Guest(
                          id: IDGenerator.generateId(cell.value.toString()),
                        ),
                      )
                      .first
                      .id)
                row,
          ],
        );
  }
}
