import 'package:flutter/material.dart';

extension ShowClickMouseCursorOnWidgetExtension on Widget {
  /// This extension will show the click mouse cursor on the widget.
  Widget showClickMouseCursorOnWidget() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: this,
    );
  }
}
