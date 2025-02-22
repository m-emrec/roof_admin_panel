part of 'custom_table.dart';

class _CustomTableLoadMoreViewBuilder {
  static Widget build(
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
