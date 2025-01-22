import 'package:flutter/material.dart';

/// A custom theme extension for the AddProfilePicture widget in a Flutter application.
class AddProfilePictureTheme extends ThemeExtension<AddProfilePictureTheme> {
  /// A custom theme extension for the AddProfilePicture widget in a Flutter application.
  AddProfilePictureTheme({
    this.addProfilePictureLabelStyle,
    this.circleBackgroundColor,
    this.shadows,
    this.circleSize,
  });
  final TextStyle? addProfilePictureLabelStyle;
  final Color? circleBackgroundColor;
  final List<BoxShadow>? shadows;
  final Size? circleSize;
  @override
  ThemeExtension<AddProfilePictureTheme> copyWith({
    TextStyle? addProfilePictureLabelStyle,
    Color? circleBackgroundColor,
    List<BoxShadow>? shadows,
    Size? circleSize,
  }) {
    return AddProfilePictureTheme(
      addProfilePictureLabelStyle:
          addProfilePictureLabelStyle ?? this.addProfilePictureLabelStyle,
      circleBackgroundColor:
          circleBackgroundColor ?? this.circleBackgroundColor,
      shadows: shadows ?? this.shadows,
      circleSize: circleSize ?? this.circleSize,
    );
  }

  @override
  ThemeExtension<AddProfilePictureTheme> lerp(
    covariant ThemeExtension<AddProfilePictureTheme>? other,
    double t,
  ) {
    if (other is! AddProfilePictureTheme) return this;

    return AddProfilePictureTheme(
      addProfilePictureLabelStyle: TextStyle.lerp(
        addProfilePictureLabelStyle,
        other.addProfilePictureLabelStyle,
        t,
      ),
      circleBackgroundColor:
          Color.lerp(circleBackgroundColor, other.circleBackgroundColor, t),
      circleSize: Size.lerp(circleSize, other.circleSize, t),
    );
  }
}
