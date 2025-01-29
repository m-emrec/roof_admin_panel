import 'package:flutter/material.dart';

/// If the data is null, this widget is displayed in the table cell.
///
///
class TableNullItem extends StatelessWidget {
  /// If the data is null, this widget is displayed in the table cell.
  ///
  /// For now this widget displays an icon.
  const TableNullItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.not_interested_rounded);
  }
}
