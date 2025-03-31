import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

/// Position of the dialog
///
/// [rightSide] - Dialog will be displayed on the right side of the screen
/// [center] - Dialog will be displayed in the center of the screen
enum DialogPosition {
  /// Dialog will be displayed on the right side of the screen
  rightSide,

  /// Dialog will be displayed in the center of the screen
  center,
}

class CustomAlertDialog extends StatefulWidget {
  CustomAlertDialog.withCloseIcon({
    super.key,
    this.content,
    this.title,
    this.actions,
  }) : showCloseButton = true;
  const CustomAlertDialog({
    super.key,
    this.content,
    this.title,
    this.actions,
  }) : showCloseButton = false;

  final Widget? content;
  final Widget? title;
  final List<Widget>? actions;
  final bool showCloseButton;
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
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      actionsAlignment: MainAxisAlignment.end,
      iconPadding: const AppPadding.horizontalxxSSymmetric(),
      icon: widget.showCloseButton
          ? Align(
              alignment: Alignment.topRight,
              child: CloseButton(
                color: AppColors.accentError[70],
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.transparent,
                  ),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.zero,
                  ),
                ),
              ),
            )
          : null,
      actionsPadding:
          (widget.actions?.isEmpty ?? true) ? EdgeInsets.zero : null,
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
