import 'package:core/core.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

enum DialogPosition { rightSide, center }

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    super.key,
    this.content,
    this.title,
    this.actions,
    this.dialogPosition = DialogPosition.center,
  });
  final Widget? content;
  final Widget? title;
  final List<Widget>? actions;
  final DialogPosition dialogPosition;
  static bool _isShowing = false;

  static Future<void> showAlertDialog({
    required BuildContext context,
    required Widget content,
    Widget? title,
    List<Widget>? actions,
    bool barrierDismissible = false,
  }) async {
    if (!_isShowing) {
      _isShowing = true;
      await showDialog<Widget>(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) =>
            PopScope(canPop: barrierDismissible, child: content
                //  CustomAlertDialog(
                //   title: title,
                //   content: content,
                //   actions: actions,
                // ),
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
    switch (widget.dialogPosition) {
      case DialogPosition.rightSide:
        return _RightSideDialog.buildSideDialog(
          context: context,
          content: widget.content!,
          title: widget.title,
          actions: widget.actions,
        );

      case DialogPosition.center:
        return _CenterAlertDialog.buildAlertDialog(
          context: context,
          content: widget.content!,
          title: widget.title,
          actions: widget.actions,
        );
    }
  }
}

class _RightSideDialog {
  static Widget buildSideDialog({
    required BuildContext context,
    required Widget content,
    Widget? title,
    List<Widget>? actions,
  }) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.mediumOnly(
          topLeft: true,
          bottomLeft: true,
        ),
      ),
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.topRight,
      backgroundColor: AppColors.backgroundColor,
      actionsAlignment: MainAxisAlignment.end,
      actions: actions ??
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
      title: title,
      content: SizedBox(
        height: context.dynamicHeight(1),
        width: context.dynamicWidth(0.5),
        child: content,
      ),
    );
  }
}

class _CenterAlertDialog {
  static Widget buildAlertDialog({
    required BuildContext context,
    required Widget content,
    Widget? title,
    List<Widget>? actions,
  }) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      actionsAlignment: MainAxisAlignment.end,
      actions: actions ??
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
      title: title,
      content: content,
    );
  }
}
