import 'package:core/utils/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class DiscountDropdown extends StatelessWidget {
  const DiscountDropdown({
    required this.initialValue,
    required this.title,
    required this.controller,
    super.key,
  });
  final int initialValue;
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      child: CustomDropDownButton<String>(
        items: [
          ...List.generate(21, (index) => '${index * 5}%'),
        ],
        initialValue: '$initialValue%',
        onChanged: (val) {
          final value = int.parse(val!.toString().replaceAll('%', ''));
          controller.text = value.toString();
        },
      ),
    );
  }
}
