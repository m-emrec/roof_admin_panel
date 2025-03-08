import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

///
class EmailField extends StatelessWidget {
  ///
  const EmailField(this.controller, {super.key});

  ///
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      prefixIcon: const Icon(Icons.alternate_email_rounded),
      label: LocaleKeys.common_inputFields_email.tr(),
      validator: (value) => ValidatorMethods(text: value).validateMail,
    );
  }
}
