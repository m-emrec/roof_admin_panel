import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/managerRoles/presentation/widgets/select_role_dropdown.dart';
import 'package:roof_admin_panel/features/managers/presentation/providers/managers_provider.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/add_permissions.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/user_roles.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

///
class UpdateManagerDialog extends ConsumerWidget {
  ///
  const UpdateManagerDialog(this.manager, {super.key});

  ///
  final ManagerModel manager;

  ///
  Future<void> onTapConfirm(
    TextEditingController roleController,
    WidgetRef ref,
    BuildContext context,
  ) async {
    await ref
        .read(managersViewModelProvider.notifier)
        .editManagerRole(
          roleController.text,
          manager,
          ref,
        )
        .showLoading(context: context);
    CustomAlertDialog.hideAlertDialog(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<String> roleText = ValueNotifier<String>(
      manager.role.name?.name ?? "",
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(addManagerViewModelProvider.notifier)
          .initializeManagerPermissions(manager.role.permissions);
    });
    final roleController = TextEditingController();
    roleController
      ..text = manager.role.name?.name ?? ""
      ..addListener(() {
        roleText.value = roleController.text.isEmpty
            ? manager.role.name?.name ?? ""
            : roleController.text;
        if (roleText.value == UserRoles.user.name) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref
                .read(addManagerViewModelProvider.notifier)
                .initializeManagerPermissions(manager.role.permissions);
          });
        }
      });

    return CustomAlertDialog(
      title: Text(LocaleKeys.managersView_updateManager.tr()),
      content: SizedBox(
        width: context.dynamicWidth(0.4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectRoleDropdown(
              roleController,
            ),
            ValueListenableBuilder(
                valueListenable: roleText,
                builder: (context, value, child) {
                  return Visibility(
                    visible: value == UserRoles.user.name,
                    child: const AddPermissions(),
                  );
                }),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        ElevatedButton(
          onPressed: () => onTapConfirm(roleController, ref, context),
          child: Text(LocaleKeys.common_confirm.tr()),
        ),
      ],
    );
  }
}
