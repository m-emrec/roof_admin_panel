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
        EmailField(FormUtils().emailController),
        PasswordField(
          signIn: () => onTapSignIn(FormUtils().formKey),
          validator: (value) =>
              ValidatorMethods(text: FormUtils().passwordController.text)
                  .emptyField,
          passwordController: FormUtils().passwordController,
        ),
        // Sign in button
        Row(
          children: [
            ResponsiveElevatedButton(
              onPressed: () => onTapSignIn(FormUtils().formKey),
              child: Text(
                LocaleKeys.auth_signin_pageTitle.tr(),
              ),
            ),
          ],
        ),

        /// Forgot password button
        TextButton(
          onPressed: FormUtils().goToForgotPassword,
          child: Text(LocaleKeys.auth_signin_forgotPassword_pageTitle.tr()),
        ),
      ],
    );
  }
}
