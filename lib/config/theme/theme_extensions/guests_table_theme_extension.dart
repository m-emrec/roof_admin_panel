import 'package:flutter/material.dart';

final class GuestsTableThemeExtension
    extends ThemeExtension<GuestsTableThemeExtension> {
  GuestsTableThemeExtension({
    this.joinedEventCountButtonStyle,
    this.approveButtonStyle,
    this.removeButtonStyle,
  });
  final ButtonStyle? joinedEventCountButtonStyle;
  final ButtonStyle? approveButtonStyle;
  final ButtonStyle? removeButtonStyle;

  @override
  ThemeExtension<GuestsTableThemeExtension> copyWith({
    ButtonStyle? joinedEventCountButtonStyle,
    ButtonStyle? approveButtonStyle,
    ButtonStyle? removeButtonStyle,
  }) {
    return GuestsTableThemeExtension(
      joinedEventCountButtonStyle:
          joinedEventCountButtonStyle ?? this.joinedEventCountButtonStyle,
      approveButtonStyle: approveButtonStyle ?? this.approveButtonStyle,
      removeButtonStyle: removeButtonStyle ?? this.removeButtonStyle,
    );
  }

  @override
  ThemeExtension<GuestsTableThemeExtension> lerp(
      covariant ThemeExtension<GuestsTableThemeExtension>? other, double t) {
    if (other is! GuestsTableThemeExtension) return this;
    return GuestsTableThemeExtension(
      joinedEventCountButtonStyle: ButtonStyle.lerp(
          joinedEventCountButtonStyle, other.joinedEventCountButtonStyle, t),
      approveButtonStyle:
          ButtonStyle.lerp(approveButtonStyle, other.approveButtonStyle, t),
      removeButtonStyle:
          ButtonStyle.lerp(removeButtonStyle, other.removeButtonStyle, t),
    );
  }
}
