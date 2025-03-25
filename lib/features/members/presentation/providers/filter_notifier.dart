import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/models/filter_model.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/table/data_source/members_table_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
class MembersFilterNotifier extends ChangeNotifier {
  /// This is the notifier that is used to filter the members data.
  MembersFilterNotifier(this.members, this.membersTableDataSource) {
    membersTableDataSource.generateUserDataGridRows(members);
  }

  /// This is the list of members that is displayed
  final List<UserModel> members;

  /// This is the data source that is used to display the members data.
  final MembersTableDataSource membersTableDataSource;

  /// This variable stores the filters to be applied.
  ///
  ///
  final List<FilterModel> _filters = [];

  /// It is a getter to check if any filter is applied.
  ///
  ///
  bool get isFilterApplied => _filters.isNotEmpty;

  ///
  Role? get roleFilter {
    final filter = _getIfFilterExists(MemberTableNames.role);
    if (filter == null) {
      return null;
    }
    return filter.first.condition.value
        .toString()
        .fromLocalizedStringToRoleEnum();
  }

  ///
  RangeValues? get ageFilter {
    double? min;
    double? max;

    final filter = _getIfFilterExists(MemberTableNames.age);
    if (filter == null) {
      return null;
    }

    min = double.tryParse(filter[0].condition.value.toString());
    max = double.tryParse(filter[1].condition.value.toString());

    return min != null && max != null ? RangeValues(min, max) : null;
  }

  /// Returns the [DateTimeRange] of the [membershipEndDurationFilter].
  /// If the filter is not applied, it returns null.
  ///
  ///
  DateTimeRange? get membershipEndDurationFilter {
    DateTime? min;
    DateTime? max;

    final filter = _getIfFilterExists(MemberTableNames.membershipEndDate);
    if (filter == null) {
      return null;
    }
    min = DateTime.tryParse(filter[0].condition.value.toString());
    max = DateTime.tryParse(filter[1].condition.value.toString());

    return max != null && min != null
        ? DateTimeRange(start: min, end: max)
        : null;
  }

  /// This method checks the filter for the given [columnName] and
  /// returns it if it exists.
  /// If the filter does not exist, it returns null.
  ///
  List<FilterModel>? _getIfFilterExists(MemberTableNames columnName) {
    final filter =
        _filters.where((element) => element.columnName == columnName).toList();
    return filter.isNotEmpty ? filter : null;
  }

  /// Called when the user closes the filter dialog without saving.
  /// This method restores `_filters` to the last saved state by:
  /// - Removing newly added filters,
  /// - Reverting changes made to existing filters,
  /// - Re-adding filters that were deleted but still exist in the saved state.
  void revertUnappliedFilters() {
    final databaseFilters = membersTableDataSource.filterConditions;
    _removeUnsavedFilters(databaseFilters);
    _restoreMissingSavedFilters(databaseFilters);
    notifyListeners();
  }

  /// Goes through `_filters` and removes any filters that are not present
  /// in the saved filters (i.e., were added during the dialog session).
  /// Also restores any modified filters to their original saved state.
  void _removeUnsavedFilters(
      Map<String, List<FilterCondition>> databaseFilters) {
    for (final filter in _filters) {
      ///when the dialog closed ( pressed "close" button), if the filter is
      ///not registered in the [membersTableDataSource]
      /// then remove the filter from the [_filters] list.
      if (membersTableDataSource.filterConditions
              .containsKey(filter.columnName.name) ==
          false) {
        _removeFilter(filter.columnName);
      } else {
        _restoreModifiedFiltersToSavedState(databaseFilters, filter);
      }
    }
  }

  /// Replaces the filter's condition with the saved one
  /// if it has been changed during the dialog session.
  void _restoreModifiedFiltersToSavedState(
      Map<String, List<FilterCondition>> databaseFilters, FilterModel filter) {
    /// if the filter is registered in the [membersTableDataSource]
    /// then check if the filter is changed in _filters list
    /// if it is changed then reset the filter to the filter registered
    /// in the [membersTableDataSource]
    if (databaseFilters[filter.columnName.name] != null) {
      if (databaseFilters[filter.columnName.name]!.contains(filter.condition) ==
          false) {
        final index = _filters.indexOf(filter);
        _filters[index] = FilterModel(
          columnName: filter.columnName,
          condition: databaseFilters[filter.columnName.name]!.firstWhere(
            (element) => element.type == filter.condition.type,
          ),
        );
      }
    }
  }

