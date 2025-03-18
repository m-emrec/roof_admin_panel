import 'package:core/utils/logger/logger.dart';
import 'package:flutter/material.dart';

/// This widget used to return different widgets based on the screen size.
///
/// It takes three parameters:
/// - [mobile] - Widget to display on mobile screen.
/// - [tablet] - Widget to display on tablet screen.
/// - [desktop] - Widget to display on desktop screen.
///
///*By default, if the tablet widget is not provided, it will display the desktop widget on the tablet screen.
///*If the tablet widget is provided, it will display the tablet widget on the tablet screen.
///
/// Example:
/// ```dart
//  ResponsiveBuilder(
//       desktop: Text(
//         title,
//         style: context.textTheme.headlineLarge,
//       ),
//       tablet: Text(
//         title,
//         style: context.textTheme.headlineMedium,
//       ),
//       mobile: Text(
//         title,
//         style: context.textTheme.headlineMedium,
//       ),
//     );
/// ```
///
class ResponsiveBuilder extends StatelessWidget {
  /// This widget used to return different widgets based on the screen size.
  ///
  /// It takes three parameters:
  /// - [mobile] - Widget to display on mobile screen.
  /// - [tablet] - Widget to display on tablet screen.
  /// - [desktop] - Widget to display on desktop screen.
  ///
  ///*By default, if the tablet widget is not provided, it will display the desktop widget on the tablet screen.
  ///*If the tablet widget is provided, it will display the tablet widget on the tablet screen.
  ///
  /// Example:
  /// ```dart
  ///  ResponsiveBuilder(
  ///       desktop: Text(
  ///         title,
  ///         style: context.textTheme.headlineLarge,
  ///       ),
  ///       tablet: Text(
  ///         title,
  ///         style: context.textTheme.headlineMedium,
  ///       ),
  ///       mobile: Text(
  ///         title,
  ///         style: context.textTheme.headlineMedium,
  ///       ),
  ///     );
  /// ```
  ///
  const ResponsiveBuilder({
    required this.mobile,
    required this.desktop,
    this.tablet,
    super.key,
  });

  /// Widget to display on mobile screen.
  final Widget mobile;

  /// Widget to display on tablet screen.
  /// It can be null, if it is null it will display the desktop widget on the tablet screen.
  final Widget? tablet;

  /// Widget to display on desktop screen.
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    switch (_DeviceScreenTypeGetter(MediaQuery.of(context).size.width)
        .deviceScreenType) {
      case _DeviceScreenType.mobile:
        return mobile;
      case _DeviceScreenType.tablet:
        return tablet ?? desktop;
      case _DeviceScreenType.desktop:
        return desktop;
    }
  }
}

class _DeviceScreenTypeGetter {
  const _DeviceScreenTypeGetter(this._width);
  final double _width;

  _DeviceScreenType get deviceScreenType {
    if (_width < _DeviceScreenType.mobile.upperBound) {
      return _DeviceScreenType.mobile;
    } else if (_width < _DeviceScreenType.tablet.upperBound) {
      return _DeviceScreenType.tablet;
    }
    return _DeviceScreenType.desktop;
  }
}

enum _DeviceScreenType {
  mobile(0, 599),
  tablet(600, 1024),
  desktop(1025, double.infinity),
  ;

  const _DeviceScreenType(this.lowerBound, this.upperBound);
  final double lowerBound;
  final double upperBound;
}
