import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/transitions/base_transition.dart';

/// A reusable animation builder widget designed to work with [BaseTransition] subclasses.
///
/// [CustomAnimationBuilder] creates an [AnimationController] and assigns it to the provided
/// [BaseTransition] instance. It handles the animation lifecycle automatically by forwarding
/// the controller on initialization and disposing it when no longer needed.
///
/// This widget is useful when you want to animate custom transitions such as fade, slide,
/// or scale effects that extend [BaseTransition].
///
/// Example usage:
/// ```dart
/// CustomAnimationBuilder(
///   transition: Fade(
///     begin: 0.0,
///     end: 1.0,
///     child: Text("Hello"),
///   ),
/// );
/// ```
///
/// The animation will start automatically once the widget is mounted.
class CustomAnimationBuilder<T> extends StatefulWidget {
  /// Creates a [CustomAnimationBuilder] widget.
  ///
  /// [transition] is a required parameter that specifies the transition to be animated.
  const CustomAnimationBuilder({
    required this.transition,
    super.key,
    this.duration = const Duration(milliseconds: 500),
  });

  /// The transition to be animated.
  /// This should be an instance of a class that extends [BaseTransition].
  /// It defines the animation properties and behavior.
  final BaseTransition<T> transition;

  /// The duration of the animation.
  final Duration duration;
  @override
  State<CustomAnimationBuilder<T>> createState() =>
      _CustomAnimationBuilderState();
}

class _CustomAnimationBuilderState<T> extends State<CustomAnimationBuilder<T>>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  late final BaseTransition<dynamic> transition;

  @override
  void initState() {
    controller.forward();
    transition = widget.transition;
    transition.controller = controller;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return transition.build();
      },
    );
  }
}
