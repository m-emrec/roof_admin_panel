part of 'form_section.dart';

///
mixin SignInFormMixin on ConsumerState<_SignInForm> {
  @override
  void dispose() {
    FormUtils().passwordController.clear();
    super.dispose();
  }

  AuthModel get _createModel => AuthModel(
        email: FormUtils().emailController.text.trim(),
        password: FormUtils().passwordController.text,
      );

  ///
  Future<void> onTapSignIn(GlobalKey<FormState> formKey) async {
    if (formKey.currentState?.validate() ?? false) {
      await ref
          .read(authViewModelProvider.notifier)
          .signInWithEmailAndPassword(_createModel)
          .showLoading(context: context);
    }
  }
}
