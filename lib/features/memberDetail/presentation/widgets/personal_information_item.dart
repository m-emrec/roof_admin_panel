import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class PersonalInformationItem extends StatelessWidget {
  const PersonalInformationItem({super.key, required this.label, this.title});
  final List<Widget> label;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Section(
      title: title ?? "",
      child: Wrap(
        spacing: SpacingSizes.small,
        runSpacing: SpacingSizes.small,
        children: label
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
