import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';

/// This is the title widget.
///
/// ? **Use This Widget to Display a Title**
///
/// It displays a [Text] widget with [headlineLarge] style.
class TitleWidget extends StatelessWidget {
  /// This is the title widget.
  ///
  /// If the view is desktop It displays a [Text] widget with [headlineLarge] style.
  ///
  /// If the view is tablet It displays a [Text] widget with [headlineMedium] style.
  ///
  /// If the view is mobile It displays a [Text] widget with [headlineMedium] style.
  ///
  ///
  const TitleWidget({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return context.responsiveSelector(
      desktop: Text(
        title,
        style: context.textTheme.headlineSmall,
      ),
      tablet: Text(
        title,
        style: context.textTheme.headlineSmall,
      ),
      mobile: Text(
        title,
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
