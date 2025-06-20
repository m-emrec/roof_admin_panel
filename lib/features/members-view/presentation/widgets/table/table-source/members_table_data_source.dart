import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members-view/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members-view/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members-view/presentation/widgets/table/table-source/cell_builder.dart';
import 'package:roof_admin_panel/features/members-view/presentation/widgets/table/table-source/data_grid_row_generator.dart';
import 'package:roof_admin_panel/features/members-view/presentation/widgets/table/table-source/table_sorter.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// This is the data source for the members table.
/// It provides the data to the table.
///
/// It also handles the data related operations like sorting, filtering, and loading more data.
class MembersTableDataSource extends DataGridSource
    with DataGridRowGenerator, CellBuilder, TableSorter {
  /// This is the data source for the members table.
  /// It provides the data to the table.
  ///
  /// It also handles the data related operations like sorting, filtering, and loading more data.
  MembersTableDataSource({
    required List<MemberModel> users,
    required this.ref,
  }) {
    generateUserDataGridRows(users);
  }

  /// The reference to the provider container.
  ///
  /// This is necessary because I need to call the [membersViewModelProvider]
  /// to fetch the next 20 users.
  final Ref ref;

  @override
  Future<void> handleLoadMoreRows() async {
    final users = ref.read(membersViewModelProvider);
    if ((users.value?.length ?? 0) <
            (ref.read(totalMembersCountProvider).value ?? 0) &&
        (users.value?.length ?? 0) > 0) {
      await ref.read(membersViewModelProvider.notifier).fetchNext20Users(
            users.value?.last.uid ?? '',
          );
      ref.read(membersViewModelProvider).whenData(
        (value) {
          generateUserDataGridRows(value ?? []);
        },
      );
      ref.read(filterNotifierProvider).revertUnappliedFilters();
      ref.read(filterNotifierProvider).applyFilters();
    }
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return cellBuilder(
          MemberTableNames.toTableNamesEnum(dataGridCell.columnName),
          dataGridCell.value,
        );
      }).toList(),
    );
  }
}
