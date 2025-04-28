import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/pages/add_member_table.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';

/// This mixin is used to add the required controllers and form key to the AddMemberPage
mixin AddMemberTableStateMixin on ConsumerState<AddMemberTable> {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void didChangeDependencies() {
    ref.read(addMemberProvider).init(context);
    animation = Tween<double>(begin: 50, end: context.screenSize.height * 0.15)
        .animate(animationController);

    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    /// When the widget is deactivated, we need to invalidate the addMemberProvider
    /// to reset the state of the provider
    /// This is important to ensure that the provider is re-initialized
    /// when the widget is re-built
    ref.invalidate(addMemberProvider);
    super.deactivate();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
