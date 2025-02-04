import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/feedback_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/members_route/members_route.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/controller.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar.dart';

mixin SideBarStateMixin on State<SideBar> {
  double expandedWidth = 300;
  double collapsedWidth = 64;
  late final AnimationController animationController;

  void sideBarAnimationListener(AnimationStatus status) {
    if (status == AnimationStatus.forward) {
      SideBarController().openSideBar();
    } else if (status == AnimationStatus.reverse) {
      SideBarController().closeSideBar();
    }

    setState(() {});
  }

  void navigationManager() {
    switch (SideBarController().selectedPage.value) {
      case 0:
        context.goNamed(MembersRoute().name);
      case 1:
        context.goNamed(FeedbackRoute().name);
      default:
    }
  }

  @override
  void dispose() {
    animationController
      ..removeListener(() {})
      ..removeStatusListener(sideBarAnimationListener)
      ..dispose();
    SideBarController().selectedPage
      ..removeListener(navigationManager)
      ..dispose();
    super.dispose();
  }
}
