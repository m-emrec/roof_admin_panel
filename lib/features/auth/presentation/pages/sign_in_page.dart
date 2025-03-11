import 'package:core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/animated%20roof%20logo/animated_roof_logo.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/form/form_section.dart';

///
/// SignIn page
class SignIn extends StatefulWidget {
  /// SignIn page
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor[60] ?? Colors.white,
      body: Row(
        children: [
          const Expanded(
            child: AnimatedRoofLogo(),
          ),
          Expanded(
            child: ColoredBox(
              color: AppColors.backgroundColor[80] ?? Colors.white,
              child: const Center(child: FormSection()),
            ),
          ),
        ],
      ),
    );
  }
}
