import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/custom_data_table_extension.dart';
import 'package:roof_admin_panel/core/extensions/context_extension.dart';

/// A widget that represents a header item in a table.
/// It can be used to display a title or a widget in the header of a table.
/// It is mainly used in the [CustomTable] widget.
/// Example:
/// ```dart
/// HeaderItem(
///  title: "Name",
/// ),
///
/// HeaderItem(
/// widget: Icon(Icons.person),
/// ),
///
/// ```
///
///! The `title` and `widget` parameters cannot be provided at the same time.
///
///! The `title` parameter must be provided if the `widget` parameter is not provided.
///
///! The `widget` parameter must be provided if the `title` parameter is not provided.
class ColumnTitle extends StatelessWidget {
  /// A widget that represents a header item in a table.
  /// It can be used to display a title or a widget in the header of a table.
  /// It is mainly used in the [CustomTable] widget.
  /// Example:
  /// ```dart
  /// HeaderItem(
  ///  title: "Name",
  /// ),
  ///
  /// HeaderItem(
  /// widget: Icon(Icons.person),
  /// ),
  ///
  /// ```
  ///
  ///! The `title` and `widget` parameters cannot be provided at the same time.
  ///
  ///! The `title` parameter must be provided if the `widget` parameter is not provided.
  ///
  ///! The `widget` parameter must be provided if the `title` parameter is not provided.
  const ColumnTitle({
    super.key,
    this.title,
    this.widget,
  });

  /// The title to be displayed in the header.
  final String? title;

  /// The widget to be displayed in the header.
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    assert(title != null || widget != null, "Title or widget must be provided");
    assert(
      title == null || widget == null,
      "Title and widget cannot be provided at the same time",
    );
    return Center(
      child: widget ??
          Text(
            title!, // I can use ! because I have already checked that title is not null
            style: context.theme
                .extension<CustomDataTableThemeExtension>()
                ?.headerTextStyle,
          ),
    );
  }
}
