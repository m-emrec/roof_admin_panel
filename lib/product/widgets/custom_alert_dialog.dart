import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/core/extensions/context_extension.dart';
import 'package:roof_admin_panel/product/utility/constants/app_colors.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    super.key,
    this.content,
    this.title,
    this.actions,
  });
  final Widget? content;
  final Widget? title;
  final List<Widget>? actions;
  static bool _isShowing = false;

  static Future<void> showAlertDialog({
    required BuildContext context,
    Widget? content,
    Widget? title,
    List<Widget>? actions,
    bool barrierDismissible = false,
  }) async {
    if (!_isShowing) {
      _isShowing = true;
      await showDialog<Widget>(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => PopScope(
          canPop: barrierDismissible,
          child: CustomAlertDialog(
            title: title,
            content: content,
            actions: actions,
          ),
        ),
      );
    }
  }

  static void hideAlertDialog(BuildContext context) {
    if (context.mounted && _isShowing) {
      _isShowing = false;
      context.pop();
    }
  }

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  void dispose() {
    CustomAlertDialog._isShowing = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor: AppColors.backgroundColor,
      actionsAlignment: MainAxisAlignment.end,
      actions: widget.actions ??
          [
            TextButton(
              onPressed: () {
                CustomAlertDialog.hideAlertDialog(context);
              },
              child: Text(
                LocaleKeys.common_close.tr(),
                style: context.textTheme.labelMedium?.copyWith(
                  color: AppColors.accentError[60],
                ),
              ),
            ),
          ],
      title: widget.title,
      content: widget.content,
    );
  }
}
