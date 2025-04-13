import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/transitions/base_transition.dart';

/// A custom slide transition that animates the position of a widget
/// from a starting offset to an ending offset.
/// This class extends the [BaseTransition] class and uses a [SlideTransition]
/// to create the sliding effect.
final class CustomSlideTransition extends BaseTransition<Offset> {
  /// Constructor for [CustomSlideTransition].
  CustomSlideTransition({
    required super.child,
    required super.begin,
    required super.end,
  });

  @override
  Widget build() {
    return SlideTransition(
      position: animation,
      child: child,
    );
  }
}
