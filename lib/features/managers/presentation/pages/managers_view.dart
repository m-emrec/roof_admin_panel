import 'package:core/core.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/managers/presentation/providers/managers_provider.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/add%20new%20manager/add_manager_dialog.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/managers_list.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/manager_info.dart';
import 'package:roof_admin_panel/product/utility/permissions_handler.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

///
class ManagersView extends StatelessWidget {
  ///
  const ManagersView({super.key});

  @override
  Widget build(BuildContext context) {
    Log.debug(Permissions.canEditManagers.toLocale());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingSizes.medium,
      children: [
        TitleWidget(title: LocaleKeys.managersView_pageTitle.tr()),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: SpacingSizes.small,
            children: [
              PermissionBasedVisibility(
                necessaryPermissions: [Permissions.canEditManagers],
                child: ElevatedButton(
                  onPressed: PermissionBasedAction(
                    () => CustomAlertDialog.showAlertDialog(
                      context: context,
                      barrierDismissible: true,
                      content: const AddManagerDialog(),
                    ),
                    necessaryPermissions: [Permissions.canEditManagers],
                  ).actionIfAllowed,
                  child: Text(LocaleKeys.managersView_addManager.tr()),
                ),
              ).build,
              Container(
                width: context.dynamicWidth(0.6),
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
            ],
          ),
        ),
      ],
    );
  }
}
