import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/managers/presentation/providers/managers_provider.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/add%20new%20manager/add_manager_dialog.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';
import 'package:roof_admin_panel/product/utility/models/manager_role_model.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

///
mixin AddManagerDialogStateMixin on ConsumerState<AddManagerDialog> {
  ///
  final formKey = GlobalKey<FormState>();

  ///
  final emailController = TextEditingController();

  ///
  final nameController = TextEditingController();

  ///
  final roleController = TextEditingController();

  ManagerModel get _createModel => ManagerModel(
        uid: "",
        email: emailController.text,
        name: nameController.text,
        role: ManagerRoleModel(
          name: "",
          id: roleController.text,
          permissions: [],
        ),
      );

  ///
  Future<void> onTapAdd() async {
    if (formKey.currentState?.validate() ?? false) {
      await ref
          .read(managersViewModelProvider.notifier)
          .addManager(
            _createModel,
          )
          .showLoading(context: context)
          .then((_) => CustomAlertDialog.hideAlertDialog(context));
    }
  }
}
