import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/managers/data/models/add_manager_model.dart';
import 'package:roof_admin_panel/features/managers/presentation/providers/managers_provider.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/add%20new%20manager/add_manager_dialog.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/user_roles.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
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

  bool shouldShowCustomRole = false;

  @override
  void initState() {
    roleController.addListener(() {
      if (UserRoles.fromString(roleController.text) == UserRoles.user) {
        shouldShowCustomRole = true;
      } else {
        shouldShowCustomRole = false;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {});
      });
    });
    super.initState();
  }

  AddManagerModel get _createModel => AddManagerModel(
        name: nameController.text,
        email: emailController.text,
        role: roleController.text,
      );

  ///
  Future<void> onTapAdd() async {
    if (formKey.currentState?.validate() ?? false) {
      await ref
          .read(addManagerViewModelProvider.notifier)
          .addManager(
            _createModel,
          )
          .showLoading(context: context)
          .then((_) => CustomAlertDialog.hideAlertDialog(context));
    }
  }
}
