// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagerRoleModel _$ManagerRoleModelFromJson(Map<String, dynamic> json) =>
    ManagerRoleModel(
      name: $enumDecodeNullable(_$UserRolesEnumMap, json['name']),
      id: json['id'] as String,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PermissionsEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$ManagerRoleModelToJson(ManagerRoleModel instance) =>
    <String, dynamic>{
      'name': _$UserRolesEnumMap[instance.name],
      'id': instance.id,
      'permissions':
          instance.permissions?.map((e) => _$PermissionsEnumMap[e]!).toList(),
    };

const _$UserRolesEnumMap = {
  UserRoles.manager: 'manager',
  UserRoles.user: 'user',
  UserRoles.editor: 'editor',
  UserRoles.viewer: 'viewer',
  UserRoles.developer: 'developer',
};

const _$PermissionsEnumMap = {
  Permissions.canEdit: 'canEdit',
  Permissions.canRead: 'canRead',
  Permissions.canEditMembers: 'canEditMembers',
  Permissions.canReadMembers: 'canReadMembers',
  Permissions.canEditMembershipFees: 'canEditMembershipFees',
  Permissions.canReadMembershipFees: 'canReadMembershipFees',
  Permissions.canEditBannedMembers: 'canEditBannedMembers',
  Permissions.canReadBannedMembers: 'canReadBannedMembers',
  Permissions.canEditFeedbacks: 'canEditFeedbacks',
  Permissions.canReadFeedbacks: 'canReadFeedbacks',
  Permissions.canEditGuests: 'canEditGuests',
  Permissions.canReadGuests: 'canReadGuests',
  Permissions.canEditManagers: 'canEditManagers',
  Permissions.canReadManagers: 'canReadManagers',
};
