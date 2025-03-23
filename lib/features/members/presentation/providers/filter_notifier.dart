import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/members/data/models/filter_model.dart';
import 'package:roof_admin_panel/features/members/domain/entities/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table_data_source.dart';
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
    _removeFilter(MemberTableNames.role);
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
      if (element.columnName == columnName) {
        // membersTableDataSource.removeFilter(
        //   element.columnName.name,
        //   element.condition,
        // );
      }
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
