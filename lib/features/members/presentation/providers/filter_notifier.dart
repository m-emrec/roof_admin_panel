import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members/data/models/filter_m%C3%BCodel.dart';
import 'package:roof_admin_panel/features/members/domain/entities/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class FilterNotifier extends StateNotifier<List<FilterModel>> {
  final MembersTableDataSource membersTableDataSource;
  FilterNotifier(this.membersTableDataSource) : super([]);

  void _addFilter(FilterModel filterModel) {
    state = [...state, filterModel];

    // Log.debug("State : " + state.toString());
  }

  void removeFilter(FilterModel filterModel) {
    state = state.where((element) => element != filterModel).toList();
    membersTableDataSource.removeFilter(
      filterModel.columnName.name,
      filterModel.condition,
    );
  }

  void _checkFilterIsExist(FilterModel filterModel) {
    if (state.contains(filterModel)) {
      return;
    } else {
      _addFilter(filterModel);
    }
  }

  void addAgeFilter(double minAge, double maxAge) {
    // membersTableDataSource.removeFilter(TableNamesEnum. , filterCondition)
    final minAgeCondition = FilterCondition(
      type: FilterType.greaterThanOrEqual,
      value: minAge.toInt(),
    );
    final maxAgeCondition = FilterCondition(
      type: FilterType.lessThanOrEqual,
      value: maxAge.toInt(),
    );
    membersTableDataSource
      ..removeFilter(MemberTableNames.age.name, minAgeCondition)
      ..removeFilter(MemberTableNames.age.name, maxAgeCondition);

    final minAgeFilter = FilterModel(
      columnName: MemberTableNames.age,
      condition: minAgeCondition,
    );
    final maxAgeFilter = FilterModel(
      columnName: MemberTableNames.age,
      condition: maxAgeCondition,
    );

    _checkFilterIsExist(minAgeFilter);
    _checkFilterIsExist(maxAgeFilter);
  }

  void clearFilters() {
    state = [];
    membersTableDataSource.clearFilters();
  }

  void applyFilters() {
    for (final filter in state) {
      membersTableDataSource.addFilter(
        filter.columnName.name,
        filter.condition,
      );
    }
    membersTableDataSource.notifyListeners();
  }
}
