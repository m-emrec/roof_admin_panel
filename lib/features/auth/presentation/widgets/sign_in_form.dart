import 'dart:ui';

import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/sign_in_form_mixin.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/buttons/buttons_import.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/password_field.dart';

/// SignInForm widget
///
/// This widget is used to display the sign in form.
///
/// It has a form with two fields: email and password.
///
/// And a button to sign in.
class SignInForm extends ConsumerStatefulWidget {
  /// SignInForm widget
  ///
  /// This widget is used to display the sign in form.
  ///
  /// It has a form with two fields: email and password.
  ///
  /// And a button to sign in.
  const SignInForm({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> with SignInFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: context.dynamicWidth(0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: SpacingSizes.large,
          children: [
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  ValidatorMethods(text: emailController.text).emptyField,
              controller: emailController,
              label: LocaleKeys.auth_signin_email.tr(),
            ),
            PasswordField(
              signIn: signIn,
              validator: (value) =>
                  ValidatorMethods(text: passwordController.text).emptyField,
              passwordController: passwordController,
            ),
            Row(
              children: [
                ResponsiveElevatedButton(
                  onPressed: signIn,
                  child: Text(
                    LocaleKeys.auth_signin_pageTitle.tr(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
