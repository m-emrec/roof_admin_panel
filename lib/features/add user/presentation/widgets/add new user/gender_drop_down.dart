import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/core/constants/enums/gender.dart';
import 'package:roof_admin_panel/core/utils/widgets/custom_drop_down_button.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class GenderDropDown extends StatelessWidget {
  final TextEditingController controller;
  const GenderDropDown({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Section(
      required: true,
      title: LocaleKeys.addMember_gender.tr(),
      child: CustomDropDownButton(
        items: Gender.values
            .map(
              (e) => e.localizedText,
            )
            .toList(),
        initialValue: controller.text,
        onChanged: (value) {
          controller.text = value.toString();
        },
      ),
    );
  }
}
