import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/auth/data/models/auth_model.dart';
import 'package:roof_admin_panel/features/auth/presentation/providers/provider.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/form_section.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';

///
mixin SignInFormMixin on ConsumerState<SignInForm> {
  ///
  final TextEditingController emailController = TextEditingController();

  ///
  final TextEditingController passwordController = TextEditingController();

  ///

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  AuthModel get _createModel => AuthModel(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

  ///
  Future<void> signIn(GlobalKey<FormState> formKey) async {
    if (formKey.currentState?.validate() ?? false) {
      await ref
          .read(authViewModelProvider.notifier)
          .signInWithEmailAndPassword(_createModel)
          .showLoading(context: context);
    }
  }
}
