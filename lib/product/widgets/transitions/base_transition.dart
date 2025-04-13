import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/custom_animation_builder.dart';

/// A base class for custom transition widgets used with [CustomAnimationBuilder].
///
/// [BaseTransition] provides a reusable animation structure for creating animated widgets.
/// It defines the beginning and ending values of an animation and a child widget to apply
/// the animation to. This class is designed to be used within a [CustomAnimationBuilder],
/// which supplies the animation controller.
///
/// Subclasses must implement the [build] method and provide the visual
/// representation using the provided [animation].
///
/// ### Usage
/// Extend this class with a specific animation type (e.g., `double`, `Offset`) and override
/// the [build] method using the [animation] getter.
///
/// Example:
/// ```dart
/// class Fade extends BaseTransition<double> {
///   Fade({
///     required super.child,
///     required super.begin,
///     required super.end,
///   });
///
///   @override
///   Widget build() {
///     return FadeTransition(
///       opacity: animation,
///       child: child,
///     );
///   }
/// }
/// ```
abstract base class BaseTransition<T> {
  /// Creates a [BaseTransition] widget.
  ///
  /// [child] is the widget to be animated.
  /// [begin] is the starting value of the animation.
  /// [end] is the ending value of the animation.
  /// The [begin] and [end] values define the range of the animation.
  /// The [child] widget will be animated between these two values.
  /// The [BaseTransition] class is designed to be used with a [CustomAnimationBuilder]
  BaseTransition({
    required this.child,
    required this.begin,
    required this.end,
  });
  AnimationController? _controller;

  /// The starting value of the animation.
  /// This value is used to initialize the animation.
  final T begin;

  /// The ending value of the animation.
  final T end;

  /// The child widget to be animated.
  /// This widget will be animated using the animation defined by [begin] and [end].
  final Widget child;

  /// No need for a getter for the controller.
  /// The controller is set directly from the [CustomAnimationBuilder].
  /// This setter is used to set the animation controller.
  /// The [controller] parameter is the animation controller that will be used for the animation.
  /// This setter is called by the [CustomAnimationBuilder] to provide the animation controller.
  // ignore: avoid_setters_without_getters
  set controller(AnimationController controller) => _controller = controller;

  /// The animation object that drives the transition.
  /// This getter returns an [Animation] object that is driven by the animation controller.
  /// The animation is created using a [Tween] that interpolates between the [begin] and [end] values.
  @protected
  Animation<T> get animation {
    assert(_controller != null, 'Controller has not been set yet.');

    return _controller!.drive(tween);
  }

  /// The tween object that defines the range of the animation.
  /// This getter returns a [Tween] object that interpolates between the [begin] and [end] values.
  @protected
  Tween<T> get tween => Tween<T>(begin: begin, end: end);

  /// The build method is responsible for creating the widget using the animation.
  /// This method must be implemented by subclasses to define the visual representation
  /// of the transition.
  Widget build();
}
