import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/add%20new%20manager/add_manager_dialog.dart';

///
mixin AddManagerDialogStateMixin on ConsumerState<AddManagerDialog> {
  ///
  final formKey = GlobalKey<FormState>();

  ///
  bool shouldShowAddNewRole = false;

  ///
  final emailController = TextEditingController();

  ///
  final roleController = TextEditingController();

  ///
  void onAddNewRole() {
    shouldShowAddNewRole = !shouldShowAddNewRole;
    setState(() {});
  }

  ///
  void onTapAdd() => formKey.currentState?.validate();
}
