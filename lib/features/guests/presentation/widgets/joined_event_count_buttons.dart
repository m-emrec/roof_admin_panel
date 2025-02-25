import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/guests/data/datasources/guest%20table%20source/guests_table_source.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_table_names.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/table/table_cell_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class JoinedEventCountButtons extends ConsumerWidget {
  const JoinedEventCountButtons(this.dataGridRow, this.value, {super.key});
  final DataGridRow dataGridRow;
  final int value;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton.filledTonal(
          onPressed: () {
            ref.read(guestsViewModelProvider.notifier).decreaseJoinedEventCount(
                  ref.read(guestsTableSourceProvider).find(
                        dataGridRow
                            .getCells()
                            .firstWhere(
                              (element) =>
                                  element.columnName ==
                                  GuestTableNames.phoneNumber.name,
                            )
                            .value
                            .toString(),
                      ),
                );
          },
          icon: const Icon(Icons.remove),
        ),
        TableCellItem(
          label: value.toString(),
        ),
        IconButton.filledTonal(
          onPressed: () {
            ref.read(guestsViewModelProvider.notifier).increaseJoinedEventCount(
                  ref.read(guestsTableSourceProvider).find(
                        dataGridRow
                            .getCells()
                            .firstWhere(
                              (element) =>
                                  element.columnName ==
                                  GuestTableNames.phoneNumber.name,
                            )
                            .value
                            .toString(),
                      ),
                );
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
