import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

/// This is a text field for member number
///
/// It takes :
///
/// 1. [controller] : The controller to control the text field
class MemberNumberField extends StatelessWidget {
  const MemberNumberField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return SizedBox(
      // I gave this width arbitrarily . It was looking good in the UI so I kept it
      width: 250,
      child: CustomTextField(
        focusNode: focusNode,
        unfocusOnTapOutside: true,
        autovalidateMode: AutovalidateMode.disabled,
        label: LocaleKeys.addMember_memberNumber.tr(),
        validator: (value) => ValidatorMethods(text: value).numberOnlyValidator,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
