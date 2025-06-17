import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members-view/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members-view/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members-view/presentation/widgets/table/table-source/members_table_data_source.dart';
import 'package:roof_admin_panel/features/members-view/presentation/widgets/table/members_table_selection_maanger.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';
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
        : Padding(
            padding: const AppPadding.horizontalxsSymmetric() +
                const AppPadding.verticalxsSymmetric(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const AppBorderRadius.medium(),
                color: AppColors.backgroundColor[70],
                border: Border.all(
                  color: AppColors.backgroundColor[10] ?? Colors.transparent,
                  width: 2,
                ),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Color(0xF90D2511),
                //     blurRadius: 3,
                //     offset: Offset(0, 0),
                //     spreadRadius: 0,
                //   ),
                //   BoxShadow(
                //     color: Color(0xD80D2511),
                //     blurRadius: 6,
                //     offset: Offset(1, 0),
                //     spreadRadius: 0,
                //   ),
                //   BoxShadow(
                //     color: Color(0x7F0D2511),
                //     blurRadius: 8,
                //     offset: Offset(2, 0),
                //     spreadRadius: 0,
                //   ),
                //   BoxShadow(
                //     color: Color(0x260D2511),
                //     blurRadius: 9,
                //     offset: Offset(3, 0),
                //     spreadRadius: 0,
                //   ),
                //   BoxShadow(
                //     color: Color(0x050D2511),
                //     blurRadius: 10,
                //     offset: Offset(5, 0),
                //     spreadRadius: 0,
                //   ),
                // ],
              ),
              child: CustomTable(
                showCheckboxColumn: false,
                controller: controller,
                selectionManager: MembersTableSelectionManager(
                  ref: ref,
                  context: context,
                ),
                source: tableSource,
                rowsPerPage: 20,
                columns: buildColumns(context),
              ),
            ),
          );
  }
}
