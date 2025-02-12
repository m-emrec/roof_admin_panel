import 'package:flutter/material.dart';

/// A custom theme extension for Feedback Tiles
///
///
///
/// This class provides a `FeedbackTileThemeExtension` object configured with
/// various theme settings such as colors, text styles, and widget themes.
///
/// The following widget themes are defined:
/// - `titleTextStyle`: Configures the appearance of the title text.
/// - `subTitleTextStyle`: Configures the appearance of the subtitle text.
/// - `createdAtTextStyle`: Configures the appearance of the created at text.
/// - `userNameLabelTextStyle`: Configures the appearance of the reported user
/// label and the feedback owner label.
/// - `contentTextStyle`: Configures the appearance of the content text.
/// - `imageSize`: Configures the size of the images displayed in the feedback
/// tile.
/// - `imageShape`: Configures the shape of the images displayed in the feedback
/// tile.
/// - `gapBetweenContentAndFooter`: Configures the gap between the content and
/// the footer.
/// - `gapBetweenHeaderAndContent`: Configures the gap between the header and
/// the content.
/// - `userImageRadius`: Configures the radius of the user's image which is
/// displayed in the feedback tile
/// if there is any user information available.
///
///
///
class FeedbackTileThemeExtension
    extends ThemeExtension<FeedbackTileThemeExtension> {
  /// A custom theme extension for Feedback Tiles
  ///
  ///
  FeedbackTileThemeExtension({
    required this.gapBetweenContentAndFooter,
    required this.gapBetweenHeaderAndContent,
    required this.userImageRadius,
    required this.titleTextStyle,
    required this.subTitleTextStyle,
    required this.createdAtTextStyle,
    required this.userNameLabelTextStyle,
    required this.contentTextStyle,
    required this.imageSize,
    required this.imageShape,
  });

  /// The gap between the content and the footer
  final double gapBetweenContentAndFooter;

  /// The gap between the header and the content
  final double gapBetweenHeaderAndContent;

  /// This is the radius of the user's image which is displayed in the feedback tile
  /// if there is any user information available
  final double userImageRadius;

  /// The text style of the title
  final TextStyle titleTextStyle;

  /// The text style of the subtitle
  final TextStyle subTitleTextStyle;

  /// The text style of the created at text
  final TextStyle createdAtTextStyle;

  /// The text style of the reported user label and the feedback owner label
  final TextStyle userNameLabelTextStyle;

  /// The text style of the content
  final TextStyle contentTextStyle;

  /// The size of the images displayed in the feedback tile
  final Size imageSize;

  /// The shape of the images displayed in the feedback tile
  final ShapeBorder imageShape;

  @override
  ThemeExtension<FeedbackTileThemeExtension> copyWith({
    double? gapBetweenContentAndFooter,
    double? gapBetweenHeaderAndContent,
    double? userImageRadius,
    TextStyle? titleTextStyle,
    TextStyle? subTitleTextStyle,
    TextStyle? createdAtTextStyle,
    TextStyle? userNameLabelTextStyle,
    TextStyle? contentTextStyle,
    Size? imageSize,
    ShapeBorder? imageShape,
  }) {
    return FeedbackTileThemeExtension(
      gapBetweenContentAndFooter:
          gapBetweenContentAndFooter ?? this.gapBetweenContentAndFooter,
      gapBetweenHeaderAndContent:
          gapBetweenHeaderAndContent ?? this.gapBetweenHeaderAndContent,
      userImageRadius: userImageRadius ?? this.userImageRadius,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subTitleTextStyle: subTitleTextStyle ?? this.subTitleTextStyle,
      createdAtTextStyle: createdAtTextStyle ?? this.createdAtTextStyle,
      userNameLabelTextStyle:
          userNameLabelTextStyle ?? this.userNameLabelTextStyle,
      contentTextStyle: contentTextStyle ?? this.contentTextStyle,
      imageSize: imageSize ?? this.imageSize,
      imageShape: imageShape ?? this.imageShape,
    );
  }

  @override
  ThemeExtension<FeedbackTileThemeExtension> lerp(
    covariant ThemeExtension<FeedbackTileThemeExtension>? other,
    double t,
  ) {
    if (other is! FeedbackTileThemeExtension) return this;

    return FeedbackTileThemeExtension(
      gapBetweenContentAndFooter: gapBetweenContentAndFooter,
      gapBetweenHeaderAndContent: gapBetweenHeaderAndContent,
      userImageRadius: userImageRadius,
      titleTextStyle: titleTextStyle,
      subTitleTextStyle: subTitleTextStyle,
      createdAtTextStyle: createdAtTextStyle,
      userNameLabelTextStyle: userNameLabelTextStyle,
      contentTextStyle: contentTextStyle,
      imageSize: imageSize,
      imageShape: imageShape,
    );
  }
}
