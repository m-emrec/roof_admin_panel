// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/user_roles.dart';
part 'manager_role_model.g.dart';

@JsonSerializable()
class ManagerRoleModel {
  ///
  ManagerRoleModel({
    this.name,
    required this.id,
    this.permissions,
  });
  factory ManagerRoleModel.fromJson(Map<String, dynamic> json) =>
      _$ManagerRoleModelFromJson(json);

  final UserRoles? name;
  final String id;
  final List<Permissions>? permissions;
  Map<String, dynamic> toJson() => _$ManagerRoleModelToJson(this);
}
