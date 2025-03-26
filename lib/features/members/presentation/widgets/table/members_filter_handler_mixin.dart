import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/table/data_source/members_table_data_source.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';

/// A mixin that provides a method to handle the filtered empty state of the table.
mixin MembersFilterHandlerMixin {
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
