import 'package:flutter/material.dart';

class VerificationCodeCardTheme
    extends ThemeExtension<VerificationCodeCardTheme> {
  const VerificationCodeCardTheme({
    this.textStyle,
    this.labelStyle,
    this.backgroundColor,
    this.elevation,
    this.aspectRatio,
    this.cursorColor,
  });
  final Color? backgroundColor;
  final Color? cursorColor;
  final double? elevation;
  final double? aspectRatio;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;

  @override
  ThemeExtension<VerificationCodeCardTheme> copyWith(
      {Color? backgroundColor,
      double? elevation,
      double? aspectRatio,
      TextStyle? textStyle,
      TextStyle? labelStyle,
      Color? cursorColor}) {
    return VerificationCodeCardTheme(
      textStyle: textStyle ?? this.textStyle,
      labelStyle: labelStyle ?? this.labelStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      cursorColor: cursorColor ?? this.cursorColor,
    );
  }

  @override
  ThemeExtension<VerificationCodeCardTheme> lerp(
      covariant ThemeExtension<VerificationCodeCardTheme>? other, double t) {
    if (other is! VerificationCodeCardTheme) return this;
    return VerificationCodeCardTheme(
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t),
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      elevation: elevation,
      aspectRatio: aspectRatio,
    );
  }
}
