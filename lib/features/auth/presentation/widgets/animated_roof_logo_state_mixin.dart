import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/animated_roof_logo.dart';

/// A mixin that provides the [initAnimationController] method to initialize
/// the [AnimationController] and start the animation.
mixin AnimatedRoofLogoStateMixin on State<AnimatedRoofLogo> {
  ///
  late final AnimationController animationController;

  /// Initializes the [AnimationController] and starts the animation.
  void initAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      upperBound: 0.7,
      duration: const Duration(milliseconds: 500),
    )
      ..forward()
      ..addListener(_animationListener);
  }

  void _animationListener() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.animateTo(animationController.upperBound - 0.1);
    }
  }

  @override
  void dispose() {
    animationController
      ..removeListener(_animationListener)
      ..dispose();
    super.dispose();
  }
}
