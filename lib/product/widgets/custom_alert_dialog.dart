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

class CustomAlertDialog<T> extends StatefulWidget {
  const CustomAlertDialog({
    super.key,
    this.content,
    this.title,
    this.actions,
  })  : showCloseButton = false,
        result = null;

  /// Shows a [CustomAlertDialog] with a close button on the top right corner.
  ///
  const CustomAlertDialog.withCloseIcon({
    super.key,
    this.content,
    this.title,
    this.actions,
    this.result,
  }) : showCloseButton = true;

  final T? result;
  final Widget? content;
  final Widget? title;
  final List<Widget>? actions;
  final bool showCloseButton;
  static bool _isShowing = false;

  static Future<T?> showAlertDialog<T>({
    required BuildContext context,
    required Widget content,
    Widget? title,
    List<Widget>? actions,
    bool forceOpen = false,
    bool barrierDismissible = false,
  }) async {
    if (!_isShowing || forceOpen) {
      _isShowing = true;
      return showDialog<T>(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => PopScope(
          canPop: barrierDismissible,
          child: content,
        ),
      );
    }
    return Future.value();
  }

  static void hideAlertDialog<T>(
    BuildContext context, {
    bool forceClose = false,
    T? result,
  }) {
    if (context.mounted && _isShowing) {
      if (!forceClose) {
        _isShowing = false;
      }
      context.pop(result);
    }
  }

  @override
  State<CustomAlertDialog<T>> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState<T> extends State<CustomAlertDialog<T>> {
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
                onPressed: () => CustomAlertDialog.hideAlertDialog<T>(
                  context,
                  result: widget.result,
                ),
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
