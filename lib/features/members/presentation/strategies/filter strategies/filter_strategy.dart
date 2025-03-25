import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/models/filter_model.dart';

abstract interface class FilterStrategy<T> {
  List<FilterModel> build(MemberTableNames columnName, T value);
}
