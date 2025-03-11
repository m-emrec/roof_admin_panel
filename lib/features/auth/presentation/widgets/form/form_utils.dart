part of 'form_section.dart';

/// This class contains the [TextEditingController]s, [PageController]
/// and [GlobalKey<FormState>] that are used in the [FormSection] widget.
///
/// ??? Why I use this class?
///
/// I use this class to not throw the controllers and formKey widget to widget.
class _FormUtils {
  static late final GlobalKey<FormState> formKey;
  static late final PageController pageController;
  static late final TextEditingController emailController;
  static late final TextEditingController passwordController;
  static const _pageAnimationDuration = Duration(milliseconds: 500);
  static const _pageAnimationCurve = Curves.ease;

  static void init() {
    formKey = GlobalKey<FormState>();
    pageController = PageController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  static void dispose() {
    pageController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  static void goToForgotPassword() {
    pageController.nextPage(
      duration: _pageAnimationDuration,
      curve: _pageAnimationCurve,
    );
  }

  static void goToSignIn() {
    pageController.previousPage(
      duration: _pageAnimationDuration,
      curve: _pageAnimationCurve,
    );
  }
}
