import 'package:flutter/material.dart';

/// This extension written on [Widget] class
///
/// Purpose of this extension is to make the widget selectable
///
/// It wraps the given widget with [SelectionArea] widget
extension MakeSelectableExtension on Widget {
  /// This method is used to wrap the widget with [SelectionArea] widget
  ///
  /// to make the content of the widget selectable
  Widget makeSelectable() => SelectionArea(
        child: this,
      );
}
