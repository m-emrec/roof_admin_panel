import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/core/utils/widgets/custom_drop_down_button.dart';
import 'package:roof_admin_panel/product/utility/constants/constant_values.dart';
import 'package:roof_admin_panel/product/utility/logger/logger.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  const PhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Log.debug(ConstantValues.phoneCodes.map((e) => e.values).toList());
    return CustomTextField(
      controller: controller,
      prefixIcon: CustomDropDownButton(
        items: ConstantValues.phoneCodes.map((e) => e.values).toList(),
        initialValue: ("AL", "+355"),
        onChanged: (value) {},
      ),
      label: LocaleKeys.membersView_addUserDialog_phoneNumber.tr(),
    );
  }
}
