import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:roof_admin_panel/product/utility/constants/app_paddings.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title:
          ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const AppPadding.verticalLSymmetric() +
              const AppPadding.horizontalLSymmetric(),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.icons.roofLogo.path,
                ),
                fit: BoxFit.contain,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SignInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
