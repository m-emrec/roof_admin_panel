import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/members-view/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members-view/presentation/models/filter_model.dart';
import 'package:roof_admin_panel/features/members-view/presentation/strategies/filter%20strategies/filter_strategy.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
final class DateRangeFilterStrategy implements FilterStrategy<DateTimeRange> {
  /// Use this strategy to filter the data based on the date range.
  ///
  ///
  const DateRangeFilterStrategy();

  @override
  List<FilterModel> build(MemberTableNames columnName, DateTimeRange value) {
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
