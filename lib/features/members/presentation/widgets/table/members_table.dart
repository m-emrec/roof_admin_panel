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
    return CustomTable(
      controller: controller,
      source: ref.watch(membersTableSourceProvider),
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
            // allowEditing: false,
            allowFiltering: true),
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
