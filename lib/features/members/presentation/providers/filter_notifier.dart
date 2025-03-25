import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/models/filter_model.dart';
import 'package:roof_admin_panel/features/members/presentation/strategies/filter%20strategies/date_range_filter_strategy.dart';
import 'package:roof_admin_panel/features/members/presentation/strategies/filter%20strategies/filter_strategy.dart';
import 'package:roof_admin_panel/features/members/presentation/strategies/filter%20strategies/range_filter_strategy.dart';
import 'package:roof_admin_panel/features/members/presentation/strategies/filter%20strategies/string_filter_strategy.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/table/data_source/members_table_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// [MembersFilterNotifier] manages the local UI-side filtering logic for the Members table.
///
/// It provides a clean abstraction to apply, remove, clear, and revert filters for table columns
/// based on different strategies such as string match, numeric range, and date range.
///

///
/// Key Responsibilities:
/// - Manage a local `_filters` map storing filters applied to each table column
/// - Interact with the [MembersTableDataSource] to reflect filters visually
/// - Utilize [FilterStrategy] objects to construct filters based on the selected data
/// - Support dialog cancellation with [revertUnappliedFilters]
/// - Provide current filter state for UI components via getters
class MembersFilterNotifier extends ChangeNotifier {
  /// Creates an instance of [MembersFilterNotifier] with the initial list of [members]
  /// and a reference to [membersTableDataSource] for rendering filtered results.
  MembersFilterNotifier(this.members, this.membersTableDataSource) {
    membersTableDataSource.generateUserDataGridRows(members);
  }

  /// The full list of members shown in the table UI.
  final List<UserModel> members;

  /// The data source that manages how member data is displayed in the table.
  final MembersTableDataSource membersTableDataSource;

  /// A local map tracking which filters are currently selected per table column.
  /// This does not directly sync with [membersTableDataSource] until [applyFilters] is called.
  final Map<MemberTableNames, List<FilterModel>> _filters = {};

  /// The strategy map that determines how to construct filter models
  /// for each specific table column based on its data type.
  final Map<MemberTableNames, FilterStrategy<dynamic>> _filterStrategies = {
    MemberTableNames.role: const StringFilterStrategy(),
    MemberTableNames.age: const RangeFilterStrategy(),
    MemberTableNames.membershipEndDate: const DateRangeFilterStrategy(),
  };

  /// It is a getter to check if any filter is applied.
  ///
  ///
  bool get isFilterApplied => _filters.isNotEmpty;

  ///
  /// Returns the selected role filter if applied, otherwise null.
  /// Parses the condition value into a [Role] enum.
  Role? get roleFilter {
    final filter = _getFilterIfExists(MemberTableNames.role);
    if (filter == null) {
      return null;
    }
    return filter.first.condition.value
        .toString()
        .fromLocalizedStringToRoleEnum();
  }

  ///
  /// Returns the [RangeValues] for age filter if applied, otherwise null.
  /// Converts the stored condition values into a usable range.
  RangeValues? get ageFilter {
    double? min;
    double? max;

    final filter = _getFilterIfExists(MemberTableNames.age);
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

    final filter = _getFilterIfExists(MemberTableNames.membershipEndDate);

    if (filter == null || (filter.length < 2)) return null;

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
  List<FilterModel>? _getFilterIfExists(MemberTableNames columnName) {
    final filter = _filters[columnName];

    return filter;
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
    Map<String, List<FilterCondition>> databaseFilters,
  ) {
    for (final column in _filters.keys) {
      if (membersTableDataSource.filterConditions.containsKey(column.name) ==
          false) {
        removeFilter(column);
      } else {
        _restoreModifiedFiltersToSavedState(databaseFilters, column);
      }
    }
  }

  /// Replaces the filter's condition with the saved one
  /// if it has been changed during the dialog session.
  void _restoreModifiedFiltersToSavedState(
    Map<String, List<FilterCondition>> databaseFilters,
    MemberTableNames column,
  ) {
    /// if the filter is registered in the [membersTableDataSource]
    /// then check if the filter is changed in _filters list
    /// if it is changed then reset the filter to the filter registered
    /// in the [membersTableDataSource]
    if (databaseFilters[column.name] != null) {
      final filter = _filters[column];
      final conditions = filter?.map((e) => e.condition).toList();

      if (!listEquals(databaseFilters[column.name], conditions)) {
        _filters[column] = databaseFilters[column.name]!
            .map(
              (e) => FilterModel(
                columnName: column,
                condition: e,
              ),
            )
            .toList();
      }
    }
  }

  /// Finds filters that exist in the saved state but were removed from `_filters`
  /// during the dialog session, and adds them back.
  void _restoreMissingSavedFilters(
    Map<String, List<FilterCondition>> databaseFilters,
  ) {
    for (final element in databaseFilters.entries) {
      _filters.putIfAbsent(MemberTableNames.toTableNamesEnum(element.key), () {
        return element.value
            .map(
              (e) => FilterModel(
                columnName: MemberTableNames.values
                    .firstWhere((c) => c.name == element.key),
                condition: e,
              ),
            )
            .toList();
      });
    }
  }

  /// Adds a filter for the specified [column] using its associated [FilterStrategy]
  /// and notifies listeners to update the UI accordingly.
  void addFilter(MemberTableNames column, dynamic value) {
    final strategy = _filterStrategies[column];
    if (strategy == null) return;

    _filters[column] = strategy.build(column, value);
    notifyListeners();
  }

  /// Removes only the filter with the given [columnName].
  void removeFilter(
    MemberTableNames columnName,
  ) {
    _filters.remove(columnName);
    notifyListeners();
  }

  /// Removes all local filters and also clears them from [membersTableDataSource].
  void clearFilters() {
    _filters.clear();
    membersTableDataSource.clearFilters();
    notifyListeners();
  }

  /// Clears all previously applied filters from the table,
  /// and applies current filters stored in [_filters] to [membersTableDataSource].
  void applyFilters() {
    membersTableDataSource.clearFilters();
    for (final filter in _filters.values.expand((element) => element)) {
      _addFilter(filter.columnName.name, filter.condition);
    }
  }

  /// Internally adds a single [condition] to the [membersTableDataSource]
  /// for the given [columnName].
  void _addFilter(String columnName, FilterCondition condition) {
    membersTableDataSource.addFilter(columnName, condition);
  }
}
