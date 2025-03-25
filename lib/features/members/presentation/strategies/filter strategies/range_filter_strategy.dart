import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/models/filter_model.dart';
import 'package:roof_admin_panel/features/members/presentation/strategies/filter%20strategies/filter_strategy.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

final class RangeFilterStrategy implements FilterStrategy<RangeValues> {
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
