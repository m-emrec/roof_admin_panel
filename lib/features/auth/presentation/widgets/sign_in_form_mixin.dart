import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/auth/data/models/auth_model.dart';
import 'package:roof_admin_panel/features/auth/presentation/providers/provider.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';

///
mixin SignInFormMixin on ConsumerState<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  ///
  Future<void> signIn() async {
    if (formKey.currentState?.validate() ?? false) {
      final authModel = AuthModel(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      await ref
          .read(authViewModelProvider.notifier)
          .signInWithEmailAndPassword(authModel)
          .showLoading(context: context);
    }
  }
}
