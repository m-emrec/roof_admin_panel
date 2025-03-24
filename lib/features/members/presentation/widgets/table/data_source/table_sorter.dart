import 'package:core/utils/logger/logger.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/sort_type_enum.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

mixin TableSorter on DataGridSource {
  @override
  Future<void> sort({SortBy? sortBy, bool sortAscending = false}) async {
    sortedColumns.clear();
    if (sortBy == null) {
      sortedColumns.clear();
      return;
    }
    switch (sortBy) {
      case SortBy.age:
        Log.debug('Sorting by age');
        sortedColumns.add(
          SortColumnDetails(
            name: MemberTableNames.age.name,
            sortDirection: sortAscending
                ? DataGridSortDirection.ascending
                : DataGridSortDirection.descending,
          ),
        );

      case SortBy.memberNumber:
        sortedColumns.add(
          SortColumnDetails(
            name: MemberTableNames.memberNumber.name,
            sortDirection: sortAscending
                ? DataGridSortDirection.ascending
                : DataGridSortDirection.descending,
          ),
        );
      case SortBy.memberShipEndDate:
        sortedColumns.add(
          SortColumnDetails(
            name: MemberTableNames.membershipEndDate.name,
            sortDirection: sortAscending
                ? DataGridSortDirection.ascending
                : DataGridSortDirection.descending,
          ),
        );
      case SortBy.memberShipStartDate:
        break;

      case SortBy.membershipDuration:
        sortedColumns.add(
          SortColumnDetails(
            name: MemberTableNames.membershipDuration.name,
            sortDirection: sortAscending
                ? DataGridSortDirection.ascending
                : DataGridSortDirection.descending,
          ),
        );

      case SortBy.name:
        sortedColumns.add(
          SortColumnDetails(
            name: MemberTableNames.memberName.name,
            sortDirection: sortAscending
                ? DataGridSortDirection.ascending
                : DataGridSortDirection.descending,
          ),
        );
    }
    return super.sort();
  }
}
