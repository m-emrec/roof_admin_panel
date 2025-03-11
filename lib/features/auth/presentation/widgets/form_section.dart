import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/auth/presentation/providers/provider.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/sign_in_form_mixin.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/buttons/buttons_import.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/email_field.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/password_field.dart';

/// SignInForm widget
///
/// This widget is used to display the sign in form.
///
/// It has a form with two fields: email and password.
///
/// And a button to sign in.
class FormSection extends ConsumerStatefulWidget {
  /// SignInForm widget
  ///
  /// This widget is used to display the sign in form.
  ///
  /// It has a form with two fields: email and password.
  ///
  /// And a button to sign in.
  const FormSection({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormSectionState();
}

class _FormSectionState extends ConsumerState<FormSection> {
  final formKey = GlobalKey<FormState>();
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: context.dynamicWidth(0.4),
        height: context.dynamicHeight(1),
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SignInForm(formKey, pageController),
            ForgotPasswordForm(
                pageController: pageController, formKey: formKey),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends ConsumerWidget {
  ForgotPasswordForm({
    super.key,
    required this.pageController,
    required this.formKey,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: SpacingSizes.large,
      children: [
        TextButton.icon(
            label: Text(LocaleKeys.common_back.tr()),
            onPressed: () => pageController.previousPage(
                duration: Duration(milliseconds: 500), curve: Curves.ease),
            icon: Icon(Icons.arrow_back)),
        EmailField(emailController),
        Row(
          children: [
            ResponsiveElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  ref
                      .read(authViewModelProvider.notifier)
                      .forgotPassword(emailController.text.trim())
                      .showLoading(context: context);
                }
              },
              child: Text(
                LocaleKeys.auth_signin_forgotPassword_sendResetLink.tr(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm(this.formKey, this.pageController);
  final GlobalKey<FormState> formKey;
  final PageController pageController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninFormState();
}

class _SigninFormState extends ConsumerState<SignInForm> with SignInFormMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: SpacingSizes.large,
      children: [
        EmailField(emailController),
        PasswordField(
          signIn: () => signIn(widget.formKey),
          validator: (value) =>
              ValidatorMethods(text: passwordController.text).emptyField,
          passwordController: passwordController,
        ),
        Row(
          children: [
            ResponsiveElevatedButton(
              onPressed: () => signIn(widget.formKey),
              child: Text(
                LocaleKeys.auth_signin_pageTitle.tr(),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () => widget.pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
          child: Text(LocaleKeys.auth_signin_forgotPassword_pageTitle.tr()),
        ),
      ],
    );
  }
}
