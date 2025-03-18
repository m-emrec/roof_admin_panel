import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.validator,
    this.label,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;
  final String? Function(String?)? validator;
  final TextEditingController _passwordController;
  final String? label;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _showPassword = false;
  late final FocusNode _focusNode;
  late String _label;
  @override
  void initState() {
    _label = widget.label ?? LocaleKeys.auth_signin_password.tr();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      focusNode: _focusNode,
      unfocusOnTapOutside: true,
      prefixIcon: Icon(_showPassword ? Icons.lock_open_rounded : Icons.lock),
      validator: widget.validator,
      obscured: !_showPassword,
      controller: widget._passwordController,
      label: _label,
      autofillHints: const [AutofillHints.password],
      suffix: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Icon(
            _showPassword
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            color: AppColors.secondaryColor.withValues(alpha: 0.3),
            size: 16,
          ),
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
      ),
    );
  }
}
