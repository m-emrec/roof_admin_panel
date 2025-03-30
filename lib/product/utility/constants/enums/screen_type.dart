/// This enum contains the screen types such as mobile, tablet and desktop.
///
/// And it holds the lower and upper bounds of the screen sizes.
enum ScreenType {
  ///
  /// The mobile screen type is used for screens smaller than 600 pixels.
  mobile(0, 599),

  ///
  /// The tablet screen type is used for screens between 600 and 1024 pixels.
  tablet(600, 1024),

  ///
  /// The desktop screen type is used for screens larger than 1024 pixels.
  desktop(1025, double.infinity),
  ;

  const ScreenType(this.lowerBreakpoint, this.upperBreakpoint);

  ///
  final double lowerBreakpoint;

  /// The upper breakpoint of the screen type.
  final double upperBreakpoint;
}
