import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension FormSubmitOnKeyEnterExtension on Widget {
  Widget submitOnEnter({
    Key? key,
    FocusNode? focusNode,
    VoidCallback? onKeyEnter,
  }) {
    focusNode ??= FocusNode();
    return KeyboardListener(
      focusNode: focusNode,
      child: this,
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.enter) {
          onKeyEnter?.call();
        }
      },
    );
  }
}
