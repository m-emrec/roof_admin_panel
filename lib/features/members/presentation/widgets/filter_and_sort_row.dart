import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/filter_dialog.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

/// This is the row that contains the filter and sort icons.
class FilterAndSortRow extends ConsumerWidget {
  /// This is the row that contains the filter and sort icons.
  const FilterAndSortRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      spacing: SpacingSizes.medium,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: () => CustomAlertDialog.showAlertDialog(
            barrierDismissible: true,
            context: context,
            content: const FilterDialog(),
          ).whenComplete(
            // Revert unapplied filters when the dialog is closed.
            () => ref.read(filterNotifierProvider).revertUnappliedFilters(),
          ),
          child: Chip(
            onDeleted: ref.watch(filterNotifierProvider).isFilterApplied
                ? () => ref.read(filterNotifierProvider).clearFilters()
                : null,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            label: SvgPicture.asset(
              Assets.icons.filterIcon,
              width: 16,
              height: 16,
            ),
          ),
        ),
        SvgPicture.asset(
          Assets.icons.sortIcon,
          width: 16,
          height: 16,
        ),
      ],
    );
  }
}
