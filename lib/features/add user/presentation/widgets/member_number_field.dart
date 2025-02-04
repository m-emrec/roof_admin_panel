import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

class MemberNumberField extends StatelessWidget {
  final TextEditingController controller;
  const MemberNumberField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: CustomTextField(
        label: LocaleKeys.addMember_memberNumber.tr(),
        validator: (value) => ValidatorMethods(text: value).numberOnlyValidator,
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );
  }
}
