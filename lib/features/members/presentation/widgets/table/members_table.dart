import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/table/data_source/members_table_data_source.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/table/members_table_selection_maanger.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';
import 'package:roof_admin_panel/product/widgets/table/custom_table.dart';
import 'package:roof_admin_panel/product/widgets/table/header_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'members_filter_handler_mixin.dart';
part 'table_column_builder_mixin.dart';

/// [MembersTable] is a widget that displays a table of members.
///
/// it mainly used on the [MembersView] page.
class MembersTable extends ConsumerWidget
    with _MembersFilterHandlerMixin, _TableColumnBuilderMixin {
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
    final tableSource = ref.watch(membersTableSourceProvider);

    return hasActiveFilterButNoData(ref, tableSource)
        ? buildEmptyFilteredTableMessage(context, ref)
        : CustomTable(
            controller: controller,
            selectionManager: MembersTableSelectionManager(
              ref: ref,
              context: context,
            ),
            source: tableSource,
            rowsPerPage: 20,
            columns: buildColumns(),
          );
  }
}
