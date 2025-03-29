import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/add_profile_picture_theme.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_bottom_sheet_them.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_data_table_extension.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/feedback_tile_theme_extension.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/guests_table_theme_extension.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/side_bar_theme_extension.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/user_card_theme_extension.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'theme_extensions/inline_text_button_theme.dart';

part 'widget_themes/_date_picker_theme.dart';
part 'widget_themes/_pop_menu_theme.dart';
part 'widget_themes/_floating_action_button_theme.dart';
part 'widget_themes/_progress_indicator_theme.dart';
part 'widget_themes/_check_box_theme.dart';
part 'widget_themes/_input_decoration_theme.dart';
part 'widget_themes/_app_bar_theme.dart';
part 'widget_themes/_text_button_theme.dart';
part 'widget_themes/_outlined_button_theme.dart';
part 'widget_themes/_elevated_button_theme.dart';
part 'widget_themes/_add_profile_picture_theme.dart';
part 'widget_themes/_inline_text_button_theme.dart';
part 'widget_themes/_custom_bottom_sheet_theme.dart';
part 'widget_themes/_tooltip_theme.dart';
part 'widget_themes/_icon_button_theme.dart';
part 'widget_themes/_chip_theme.dart';
part 'widget_themes/_text_selection_theme.dart';
part 'widget_themes/_menu_button_theme.dart';
part 'widget_themes/_expansion_tile_theme.dart';
part 'widget_themes/_side_bar_theme.dart';
part 'widget_themes/custom_data_table_theme.dart.dart';
part './widget_themes/_feedback_tile_theme.dart';
part './widget_themes/guests_table_theme.dart';
part './widget_themes/user_card_theme.dart';
part './widget_themes/slider_theme.dart';
part './widget_themes/membership_info_card_theme.dart';

/// A class that defines the application's theme settings.
///
/// This class provides a `lightTheme` getter that returns a `ThemeData` object
/// configured with various theme settings such as colors, text styles, and
/// widget themes.
///
/// The following widget themes are defined:
/// - `AppBarTheme`: Configures the appearance of the app bar.
/// - `ElevatedButtonThemeData`: Configures the appearance of elevated buttons.
/// - `PopupMenuThemeData`: Configures the appearance of popup menus.
/// - `OutlinedButtonThemeData`: Configures the appearance of outlined buttons.
/// - `TextButtonThemeData`: Configures the appearance of text buttons.
/// - `InputDecorationTheme`: Configures the appearance of input decorations.
/// - `CheckboxThemeData`: Configures the appearance of checkboxes.
/// - `ProgressIndicatorThemeData`: Configures the appearance of progress
/// indicators.
/// - `FloatingActionButtonThemeData`: Configures the appearance of floating
/// action buttons.
/// - `DatePickerThemeData`: Configures the appearance of date pickers.
///
/// Additionally, the class defines a set of theme extensions using
/// `ThemeExtension`.
///
/// Example usage:
/// ```dart
/// final ThemeData theme = AppTheme().lightTheme;
/// ```
final class AppTheme {
  AppTheme({required BuildContext context}) : _context = context;

  final BuildContext _context;

  /// A getter that returns the light theme configuration for the application.
  ///
  /// This getter provides access to the predefined light theme settings,
  /// which can be used to style the application's UI components with a light
  /// color scheme.
  ///
  /// Returns:
  ///   A [ThemeData] object representing the light theme configuration.
  // ThemeData get lightTheme => _lightTheme;
  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor[80],
        primaryColor: AppColors.primaryColor[50],
        textTheme: TextStyles().textTheme,

        /// Widget Themes
        appBarTheme: _AppBarTheme.appBarTheme,
        elevatedButtonTheme: _ElevatedButtonTheme.elevatedButtonTheme,
        menuButtonTheme: _MenuButtonTheme.menuButtonTheme,
        textSelectionTheme: _TextSelectionTheme.textSelectionTheme,
        popupMenuTheme: _PopMenuTheme.popMenuTheme,
        outlinedButtonTheme: _OutlinedButtonTheme.outlinedButtonTheme,
        textButtonTheme: _TextButtonTheme.textButtonTheme,
        inputDecorationTheme: _InputDecorationTheme.inputDecorationTheme,
        extensions: _extensions,
        expansionTileTheme: _ExpansionTileTheme.expansionTileTheme,

        checkboxTheme: _CheckboxTheme.checkboxTheme,
        progressIndicatorTheme: _ProgressIndicatorTheme.progressIndicatorTheme,
        floatingActionButtonTheme:
            _FloatingActionButtonTheme.floatingActionButtonTheme,
        datePickerTheme: _DatePickerTheme.datePickerTheme,
        tooltipTheme: _TooltipTheme.tooltipTheme,
        chipTheme: _ChipTheme.chipTheme,
        dataTableTheme: const DataTableThemeData(
          headingRowAlignment: MainAxisAlignment.start,
        ),
        sliderTheme: _SliderTheme.theme(_context),
        iconButtonTheme: _IconButtonTheme.iconButtonTheme,
      );

  // MARK: CheckboxThemeData

  // MARK: Theme Extensions
  Iterable<ThemeExtension<dynamic>> get _extensions => [
        _AddProfilePictureTheme.addProfilePictureTheme,
        _InlineTextButtonTheme.inlineTextButtonTheme,
        _CustomBottomSheetTheme.customBottomSheetTheme,
        _SideBarTheme.sideBarTheme(_context),
        _CustomDataTableTheme.theme,
        _FeedbackTileTheme.feedbackTileTheme(_context),
        _GuestsTableTheme.theme(),
        _UserCardTheme.theme(_context),
        _MembershipInfoCardTheme(_context),
      ];
}
