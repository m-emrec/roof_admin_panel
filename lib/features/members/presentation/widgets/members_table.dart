import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/domain/entities/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';
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
    required this.members,
    super.key,
  });

  /// The list of members to display in the table.
  final List<UserModel> members;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = DataGridController();
    return CustomTable(
      controller: controller,
      source: ref.watch(membersTableSourceProvider),
      columns: <GridColumn>[
        GridColumn(
          columnName: TableNamesEnum.memberNumber.name,
          label: HeaderItem(
            title: LocaleKeys.membersView_tableColumnLabels_memberNumber.tr(),
          ),
          filterIconPosition: ColumnHeaderIconPosition.start,
        ),
        GridColumn(
          columnName: TableNamesEnum.memberName.name,
          label: HeaderItem(
            title: LocaleKeys.membersView_tableColumnLabels_name.tr(),
          ),
          columnWidthMode: ColumnWidthMode.auto,
          allowEditing: false,
        ),
        GridColumn(
          columnName: TableNamesEnum.membershipEndDate.name,
          label: HeaderItem(
            title:
                LocaleKeys.membersView_tableColumnLabels_membershipEndDate.tr(),
          ),
        ),
        GridColumn(
          columnName: TableNamesEnum.role.name,
          label: HeaderItem(
            title: LocaleKeys.membersView_tableColumnLabels_role.tr(),
          ),
        ),
        GridColumn(
          columnName: TableNamesEnum.age.name,
          label: HeaderItem(
            title: LocaleKeys.membersView_tableColumnLabels_age.tr(),
          ),
        ),
        GridColumn(
          columnName: TableNamesEnum.membershipDuration.name,
          label: HeaderItem(
            title: LocaleKeys.membersView_tableColumnLabels_memberShipDuration
                .tr(),
          ),
        ),
      ],
    );
  }
}