  /// Finds filters that exist in the saved state but were removed from `_filters`
  /// during the dialog session, and adds them back.
  void _restoreMissingSavedFilters(
      Map<String, List<FilterCondition>> databaseFilters) {
    for (final filter in databaseFilters.entries) {
      if (_filters.any((element) => element.columnName.name == filter.key) ==
          false) {
        _filters.addAll(
          filter.value.map(
            (e) => FilterModel(
              columnName: MemberTableNames.values
                  .firstWhere((element) => element.name == filter.key),
              condition: e,
            ),
          ),
        );
      }
    }
  }

  ///
  void addAgeFilter(
    RangeValues ageRange,
  ) {
    removeAgeFilter();
    final minimumAgeFilter = FilterModel(
      columnName: MemberTableNames.age,
      condition: FilterCondition(
        type: FilterType.greaterThanOrEqual,
        value: ageRange.start,
        filterOperator: FilterOperator.and,
      ),
    );
    final maximumAgeFilter = FilterModel(
      columnName: MemberTableNames.age,
      condition: FilterCondition(
        type: FilterType.lessThanOrEqual,
        value: ageRange.end,
        filterOperator: FilterOperator.and,
      ),
    );
    _filters
      ..add(minimumAgeFilter)
      ..add(maximumAgeFilter);
  }

  ///
  void removeAgeFilter() => _removeFilter(MemberTableNames.age);

  /// Adds a filter to the [membersTableDataSource] for the given [membershipEndDurationRange].
  void addMembershipEndDurationFilter(
    DateTimeRange membershipEndDurationRange,
  ) {
    removeMembershipEndDurationFilter();
    final minimumMembershipEndDurationFilter = FilterModel(
      columnName: MemberTableNames.membershipEndDate,
      condition: FilterCondition(
        type: FilterType.greaterThanOrEqual,
        value: membershipEndDurationRange.start,
        filterOperator: FilterOperator.and,
      ),
    );
    final maximumMembershipEndDurationFilter = FilterModel(
      columnName: MemberTableNames.membershipEndDate,
      condition: FilterCondition(
        type: FilterType.lessThanOrEqual,
        value: membershipEndDurationRange.end,
        filterOperator: FilterOperator.and,
      ),
    );
    _filters
      ..add(minimumMembershipEndDurationFilter)
      ..add(maximumMembershipEndDurationFilter);
  }

  ///
  void removeMembershipEndDurationFilter() =>
      _removeFilter(MemberTableNames.membershipEndDate);

  /// Adds a filter to the [membersTableDataSource] for the given [role].
  void addRoleFilter(String role) {
    removeRoleFilter();
    final roleFilter = FilterModel(
      columnName: MemberTableNames.role,
      condition: FilterCondition(
        type: FilterType.contains,
        value: role,
        filterBehavior: FilterBehavior.stringDataType,
        filterOperator: FilterOperator.and,
      ),
    );
    _filters.add(roleFilter);
    // notifyListeners();
  }

  ///
  void removeRoleFilter() => _removeFilter(MemberTableNames.role);

  /// Removes only the filter with the given [columnName].
  void _removeFilter(
    MemberTableNames columnName,
  ) {
    _filters.removeWhere((element) {
      return element.columnName == columnName;
    });
    notifyListeners();
  }

  /// Removes all filters.
  void clearFilters() {
    _filters.clear();
    membersTableDataSource.clearFilters();
    notifyListeners();
  }

  /// Applies all filters.
  void applyFilters() {
    membersTableDataSource.clearFilters();
    for (final filter in _filters) {
      _addFilter(filter.columnName.name, filter.condition);
    }
  }

  /// Adds a filter to the [membersTableDataSource].
  void _addFilter(String columnName, FilterCondition condition) {
    membersTableDataSource.addFilter(columnName, condition);
  }
}
