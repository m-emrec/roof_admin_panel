import 'package:core/utils/logger/logger.dart';
import 'package:flutter/material.dart';

/// Utility class for managing form-related controllers and navigation.
///
/// This class holds the [TextEditingController]s, [PageController],
/// and [GlobalKey<FormState>] used in the [FormSection] widget.
///
/// ### Why use this class?
/// Instead of passing controllers and form keys to multiple widgets,
/// this class centralizes them, improving maintainability and avoiding
/// unnecessary widget rebuilds.
///
/// It also provides helper methods for navigating between form pages.
class FormUtils {
  factory FormUtils() => _instance ??= FormUtils._internal(
        TextEditingController(),
        TextEditingController(),
      );

  FormUtils._internal(this.emailController, this.passwordController);

  static FormUtils? _instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController pageController = PageController();
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final _pageAnimationDuration = const Duration(milliseconds: 500);
  final _pageAnimationCurve = Curves.ease;

  void dispose() {
    Log.debug('Disposing form utils');
    pageController.dispose();
    emailController.dispose();
    passwordController.dispose();

    _instance = null;
  }

  void goToForgotPassword() {
    pageController.nextPage(
      duration: _pageAnimationDuration,
      curve: _pageAnimationCurve,
    );
  }

  void goToSignIn() {
    pageController.previousPage(
      duration: _pageAnimationDuration,
      curve: _pageAnimationCurve,
    );
  }
}
