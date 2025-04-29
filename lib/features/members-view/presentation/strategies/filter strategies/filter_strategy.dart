import 'package:roof_admin_panel/features/members-view/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members-view/presentation/models/filter_model.dart';

/// Defines a strategy interface for building filter models used in the Members table UI.
///
/// Each implementation of [FilterStrategy] is responsible for creating a list of [FilterModel]
/// instances based on a given column and input value. This allows for dynamic filter generation
/// depending on the column's data type (e.g., string, range, date).

/// Abstract strategy for generating filter models based on user input.
///
/// Implement this interface for different column data types to create the appropriate
/// [FilterModel] instances. The [T] generic represents the type of input the strategy will use.
abstract interface class FilterStrategy<T> {
  /// Builds a list of [FilterModel] instances based on the given [columnName] and [value].
  ///
  List<FilterModel> build(MemberTableNames columnName, T value);
}
