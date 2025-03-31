import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/screen_type.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';

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
    switch (context.getScreenType()) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet ?? desktop;
      case ScreenType.desktop:
        return desktop;
    }
  }
}
