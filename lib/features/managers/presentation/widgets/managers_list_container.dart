import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/managers/presentation/providers/managers_provider.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/managers_list.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/handlers/permissions_handler.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';

///
class ManagersListContainer extends StatelessWidget {
  ///
  const ManagersListContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PermissionBasedVisibility(
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: context.dynamicWidth(0.6),
        constraints: BoxConstraints(maxHeight: context.dynamicHeight(0.8)),
        decoration: BoxDecoration(
          borderRadius: const AppBorderRadius.small(),
          border: Border.all(
            color: AppColors.backgroundColor[30] ?? Colors.transparent,
          ),
        ),
        padding: const AppPadding.verticalxsSymmetric() +
            const AppPadding.horizontalxsSymmetric(),
        child: AsyncDataBuilder(
          provider: managersViewModelProvider,
          data: ManagersList.new,
        ),
      ),
      necessaryPermissions: [Permissions.canReadManagers],
    ).visibleOrPermissionInfo;
  }
}
