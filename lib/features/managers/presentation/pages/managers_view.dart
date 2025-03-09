import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/add_manager_button.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/managers_list_container.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/permissions_handler.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

///
class ManagersView extends StatelessWidget {
  ///
  const ManagersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingSizes.medium,
      children: [
        TitleWidget(title: LocaleKeys.managersView_pageTitle.tr()),
        Center(
          child: PermissionBasedVisibility(
            necessaryPermissions: [
              Permissions.canReadManagers,
              Permissions.canRead,
            ],
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: SpacingSizes.small,
              children: [
                AddManagerButton(),
                ManagersListContainer(),
              ],
            ),
          ).visibleOrPermissionInfo,
        ),
      ],
    );
  }
}
