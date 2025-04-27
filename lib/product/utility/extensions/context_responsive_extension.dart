import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/screen_type.dart';

class Responsive {
  factory Responsive() => _instance;
  Responsive._internal();

  static final Responsive _instance = Responsive._internal();

  ScreenType _lastScreenType = ScreenType.mobile;
  ScreenType get lastScreenType => _lastScreenType;

  // T get

  bool didChange(ScreenType currentType) {
    if (_lastScreenType != currentType) {
      _lastScreenType = currentType;
      Log.warning("didChange: $_lastScreenType");

      return true;
    }
    return false;
  }
}

final c = StateProvider<ScreenType>((ref) {
  return ScreenType.mobile;
});

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
    // ProviderScope.containerOf(this).read(c(this).notifier).state = true;

    final newScreenType = getScreenType();
    bool didChange = false;
    // ProviderScope.containerOf(this).listen(
    //   c,
    //   (_, n) {
    //     if (n != newScreenType) {
    //       n = newScreenType;
    //       didChange = true;
    //       Responsive()._lastScreenType = n;
    //     }
    //   },
    //   fireImmediately: true,
    // );
    // if (didChange) {
    switch (newScreenType) {
      case ScreenType.mobile:
        // ProviderScope.containerOf(this).read(c.notifier).state =
        //     ScreenType.mobile;
        return mobile;

      case ScreenType.tablet:
        // ProviderScope.containerOf(this).read(c.notifier).state =
        //     ScreenType.tablet;

        return tablet ?? desktop;
      case ScreenType.desktop:
        // ProviderScope.containerOf(this).read(c.notifier).state =
        //     ScreenType.desktop;
        return desktop;
    }
    // }
    // return Responsive()._lastScreenType;
  }
}
