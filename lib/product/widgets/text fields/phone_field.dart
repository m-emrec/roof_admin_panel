import 'package:core/utils/constants/constant_values.dart';
import 'package:core/utils/widgets/custom_drop_down_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

/// This is a text field for phone number
///
/// It takes :
///
/// 1. [controller] : The controller to control the text field
///
/// 2. [phoneCodeController] : The controller to control the phone code
///
///
class PhoneField extends StatelessWidget {
  /// This is a text field for phone number
  ///
  /// It takes :
  ///
  /// 1. [controller] : The controller to control the text field
  ///
  /// 2. [phoneCodeController] : The controller to control the phone code
  ///
  ///
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
        onChanged: (value) =>
            phoneCodeController.text = value.split(' ')[1].toString(),
      ),
      label: LocaleKeys.addMember_phoneNumber.tr(),
    );
  }
}
