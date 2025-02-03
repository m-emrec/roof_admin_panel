import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A widget that displays a section title.
class SectionTitle extends StatelessWidget {
  /// Constructor for the section title.
  const SectionTitle(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleMedium,
    );
  }
}
