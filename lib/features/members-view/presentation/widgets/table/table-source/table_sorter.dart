import 'package:core/utils/logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members-view/presentation/enums/sort_by_enum.dart';
import 'package:roof_admin_panel/features/members-view/presentation/enums/sort_type_enum.dart';
import 'package:roof_admin_panel/features/members-view/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members-view/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/string_tr_comparator_extension.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

mixin TableSorter on DataGridSource {
  void changeSortDirection(WidgetRef ref) async {
    final sortDirection = ref.watch(sortDirectionProvider);
    ref.read(sortDirectionProvider.notifier).state =
        sortDirection == SortDirection.asc
            ? SortDirection.desc
            : SortDirection.asc;

    await sort(
      ref: ref,
      sortBy: SortBy.values.firstWhere(
        (element) => element.toTableColumnName.name == sortedColumns.first.name,
      ),
    );
  }

  @override
  Future<void> sort({SortBy? sortBy, WidgetRef? ref}) async {
    sortedColumns.clear();
    if (sortBy == null) {
      _clearSort(ref);
      return super.sort();
    }
    switch (sortBy) {
      case SortBy.age:
        sortedColumns.add(
          _sortColumnDetails(
            column: MemberTableNames.age,
            ref: ref,
          ),
        );

      case SortBy.memberNumber:
        sortedColumns.add(
          _sortColumnDetails(
            column: MemberTableNames.memberNumber,
            ref: ref,
          ),
        );
      case SortBy.membershipEndDate:
        sortedColumns.add(
          _sortColumnDetails(
            column: MemberTableNames.membershipEndDate,
            ref: ref,
          ),
        );
      // case SortBy.membershipStartDate:
      //   break;

      case SortBy.membershipDuration:
        sortedColumns.add(
          _sortColumnDetails(
            column: MemberTableNames.membershipDuration,
            ref: ref,
          ),
        );

      case SortBy.name:
        sortedColumns.add(
          _sortColumnDetails(
            column: MemberTableNames.memberName,
            ref: ref,
          ),
        );
    }
    ref?.read(isSortAppliedProvider.notifier).state = true;
    return super.sort();
  }

  SortColumnDetails _sortColumnDetails({
    required MemberTableNames column,
    required WidgetRef? ref,
  }) {
    return SortColumnDetails(
      name: column.name,
      sortDirection:
          _sortType(ref?.watch(sortDirectionProvider) ?? SortDirection.desc),
    );
  }

  void _clearSort(WidgetRef? ref) {
    sortedColumns.clear();
    ref?.read(isSortAppliedProvider.notifier).state = false;
    ref?.read(sortDirectionProvider.notifier).state = SortDirection.desc;
  }

  DataGridSortDirection _sortType(SortDirection sortType) {
    switch (sortType) {
      case SortDirection.asc:
        return DataGridSortDirection.ascending;
      case SortDirection.desc:
        return DataGridSortDirection.descending;
    }
  }
}
