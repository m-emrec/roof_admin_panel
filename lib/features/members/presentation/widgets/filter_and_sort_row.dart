import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      CustomAlertDialog.showAlertDialog(
        barrierDismissible: true,
        context: context,
        content: const FilterDialog(),
      );
    });

    return Row(
      spacing: SpacingSizes.medium,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => CustomAlertDialog.showAlertDialog(
            barrierDismissible: true,
            context: context,
            content: const FilterDialog(),
          ),
          child: SvgPicture.asset(
            Assets.icons.filterIcon,
          ),
        ),
        SvgPicture.asset(
          Assets.icons.sortIcon,
        ),
      ],
    );
  }
}
