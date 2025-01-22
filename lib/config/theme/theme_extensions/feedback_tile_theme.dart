import 'package:flutter/material.dart';

final class FeedbackTileTheme extends ThemeExtension<FeedbackTileTheme> {
  FeedbackTileTheme({
    this.selectedTextColor,
    this.selectedTileColor,
    this.subTitleTextStyle,
    this.titleTextStyle,
    this.tileTextStyle,
    this.expandedBackgroundColor,
    this.shape,
    this.selectedSubTitleStyle,
  });

  /// this is the text color of the selected tile
  final Color? selectedTextColor;
  final TextStyle? selectedSubTitleStyle;

  /// this is the background color of the selected tile
  final Color? selectedTileColor;

  /// This is the text style for the subtitle of [ExpansionTile]
  final TextStyle? subTitleTextStyle;

  /// This is the text style for the title of [ExpansionTile]
  final TextStyle? titleTextStyle;

  /// This is the title text style of the [ExpansionTile]'s children
  final TextStyle? tileTextStyle;

  /// This is the background color of the [ExpansionTile] when it is expanded
  final Color? expandedBackgroundColor;

  /// Border shape of the [ExpansionTile]
  final ShapeBorder? shape;

  @override
  ThemeExtension<FeedbackTileTheme> copyWith({
    Color? selectedColor,
    Color? selectedTileColor,
    TextStyle? subTitleTextStyle,
    TextStyle? titleTextStyle,
    TextStyle? tileTextStyle,
    Color? expandedBackgroundColor,
    ShapeBorder? shape,
    TextStyle? selectedSubTitleStyle,
  }) {
    return FeedbackTileTheme(
      selectedSubTitleStyle:
          selectedSubTitleStyle ?? this.selectedSubTitleStyle,
      selectedTextColor: selectedColor ?? this.selectedTextColor,
      selectedTileColor: selectedTileColor ?? this.selectedTileColor,
      subTitleTextStyle: subTitleTextStyle ?? this.subTitleTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      tileTextStyle: tileTextStyle ?? this.tileTextStyle,
      expandedBackgroundColor:
          expandedBackgroundColor ?? this.expandedBackgroundColor,
      shape: shape ?? this.shape,
    );
  }

  @override
  ThemeExtension<FeedbackTileTheme> lerp(
    covariant ThemeExtension<FeedbackTileTheme>? other,
    double t,
  ) {
    if (other is! FeedbackTileTheme) return this;
    return FeedbackTileTheme(
      selectedTextColor:
          Color.lerp(selectedTextColor, other.selectedTextColor, t),
      selectedTileColor:
          Color.lerp(selectedTileColor, other.selectedTileColor, t),
      subTitleTextStyle:
          TextStyle.lerp(subTitleTextStyle, other.subTitleTextStyle, t),
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t),
      tileTextStyle: TextStyle.lerp(tileTextStyle, other.tileTextStyle, t),
      expandedBackgroundColor:
          Color.lerp(expandedBackgroundColor, other.expandedBackgroundColor, t),
      shape: ShapeBorder.lerp(shape, other.shape, t),
    );
  }
}
