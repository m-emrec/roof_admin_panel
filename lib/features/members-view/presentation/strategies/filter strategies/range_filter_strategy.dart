import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/members-view/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members-view/presentation/models/filter_model.dart';
import 'package:roof_admin_panel/features/members-view/presentation/strategies/filter%20strategies/filter_strategy.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// A filter strategy that constructs a filter model for a numeric range.
///
final class RangeFilterStrategy implements FilterStrategy<RangeValues> {
  /// Uses the [RangeValues] to construct a filter model for the given [columnName].
  ///
  const RangeFilterStrategy();
  @override
  List<FilterModel> build(
    MemberTableNames columnName,
    RangeValues value,
  ) {
    return [
      FilterModel(
        columnName: columnName,
        condition: FilterCondition(
          type: FilterType.greaterThanOrEqual,
          value: value.start,
          filterOperator: FilterOperator.and,
        ),
      ),
      FilterModel(
        columnName: columnName,
        condition: FilterCondition(
          type: FilterType.lessThanOrEqual,
          value: value.end,
          filterOperator: FilterOperator.and,
        ),
      ),
    ];
  }
}
