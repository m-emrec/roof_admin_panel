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
    required this.rowHeight,
    required this.minTableWidth,
    this.checkboxShape,
    this.avatarRadius,
  });
  final BoxBorder? border;
  final TextStyle? rowItemTextStyle;
  final TextStyle? nameTextStyle;
  final double rowHeight;
  final OutlinedBorder? checkboxShape;
  final double? avatarRadius;

  /// The minimum width of the table.
  /// If the width of the table is less than this value, the column width mode is set to auto.
  ///
  final double minTableWidth;

  /// The theme data for the table.
  final SfDataGridThemeData tableTheme;

  /// The text style for the header.
  final TextStyle? headerTextStyle;
  @override
  ThemeExtension<CustomDataTableThemeExtension> copyWith({
    SfDataGridThemeData? tableTheme,
    TextStyle? headerTextStyle,
    BoxBorder? border,
    double? rowHeight,
  }) {
    return CustomDataTableThemeExtension(
      tableTheme: tableTheme ?? this.tableTheme,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      border: border ?? this.border,
      rowHeight: rowHeight ?? this.rowHeight,
      minTableWidth: minTableWidth,
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
      rowHeight: rowHeight,
      minTableWidth: minTableWidth,
    );
  }
}
