import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomRightSideDialog extends StatefulWidget {
  const CustomRightSideDialog({
    this.content,
    super.key,
    this.title,
    this.actions = const [],
  });

  final Widget? content;
  final Widget? title;
  final List<Widget> actions;
  static bool _isShowing = false;

  /// This method is used to show the dialog
  static Future<void> show({
    required BuildContext context,
    required Widget content,
    bool barrierDismissible = false,
  }) async {
    if (!_isShowing) {
      _isShowing = true;
      await showDialog<Widget>(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => PopScope(
          canPop: barrierDismissible,
          child: content,
        ),
      );
    }
  }

  /// This method is used to hide the dialog
  static void hide(BuildContext context) {
    if (context.mounted && _isShowing) {
      _isShowing = false;
      context.pop();
    }
  }

  @override
  State<CustomRightSideDialog> createState() => _CustomRightSideDialogState();
}

class _CustomRightSideDialogState extends State<CustomRightSideDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      upperBound: 0.5,
    )..forward();

    super.initState();
  }

  @override
  void dispose() {
    CustomRightSideDialog._isShowing = false;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          child: AlertDialog(
            backgroundColor: AppColors.backgroundColor,
            alignment: Alignment.centerRight,
            insetPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: AppBorderRadius.mediumOnly(
                topLeft: true,
                bottomLeft: true,
              ),
            ),
            actions: widget.actions,
            title: widget.title,
            content: SizedBox(
              height: context.dynamicHeight(1),
              width: context.dynamicWidth(_controller.value),
              child: widget.content,
            ),
          ),
        );
      },
    );
  }
}
