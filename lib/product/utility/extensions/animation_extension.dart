import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/custom_animation_builder.dart';
import 'package:roof_admin_panel/product/widgets/transitions/custom_fade_transition.dart';
import 'package:roof_admin_panel/product/widgets/transitions/custom_scale_transition.dart';
import 'package:roof_admin_panel/product/widgets/transitions/custom_slide_transition.dart';

/// A set of extension methods for the [Widget] class to add animation capabilities.
/// These methods allow you to easily apply animation effect to any widget.
///
/// ### Example:
/// ```dart
///CircleAvatar(
///   child: Text(
// /    "Example",
///   ),
/// ).fadeAnimation()
///
/// ```
extension AnimationExtension on Widget {
  /// Applies a fade animation to the widget.
  /// The animation starts from the specified [begin] opacity and ends at the specified [end] opacity.
  /// The [duration] parameter controls how long the animation lasts.
  /// The default values are:
  /// - [begin]: 0 (completely transparent)
  /// - [end]: 1 (completely opaque)
  /// - [duration]: 500 milliseconds
  /// This method uses the [CustomFadeTransition] to create the fade effect.
  Widget fadeAnimation({
    double begin = 0,
    double end = 1,
    Duration duration = const Duration(milliseconds: 500),
  }) =>
      CustomAnimationBuilder(
        duration: duration,
        transition: CustomFadeTransition(
          child: this,
          begin: begin,
          end: end,
        ),
      );

  /// Applies a slide animation to the widget.
  /// The animation starts from the specified [begin] offset and ends at the specified [end] offset.
  /// The [duration] parameter controls how long the animation lasts.
  /// The default values are:
  /// - [begin]: Offset(0, 0.5) (halfway down the screen)
  /// - [end]: Offset.zero (original position)
  /// - [duration]: 500 milliseconds
  /// This method uses the [CustomSlideTransition] to create the slide effect.
  Widget slideAnimation({
    Offset begin = const Offset(0, 0.5),
    Offset end = Offset.zero,
    Duration duration = const Duration(milliseconds: 500),
  }) =>
      CustomAnimationBuilder(
        duration: duration,
        transition: CustomSlideTransition(
          child: this,
          begin: begin,
          end: end,
        ),
      );

  /// Applies a slide animation to the widget along the X-axis.
  Widget slideAnimationX({
    double begin = 0,
    double end = 0,
    Duration duration = const Duration(milliseconds: 500),
  }) =>
      slideAnimation(
        begin: Offset(begin, 0),
        end: Offset(end, 0),
        duration: duration,
      );

  /// Applies a scale animation to the widget.
  /// The animation starts from the specified [begin] scale and ends at the specified [end] scale.
  /// The [duration] parameter controls how long the animation lasts.
  /// The default values are:
  /// - [begin]: 0 (completely scaled down)
  /// - [end]: 1 (original size)
  /// - [duration]: 500 milliseconds
  /// This method uses the [CustomScaleTransition] to create the scale effect.
  Widget scaleAnimation({
    double begin = 0,
    double end = 1,
    Duration duration = const Duration(milliseconds: 500),
    Alignment alignment = Alignment.center,
  }) =>
      CustomAnimationBuilder(
        duration: duration,
        transition: CustomScaleTransition(
          child: this,
          begin: begin,
          end: end,
          alignment: alignment,
        ),
      );
}
