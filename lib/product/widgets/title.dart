import 'package:flutter/material.dart';
import 'package:roof_admin_panel/core/extensions/context_extension.dart';

class TitleWidget extends StatelessWidget {
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
