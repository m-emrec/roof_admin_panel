part of 'members_table.dart';

/// A mixin that provides a method to handle the filtered empty state of the table.
mixin _MembersFilterHandlerMixin {
  /// Returns true if a filter is applied and there are no matching rows.
  ///
  bool hasActiveFilterButNoData(
    WidgetRef ref,
    MembersTableDataSource tableSource,
  ) {
    return ref.watch(filterNotifierProvider).isFilterApplied &&
        tableSource.effectiveRows.isEmpty;
  }

  /// Displays a message when no data is found for the active filter and attempts to load more rows first.
  ///
  /// If the [hasActiveFilterButNoData] returns true, this method will be called.
  ///
  /// First It will call the [handleLoadMoreRows] method to fetch more data.
  ///
  /// If after that the table is still empty, it will show a message.
  Widget buildEmptyFilteredTableMessage(BuildContext context, WidgetRef ref) {
    final tableSource = ref.watch(membersTableSourceProvider);

    return FutureBuilder(
      future: tableSource.handleLoadMoreRows(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: LoadingIndicator(),
          );
        }

        return Center(
          child: Card(
            color: AppColors.accentError,
            child: Padding(
              padding: const AppPadding.horizontalLSymmetric() +
                  const AppPadding.verticalLSymmetric(),
              child: Column(
                spacing: SpacingSizes.small,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.membersView_filters_nothingFoundForFilter.tr(),
                    style: context.textTheme.labelLarge,
                  ),
                  TextButton(
                    onPressed: () =>
                        ref.read(filterNotifierProvider).clearFilters(),
                    child:
                        Text(LocaleKeys.membersView_filters_clearFilters.tr()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
