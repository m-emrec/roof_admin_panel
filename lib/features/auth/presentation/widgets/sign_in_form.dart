import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/auth/data/models/auth_model.dart';
import 'package:roof_admin_panel/features/auth/presentation/providers/provider.dart';
import 'package:roof_admin_panel/product/utility/constants/app_colors.dart';
import 'package:roof_admin_panel/product/utility/constants/app_paddings.dart';
import 'package:roof_admin_panel/product/utility/constants/spacing_sizes.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/buttons/buttons_import.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
import 'package:roof_admin_panel/product/widgets/password_field.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        color: AppColors.backgroundColor[60]?.withValues(alpha: 0.9),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Padding(
            padding: const AppPadding.horizontalxLSymmetric() +
                const AppPadding.verticalxLSymmetric(),
            child: SizedBox(
              width: 300,
              child: Column(
                spacing: SpacingSizes.large,
                children: [
                  CustomTextField(
                    validator: (value) =>
                        ValidatorMethods(text: _emailController.text)
                            .emptyField,
                    controller: _emailController,
                    label: LocaleKeys.auth_signin_email.tr(),
                  ),
                  PasswordField(
                    validator: (value) =>
                        ValidatorMethods(text: _emailController.text)
                            .emptyField,
                    passwordController: _passwordController,
                  ),
                  Row(
                    children: [
                      ResponsiveElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(authViewModelProvider)
                                .signInWithEmailAndPassword(
                                  AuthModel(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        },
                        child: Text(
                          LocaleKeys.auth_signin_pageTitle.tr(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
