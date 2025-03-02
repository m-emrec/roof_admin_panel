import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/side_bar_theme_extension.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/controller.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar.dart';

/// SideBarStateMixin is a mixin class that contains the logic for the sidebar state.
mixin SideBarStateMixin on State<SideBar> {
  /// expandedWidth is the width of the sidebar when it is expanded.
  /// ? This value is arbitrary. It  looks good when it is 300.
  late final double expandedWidth;

  /// collapsedWidth is the width of the sidebar when it is collapsed.
  /// ? Also this value is arbitrary. It  looks good when it is 64.
  late final double collapsedWidth;

  /// animationController is the controller for the sidebar collapse/expand
  /// animation .
  late final AnimationController animationController;

  /// sideBarAnimationStatusListener is a listener function that listens to
  /// the animation status.
  ///
  /// If the animation status is forward, it will expand the sidebar.
  ///
  /// If the animation status is reverse, it will collapse the sidebar.
  void sideBarAnimationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.forward) {
      SideBarController().expandSideBar();
    } else if (status == AnimationStatus.reverse) {
      SideBarController().collapseSideBar();
    }
  }

  /// Just to initialize the animation controller.
  void initializeAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      lowerBound:
          context.theme.extension<SideBarThemeExtension>()?.collapsedWidth ??
              64,
      upperBound:
          context.theme.extension<SideBarThemeExtension>()?.expandedWidth ??
              300,
      duration: SideBarController().animationDuration,
      value: context.theme.extension<SideBarThemeExtension>()?.expandedWidth ??
          300,
    );
    animationController
      ..forward()
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener(sideBarAnimationStatusListener);
  }

  @override
  void dispose() {
    animationController
      ..removeListener(() {})
      ..removeStatusListener(sideBarAnimationStatusListener)
      ..dispose();

    super.dispose();
  }
}
