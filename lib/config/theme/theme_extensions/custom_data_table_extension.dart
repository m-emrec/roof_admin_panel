import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';

/// A class that holds the theme data for the custom data table.
///
/// It is used on the [CustomDataTable] widget.
class CustomDataTableThemeExtension
    extends ThemeExtension<CustomDataTableThemeExtension> {
  /// A class that holds the theme data for the custom data table.
  ///
  /// It is used on the [CustomDataTable] widget.
  CustomDataTableThemeExtension({
    required this.tableTheme,
    required this.headerTextStyle,
    this.rowItemTextStyle,
    this.nameTextStyle,
    this.border,
  });
  final BoxBorder? border;
  final TextStyle? rowItemTextStyle;
  final TextStyle? nameTextStyle;

  /// The theme data for the table.
  final SfDataGridThemeData tableTheme;

  /// The text style for the header.
  final TextStyle? headerTextStyle;
  @override
  ThemeExtension<CustomDataTableThemeExtension> copyWith({
    SfDataGridThemeData? tableTheme,
    TextStyle? headerTextStyle,
    BoxBorder? border,
  }) {
    return CustomDataTableThemeExtension(
      tableTheme: tableTheme ?? this.tableTheme,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      border: border ?? this.border,
    );
  }

  @override
  ThemeExtension<CustomDataTableThemeExtension> lerp(
    covariant ThemeExtension<CustomDataTableThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomDataTableThemeExtension) {
      return this;
    }

    return CustomDataTableThemeExtension(
      tableTheme: SfDataGridThemeData.lerp(tableTheme, other.tableTheme, t) ??
          tableTheme,
      headerTextStyle:
          TextStyle.lerp(headerTextStyle, other.headerTextStyle, t),
    );
  }
}
