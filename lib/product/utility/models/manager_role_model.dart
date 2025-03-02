import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
part 'manager_role_model.g.dart';

@JsonSerializable()
class ManagerRoleModel {
  ///
  ManagerRoleModel({
    required this.name,
    required this.id,
    required this.permissions,
  });

  final String name;
  final String id;
  final List<Permissions> permissions;

  factory ManagerRoleModel.fromJson(Map<String, dynamic> json) =>
      _$ManagerRoleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ManagerRoleModelToJson(this);
}
