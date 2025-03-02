// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagerRoleModel _$ManagerRoleModelFromJson(Map<String, dynamic> json) =>
    ManagerRoleModel(
      name: json['name'] as String,
      id: json['id'] as String,
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => $enumDecode(_$PermissionsEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$ManagerRoleModelToJson(ManagerRoleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'permissions':
          instance.permissions.map((e) => _$PermissionsEnumMap[e]!).toList(),
    };

const _$PermissionsEnumMap = {
  Permissions.canDeleteMember: 'canDeleteMember',
};
