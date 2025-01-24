import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.validator,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;
  final String? Function(String?)? validator;
  final TextEditingController _passwordController;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          validator: widget.validator,
          obscured: !_showPassword,
          controller: widget._passwordController,
          label: LocaleKeys.auth_signin_password.tr(),
        ),
        CheckboxListTile(
          title: Text(LocaleKeys.auth_signin_showPassword.tr()),
          value: _showPassword,
          onChanged: (value) {
            setState(() {
              _showPassword = value!;
            });
          },
        ),
      ],
    );
  }
}
