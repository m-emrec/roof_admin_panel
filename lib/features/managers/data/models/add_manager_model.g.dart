// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_manager_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddManagerModel _$AddManagerModelFromJson(Map<String, dynamic> json) =>
    AddManagerModel(
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$PermissionsEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$AddManagerModelToJson(AddManagerModel instance) {
  return <String, dynamic>{
    'name': instance.name,
    'email': instance.email,
    'permissions':
        instance.permissions?.map((e) => _$PermissionsEnumMap[e]!).toList(),
    'role': instance.role,
  };
}

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
