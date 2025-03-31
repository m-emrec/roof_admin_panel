import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/screen_type.dart';

///
extension ContextResponsiveExtension on BuildContext {
  /// Returns the current [ScreenType] based on the screen width.
  ScreenType getScreenType() {
    final width = MediaQuery.of(this).size.width;
    if (width < ScreenType.mobile.upperBreakpoint) {
      return ScreenType.mobile;
    } else if (width < ScreenType.tablet.upperBreakpoint) {
      return ScreenType.tablet;
    }
    return ScreenType.desktop;
  }

  /// Returns a value based on the current screen size.
  ///
  /// This class allows you to define different values for different device types
  /// (mobile, tablet, desktop). If the `tablet` value is not provided, the `desktop`
  /// value will be used by default on tablet screens.
  ///
  /// Example usage:
  /// ```dart
  /// final crossAxisCount = context.responsiveSelector<int>(
  /// mobile: 1,
  /// desktop: 2,
  /// tablet: 1
  /// );
  /// ```
  T responsiveSelector<T>({
    required T mobile,
    required T desktop,
    T? tablet,
  }) {
    switch (getScreenType()) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet ?? desktop;
      case ScreenType.desktop:
        return desktop;
    }
  }
}
