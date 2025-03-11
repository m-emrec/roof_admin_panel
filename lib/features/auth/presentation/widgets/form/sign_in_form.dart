part of "form_section.dart";

class _SignInForm extends ConsumerStatefulWidget {
  const _SignInForm();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninFormState();
}

class _SigninFormState extends ConsumerState<_SignInForm> with SignInFormMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: SpacingSizes.large,
      children: [
        EmailField(_FormUtils.emailController),
        PasswordField(
          signIn: () => onTapSignIn(_FormUtils.formKey),
          validator: (value) =>
              ValidatorMethods(text: _FormUtils.passwordController.text)
                  .emptyField,
          passwordController: _FormUtils.passwordController,
        ),
        // Sign in button
        Row(
          children: [
            ResponsiveElevatedButton(
              onPressed: () => onTapSignIn(_FormUtils.formKey),
              child: Text(
                LocaleKeys.auth_signin_pageTitle.tr(),
              ),
            ),
          ],
        ),

        /// Forgot password button
        TextButton(
          onPressed: _FormUtils.goToForgotPassword,
          child: Text(LocaleKeys.auth_signin_forgotPassword_pageTitle.tr()),
        ),
      ],
    );
  }
}
