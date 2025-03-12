part of 'form_section.dart';

class _ForgotPasswordForm extends ConsumerWidget {
  const _ForgotPasswordForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: SpacingSizes.large,
      children: [
        TextButton.icon(
          label: Text(LocaleKeys.common_back.tr()),
          onPressed: FormUtils().goToSignIn,
          icon: const Icon(Icons.arrow_back),
        ),
        EmailField(FormUtils().emailController),
        Row(
          children: [
            ResponsiveElevatedButton(
              onPressed: () => _onTapForgotPassword(context, ref),
              child: Text(
                LocaleKeys.auth_signin_forgotPassword_sendResetLink.tr(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _onTapForgotPassword(BuildContext context, WidgetRef ref) async {
    if (FormUtils().formKey.currentState?.validate() ?? false) {
      await ref
          .read(authViewModelProvider.notifier)
          .forgotPassword(FormUtils().emailController.text.trim())
          .showLoading(context: context)
          .then((dataState) {
        if (dataState is DataSuccess) FormUtils().goToSignIn();
      });
    }
  }
}
