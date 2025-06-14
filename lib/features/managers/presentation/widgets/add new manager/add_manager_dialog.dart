import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/add_permissions.dart';
import 'package:roof_admin_panel/features/managerRoles/presentation/widgets/select_role_dropdown.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/add%20new%20manager/add_manager_dialog_state_mixin.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/email_field.dart';

///
class AddManagerDialog extends ConsumerStatefulWidget {
  ///
  const AddManagerDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddManagerDialogState();
}

class _AddManagerDialogState extends ConsumerState<AddManagerDialog>
    with AddManagerDialogStateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: Text(LocaleKeys.managersView_addManager.tr()),
      content: Form(
        key: formKey,
        child: SizedBox(
          width: context.dynamicWidth(0.4),
          child: SingleChildScrollView(
            child: Column(
              spacing: SpacingSizes.medium,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  spacing: SpacingSizes.medium,
                  children: [
                    Flexible(
                      child: EmailField(
                        emailController,
                      ),
                    ),
                    SelectRoleDropdown(roleController),
                  ],
                ),
                CustomTextField(
                  controller: nameController,
                  label: LocaleKeys.common_inputFields_name.tr(),
                  validator: (_) =>
                      ValidatorMethods(text: nameController.text).validateName,
                ),
                Visibility(
                  visible: shouldShowCustomRole,
                  child: const AddPermissions(),
                )
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: context.pop,
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        ElevatedButton(
          onPressed: onTapAdd,
          child: Text(LocaleKeys.common_add.tr()),
        ),
      ],
    );
  }
}
