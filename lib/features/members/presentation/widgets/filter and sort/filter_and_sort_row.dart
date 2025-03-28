import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/sort_by_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/sort_type_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/filter_dialog.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/widgets/app_icon.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
part 'members_filter_button.dart';
part 'members_sort_button.dart';
part 'sort_label.dart';
part 'sort_direction_button.dart';

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
        _MembersFilterButton(),
        _MembersSortButton(),
      ],
    );
  }
}
