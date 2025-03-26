import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/table/custom_table.dart';
import 'package:roof_admin_panel/product/widgets/table/header_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// [MembersTable] is a widget that displays a table of members.
///
/// it mainly used on the [MembersView] page.
class MembersTable extends ConsumerWidget {
  /// [MembersTable] is a widget that displays a table of members.
  ///
  /// it mainly used on the [MembersView] page.
  const MembersTable({
    super.key,
  });

  /// The list of members to display in the table.
  // final List<UserModel> members;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = DataGridController();
    // Log.info(ref.watch(membersTableSourceProvider).rows.length);
    final tableSource = ref.watch(membersTableSourceProvider);

    /// If the filter is applied and no data is found for the filter,
    /// First call the [handleLoadMoreRows] method to fetch more data and
    ///  then show a message.
    if (ref.watch(filterNotifierProvider).isFilterApplied &&
        tableSource.effectiveRows.isEmpty) {
      tableSource.handleLoadMoreRows();
      return const Center(
        child: Text('No data found for this filter'),
      );
    }

    return CustomTable(
      controller: controller,
      source: tableSource,
      rowsPerPage: 1,
      columns: <GridColumn>[
        GridColumn(
          columnName: MemberTableNames.memberNumber.name,
          label: ColumnTitle(
            title: MemberTableNames.memberNumber.toLocale,
          ),
          // filterIconPosition: ColumnHeaderIconPosition.start,
        ),
        GridColumn(
          columnName: MemberTableNames.memberName.name,
          label: ColumnTitle(
            title: MemberTableNames.memberName.toLocale,
          ),
          columnWidthMode: ColumnWidthMode.auto,
        ),
        GridColumn(
          columnName: MemberTableNames.membershipEndDate.name,
          label: ColumnTitle(
            title: MemberTableNames.membershipEndDate.toLocale,
          ),
        ),
        GridColumn(
          columnName: MemberTableNames.role.name,
          label: ColumnTitle(
            title: MemberTableNames.role.toLocale,
          ),
        ),
        GridColumn(
          columnName: MemberTableNames.age.name,
          label: ColumnTitle(
            title: MemberTableNames.age.toLocale,
          ),
        ),
        GridColumn(
          columnName: MemberTableNames.membershipDuration.name,
          label: ColumnTitle(
            title: MemberTableNames.membershipDuration.toLocale,
          ),
        ),
      ],
    );
  }
}
