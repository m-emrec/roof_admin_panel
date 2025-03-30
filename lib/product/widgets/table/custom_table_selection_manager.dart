part of 'custom_table.dart';

/// A selection manager for the [CustomTable] widget.
class _CustomTableSelectionManager extends RowSelectionManager {
  factory _CustomTableSelectionManager() => instance;
  _CustomTableSelectionManager._internal();

  /// The instance of the selection manager.
  static final _CustomTableSelectionManager instance =
      _CustomTableSelectionManager._internal();
  @override
  Future<void> handleKeyEvent(KeyEvent keyEvent) {
    Log.debug('KeyEvent: $keyEvent');
    return super.handleKeyEvent(keyEvent);
  }

  @override
  void handleTap(RowColumnIndex rowColumnIndex) {
    /// Here, we only handle the tap event if the column index is 0.
    ///
    /// This is because I want to be able select the entire row when the user taps on
    /// the first column.
    ///
    /// If the user taps on any other column,
    /// I want to handle the tap event in the parent widget.
    if (rowColumnIndex.columnIndex == 0) {
      super.handleTap(rowColumnIndex);
    }
  }
}
