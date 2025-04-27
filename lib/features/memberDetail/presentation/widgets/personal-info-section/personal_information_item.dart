import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

///
class PersonalInformationItem extends StatelessWidget {
  ///
  const PersonalInformationItem({
    required this.children,
    required this.title,
    super.key,
  });

  /// This widget will be wrapped in a [Chip] widget
  /// and will be displayed in a [Wrap] widget
  /// with a [Section] widget as a parent.
  final List<Widget> children;

  /// Title of the section
  ///
  /// It is the title of the [Section] widget.
  final String title;
  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      child: Wrap(
        spacing: SpacingSizes.small,
        runSpacing: SpacingSizes.small,
        children: children
            .map(
              (e) => Chip(
                label: e,
                color: WidgetStatePropertyAll(
                  AppColors.backgroundColor,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
