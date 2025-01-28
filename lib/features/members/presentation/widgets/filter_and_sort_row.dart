import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/utility/constants/spacing_sizes.dart';

/// This is the row that contains the filter and sort icons.
class FilterAndSortRow extends StatelessWidget {
  /// This is the row that contains the filter and sort icons.
  const FilterAndSortRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: SpacingSizes.medium,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          Assets.icons.filterIcon,
        ),
        SvgPicture.asset(
          Assets.icons.sortIcon,
        ),
      ],
    );
  }
}
