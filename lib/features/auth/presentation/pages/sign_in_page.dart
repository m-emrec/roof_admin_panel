import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/animated_roof_logo.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/sign_in_form.dart';

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
        spacing: SpacingSizes.large,
        children: [
          const Expanded(
            child: AnimatedRoofLogo(),
          ),
          Expanded(
            child: ColoredBox(
              color: AppColors.backgroundColor,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SignInForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
