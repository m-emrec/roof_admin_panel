import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({required this.title, super.key, this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          context.textTheme.labelLarge,
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColors.primaryColor[50] ?? Colors.transparent,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
}

class AppTextButtonWithIcon extends StatelessWidget {
  const AppTextButtonWithIcon({
    required this.title,
    super.key,
    this.onPressed,
    this.icon,
  });
  final String title;
  final VoidCallback? onPressed;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          context.textTheme.labelLarge,
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColors.primaryColor[50] ?? Colors.transparent,
        ),
      ),
      icon: icon,
      onPressed: onPressed,
      label: Text(
        title,
      ),
    );
  }
}
