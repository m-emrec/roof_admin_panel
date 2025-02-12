import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/feedback_tile_theme_extension.dart';

extension ThemeExtensionsExtesntion on BuildContext {
  FeedbackTileThemeExtension? get feedbackTileThemeExtension =>
      Theme.of(this).extension<FeedbackTileThemeExtension>();
}
