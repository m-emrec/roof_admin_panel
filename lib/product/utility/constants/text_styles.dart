import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A utility class that provides predefined text styles using the Poppins font.
///
/// The `TextStyles` class contains a private method `_font` that returns a
/// `TextStyle` object with the Poppins font, and a `TextTheme` object that
/// defines various text styles for different text elements in the app.
///
/// The `_font` method accepts various parameters to customize the text style,
/// such as `background`, `backgroundColor`, `color`, `decoration`,
/// `decorationColor`, `decorationStyle`, `decorationThickness`, `fontFeatures`,
/// `fontSize`, `fontStyle`, `fontWeight`, `foreground`, `height`,
/// `letterSpacing`, `locale`, `shadows`, `textBaseline`, `textStyle`, and
/// `wordSpacing`.
///
/// The `textTheme` object defines the following text styles:
///
/// - `titleLarge`: A large title style with the primary text color.
/// - `titleMedium`: A medium title style.
/// - `titleSmall`: A small title style.
/// - `bodyLarge`: A large body text style with the primary text color.
/// - `bodyMedium`: A medium body text style with the secondary text color.
/// - `bodySmall`: A small body text style with the secondary text color.
/// - `labelLarge`: A large label style with the primary text color and medium
///   font weight.
/// - `labelMedium`: A medium label style with the primary text color, medium
///   font weight, and a font size of 12.

class AppTextTheme {
  AppTextTheme(this.context);

  // factory AppTextTheme() => _instance;
  // AppTextTheme._internal(this.context);
  // static final AppTextTheme _instance = AppTextTheme._internal(BuildContext context);
  final BuildContext context;

  /// Poppins font
  TextStyle _font({
    Paint? background,
    Color? backgroundColor,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    List<FontFeature>? fontFeatures,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    Paint? foreground,
    double? height,
    double? letterSpacing,
    Locale? locale,
    List<Shadow>? shadows,
    TextBaseline? textBaseline,
    TextStyle? textStyle,
    double? wordSpacing,
  }) =>
      GoogleFonts.poppins(
        background: background,
        backgroundColor: backgroundColor,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFeatures: fontFeatures,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        foreground: foreground,
        height: height,
        letterSpacing: letterSpacing,
        locale: locale,
        shadows: shadows,
        textBaseline: textBaseline,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
      );

  final String? fontFamily = GoogleFonts.poppins().fontFamily;

  /// The `textTheme` object defines the following text styles:
  ///
  /// - `titleLarge`: A large title style with the primary text color.
  /// - `titleMedium`: A medium title style.
  /// - `titleSmall`: A small title style.
  /// - `bodyLarge`: A large body text style with the primary text color.
  /// - `bodyMedium`: A medium body text style with the secondary text color.
  /// - `bodySmall`: A small body text style with the secondary text color.
  /// - `labelLarge`: A large label style with the primary text color and medium
  ///   font weight.
  /// - `labelMedium`: A medium label style with the primary text color, medium
  ///   font weight, and a font size of 12.
  TextTheme get textTheme => TextTheme(
        headlineLarge: context.textTheme.headlineLarge?.copyWith(
          color: AppColors.darkTextColors[70],
          fontFamily: fontFamily,
        ),
        headlineMedium: context.textTheme.headlineMedium?.copyWith(
          color: AppColors.darkTextColors[70],
          fontFamily: fontFamily,
        ),
        headlineSmall: context.textTheme.headlineSmall?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.darkTextColors[70],
        ),
        displayLarge: context.textTheme.displayLarge?.copyWith(
          fontFamily: fontFamily,
        ),
        displayMedium: context.textTheme.displayMedium?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.darkTextColors[70],
        ),
        displaySmall: context.textTheme.displaySmall?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.darkTextColors[70],
        ),
        titleLarge: context.textTheme.titleLarge?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.darkTextColors[70],
        ),
        titleMedium: context.textTheme.titleMedium?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.darkTextColors[70],
          fontWeight: FontWeight.w600,
        ),
        titleSmall: context.textTheme.titleSmall?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.darkTextColors[70],
        ),

        /// Body
        bodyLarge: context.textTheme.bodyLarge?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.primaryTextColor,
        ),
        bodyMedium: context.textTheme.bodyMedium?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.darkTextColors[70],
        ),
        bodySmall: context.textTheme.bodySmall?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.secondaryTextColor,
        ),

        /// Labels
        labelLarge: context.textTheme.labelLarge?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w700,
        ),
        labelMedium: context.textTheme.labelMedium?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        labelSmall: context.textTheme.labelSmall?.copyWith(
          fontFamily: fontFamily,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w500,
        ),
      );
}
