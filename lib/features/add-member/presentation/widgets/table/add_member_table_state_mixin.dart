import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/add_member_table.dart';

/// This mixin is used to add the required controllers and form key to the AddMemberPage
mixin AddMemberTableStateMixin on ConsumerState<AddMemberTable> {
  late AnimationController animationController;
  late Animation<double> heightAnimation;

  late final slideTransition = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(animationController);

  /// This method is used to initialize the animation controller
  /// and set the duration of the animation
  void initAnimation(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 400),
    )..forward();
  }

  @override
  void didChangeDependencies() {
    ref.read(addMemberProvider).initControllers(context);
    heightAnimation = Tween<double>(begin: 0, end: 80).animate(
      animationController.drive(
        CurveTween(curve: Curves.easeIn),
      ),
    );

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
