import 'package:equatable/equatable.dart';
import 'package:roof_admin_panel/features/members/domain/entities/table_names_enum.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class FilterEntity extends Equatable {
  FilterEntity({required this.columnName, required this.condition});

  final MemberTableNames columnName;
  final FilterCondition condition;

  @override
  List<Object?> get props => [columnName, condition];
}
