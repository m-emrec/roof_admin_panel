import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/models/filter_model.dart';
import 'package:roof_admin_panel/features/members/presentation/strategies/filter%20strategies/filter_strategy.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// [StringFilterStrategy] is a concrete implementation of [FilterStrategy] for string data types.
///
final class StringFilterStrategy implements FilterStrategy<String> {
  /// U
  const StringFilterStrategy();
  @override
  List<FilterModel> build(MemberTableNames columnName, String value) {
    return [
      FilterModel(
        columnName: MemberTableNames.role,
        condition: FilterCondition(
          type: FilterType.contains,
          value: value,
          filterBehavior: FilterBehavior.stringDataType,
          filterOperator: FilterOperator.and,
        ),
      ),
    ];
  }
}
