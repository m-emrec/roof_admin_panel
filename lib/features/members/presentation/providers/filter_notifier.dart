import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members/data/models/filter_m%C3%BCodel.dart';
import 'package:roof_admin_panel/features/members/domain/entities/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class FilterNotifier extends StateNotifier<List<UserModel>> {
  FilterNotifier(this.members, this.membersTableDataSource) : super([]) {
    state = members;
    membersTableDataSource.generateUserDataGridRows(members);
    // applyFilters();
  }
  final List<UserModel> members;
  final MembersTableDataSource membersTableDataSource;
  List<FilterModel> _filters = [];
  bool get isFilterApplied => _filters.isNotEmpty;
  void a() {
    addMembershipEndDurationFilter(
      DateTimeRange(
        start: DateTime(2025, 3, 20),
        end: DateTime(2025, 5, 3),
      ),
    );
    applyFilters();
    // membersTableDataSource.;
  }

  ///
  void addAgeFilter(
    RangeValues ageRange,
  ) {
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

  /// Adds a filter to the [membersTableDataSource] for the given [membershipEndDurationRange].
  void addMembershipEndDurationFilter(
    DateTimeRange membershipEndDurationRange,
  ) {
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

  /// Adds a filter to the [membersTableDataSource] for the given [role].
  void addRoleFilter(String role) {
    final roleFilter = FilterModel(
      columnName: MemberTableNames.role,
      condition: FilterCondition(
        type: FilterType.contains,
        value: role,
        filterBehavior: FilterBehavior.stringDataType,
      ),
    );
    _filters.add(roleFilter);
  }

  /// Removes only the filter with the given [columnName].
  void removeFilter(
    MemberTableNames columnName,
  ) {
    _filters.removeWhere((element) {
      if (element.columnName == columnName) {
        membersTableDataSource.removeFilter(
          element.columnName.name,
          element.condition,
        );
      }
      return element.columnName == columnName;
    });
  }

  /// Removes all filters.
  void clearFilters() {
    _filters.clear();
    membersTableDataSource.clearFilters();
  }

  /// Applies all filters.
  void applyFilters() {
    for (final filter in _filters) {
      _addFilter(filter.columnName.name, filter.condition);
    }
  }

  /// Adds a filter to the [membersTableDataSource].
  void _addFilter(String columnName, FilterCondition condition) {
    membersTableDataSource.addFilter(columnName, condition);
  }
}
