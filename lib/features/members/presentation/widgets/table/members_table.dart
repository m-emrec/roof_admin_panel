import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/table/members_filter_handler_mixin.dart';
import 'package:roof_admin_panel/product/widgets/table/custom_table.dart';
import 'package:roof_admin_panel/product/widgets/table/header_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// [MembersTable] is a widget that displays a table of members.
///
/// it mainly used on the [MembersView] page.
class MembersTable extends ConsumerWidget with MembersFilterHandlerMixin {
  /// [MembersTable] is a widget that displays a table of members.
  ///
  /// it mainly used on the [MembersView] page.
  MembersTable({
    super.key,
  });

  /// The list of members to display in the table.
  // final List<UserModel> members;
  final controller = DataGridController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Log.info(ref.watch(membersTableSourceProvider).rows.length);
    final tableSource = ref.watch(membersTableSourceProvider);

    return hasActiveFilterButNoData(ref, tableSource)
        ? buildEmptyFilteredTableMessage(context, ref)
        : CustomTable(
            controller: controller,
            source: tableSource,
            rowsPerPage: 20,
            columns: <GridColumn>[
              GridColumn(
                columnName: MemberTableNames.memberNumber.name,
                label: ColumnTitle(
                  title: MemberTableNames.memberNumber.toLocale,
                ),
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
