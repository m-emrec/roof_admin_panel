import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/core/utils/widgets/custom_drop_down_button.dart';
import 'package:roof_admin_panel/product/utility/constants/constant_values.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    required this.controller,
    required this.phoneCodeController,
    super.key,
  });
  final TextEditingController controller;
  final TextEditingController phoneCodeController;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: (_) => ValidatorMethods(text: controller.text).validatePhone,
      controller: controller,
      prefixIcon: CustomDropDownButton(
        items: ConstantValues.phoneCodes.entries.map((e) {
          return "${e.key} ${e.value}";
        }).toList(),
        initialValue:
            "${context.locale.countryCode} ${ConstantValues.phoneCodes[context.locale.countryCode]}",
        onChanged: (value) {
          phoneCodeController.text = value.split(" ")[1].toString();
        },
      ),
      label: LocaleKeys.addMember_phoneNumber.tr(),
    );
  }
}
