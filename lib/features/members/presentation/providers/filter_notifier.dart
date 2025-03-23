import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members/data/models/filter_m%C3%BCodel.dart';
import 'package:roof_admin_panel/features/members/domain/entities/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class FilterNotifier extends ChangeNotifier {
  FilterNotifier(this.members, this.membersTableDataSource) : super() {
    membersTableDataSource.generateUserDataGridRows(members);
  }
  final List<UserModel> members;
  final MembersTableDataSource membersTableDataSource;
  List<FilterModel> _filters = [];
  bool get isFilterApplied => _filters.isNotEmpty;

  Role? get roleFilter {
    for (final filter in _filters) {
      if (filter.columnName == MemberTableNames.role) {
        return filter.condition.value
            .toString()
            .fromLocalizedStringToRoleEnum();
      }
    }
    return null;
  }

  RangeValues? get ageFilter {
    double? min;
    double? max;
    for (final filter in _filters) {
      if (filter.columnName == MemberTableNames.age) {
        if (filter.condition.type == FilterType.greaterThanOrEqual) {
          min = filter.condition.value as double;
        } else if (filter.condition.type == FilterType.lessThanOrEqual) {
          max = filter.condition.value as double;
        }
      }
    }
    return min != null && max != null ? RangeValues(min, max) : null;
  }

  DateTimeRange? get membershipEndDurationFilter {
    DateTime? min;
    DateTime? max;
    for (final filter in _filters) {
      if (filter.columnName == MemberTableNames.membershipEndDate) {
        if (filter.condition.type == FilterType.greaterThanOrEqual) {
          min = filter.condition.value as DateTime;
        } else if (filter.condition.type == FilterType.lessThanOrEqual) {
          max = filter.condition.value as DateTime;
        }
      }
    }
    return min != null && max != null
        ? DateTimeRange(start: min, end: max)
        : null;
  }

  ///
  void addAgeFilter(
    RangeValues ageRange,
  ) {
    _removeFilter(MemberTableNames.age);
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
    notifyListeners();
  }

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
