import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/transitions/base_transition.dart';

final class CustomScaleTransition extends BaseTransition<double> {
  CustomScaleTransition({
    required super.child,
    required super.begin,
    required super.end,
    this.alignment = Alignment.center,
  });
  final Alignment alignment;
  @override
  Widget build() {
    return ScaleTransition(
      scale: animation,
      alignment: alignment,
      child: child,
    );
  }
}
