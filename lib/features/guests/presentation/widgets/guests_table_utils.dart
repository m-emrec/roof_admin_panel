part of 'guests_table.dart';

class _GuestsTableUtils {
  _GuestsTableUtils();

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

  static void onSelectionChanged(
    List<DataGridRow> added,
    List<DataGridRow> removed,
    WidgetRef ref,
  ) {
    if (added.isNotEmpty) {
      ref.read(selectedGuestsProvider.notifier).update(
            (selectedRows) => [
              ...selectedRows,
              _generateGuestModel(added.first),
            ],
          );
    } else if (removed.isNotEmpty) {
      ref.read(selectedGuestsProvider.notifier).update(
            (selectedRows) => [
              for (final row in selectedRows)
                if (row.id !=
                    removed.first
                        .getCells()
                        .where(
                          (cell) =>
                              cell.columnName ==
                              GuestTableNames.phoneNumber.name,
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
}
