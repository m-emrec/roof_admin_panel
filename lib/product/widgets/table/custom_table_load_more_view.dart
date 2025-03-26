part of 'custom_table.dart';

mixin _CustomTableLoadMoreViewBuilder on State<CustomTable> {
  /// Triggers [handleLoadMoreRows] if the current number of rows
  /// is not enough to fill the available viewport height.
  /// This ensures the table appears fully populated even when
  /// initial data does not fill the screen.
  void loadMoreIfNotScrollable(
    double maxHeight,
  ) {
    final rowHeight =
        context.theme.extension<CustomDataTableThemeExtension>()?.rowHeight ??
            double.nan;

    final shouldLoadMore = maxHeight / (rowHeight * widget.rowsPerPage) > 1;

    if (shouldLoadMore) {
      ///
      // ignore: invalid_use_of_protected_member
      widget.source.handleLoadMoreRows();
    }
  }

  Widget buildLoadMore(
    BuildContext context,
    Future<void> Function() loadMoreRows,
  ) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: FutureBuilder(
        future: loadMoreRows(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
