import 'package:core/utils/constants/enums/gender.dart';
import 'package:core/utils/widgets/custom_drop_down_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

///  GenderDropDown is a custom widget that is used to select the
/// gender of the user.
class GenderDropDown extends StatelessWidget {
  ///  GenderDropDown is a custom widget that is used to select the
  /// gender of the user.
  const GenderDropDown({required this.controller, super.key});
  final TextEditingController controller;

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
        onChanged: (value) => controller.text = value.toString(),
      ),
    );
  }
}
