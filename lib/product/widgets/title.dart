import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// This is the title widget.
///
/// ? **Use This Widget to Display a Title**
///
/// It displays a [Text] widget with [headlineLarge] style.
class TitleWidget extends StatelessWidget {
  /// This is the title widget.
  ///
  /// It displays a [Text] widget with [headlineLarge] style.
  const TitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.headlineLarge,
    );
  }
}
