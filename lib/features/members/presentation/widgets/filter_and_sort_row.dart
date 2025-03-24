import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/features/members/presentation/sort_type_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/filter_dialog.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/utility/extensions/show_click_mouse_cursor_on_widget_extension.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// This is the row that contains the filter and sort icons.
class FilterAndSortRow extends ConsumerWidget {
  /// This is the row that contains the filter and sort icons.
  const FilterAndSortRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(
      spacing: SpacingSizes.medium,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _Filter(),
        _Sort(),
      ],
    );
  }
}

class _Sort extends ConsumerWidget {
  const _Sort();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      onSelected: (value) =>
          ref.read(membersTableSourceProvider).sort(sortBy: value),
      itemBuilder: (context) {
        return SortBy.values.map((e) {
          return PopupMenuItem(
            value: e,
            child: Text(e.toLocale),
          );
        }).toList();
      },
      child: FilterChip(
        onSelected: null,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          // spacing: SpacingSizes.small,
          children: [
            // Text(
            //   'Sort by name',
            //   style: TextStyle(
            //       // color: context.theme.textTheme.labelMedium.color,
            //       ),
            // ),
            // SizedBox(),
            SvgPicture.asset(
              Assets.icons.sortIcon,
              width: 16,
              height: 16,
            ),
          ],
        ),
      ).showClickMouseCursorOnWidget(),
    );
  }
}

class _Filter extends ConsumerWidget {
  const _Filter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilterChip(
      selected: ref.watch(filterNotifierProvider).isFilterApplied,
      onDeleted: ref.watch(filterNotifierProvider).isFilterApplied
          ? () => ref.read(filterNotifierProvider).clearFilters()
          : null,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      showCheckmark: false,
      onSelected: (_) => CustomAlertDialog.showAlertDialog(
        barrierDismissible: true,
        context: context,
        content: const FilterDialog(),
      ).whenComplete(
        // Revert unapplied filters when the dialog is closed.
        () => ref.read(filterNotifierProvider).revertUnappliedFilters(),
      ),
      // color: WidgetStateColor.resolveWith((state) {
      //   if (state.contains(WidgetState.selected)) {
      //     return AppColors.backgroundColor[60] ?? Colors.transparent;
      //   }
      //   return context.theme.scaffoldBackgroundColor;
      // }),

      label: SvgPicture.asset(
        Assets.icons.filterIcon,
        width: 16,
        height: 16,
      ),
    );
  }
}
