import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/product/utility/models/manager_role_model.dart';
part "manager_model.g.dart";

@JsonSerializable()
class ManagerModel {
  ManagerModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.role,
    this.imageUrl,
  });

  final String uid;
  final String email;
  final String name;
  final ManagerRoleModel role;
  final String? imageUrl;

  factory ManagerModel.fromJson(Map<String, dynamic> json) =>
      _$ManagerModelFromJson(json);
  Map<String, dynamic> toJson() => _$ManagerModelToJson(this);
}
