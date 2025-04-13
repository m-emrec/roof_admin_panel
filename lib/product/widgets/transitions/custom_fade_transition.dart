import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/transitions/base_transition.dart';

/// A custom fade transition widget that animates the opacity of its child.
///
///
final class CustomFadeTransition extends BaseTransition<double> {
  /// Creates a [CustomFadeTransition] widget.
  ///
  CustomFadeTransition({
    required super.child,
    required super.begin,
    required super.end,
  });

  @override
  Widget build() {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
