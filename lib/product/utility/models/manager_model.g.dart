// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagerModel _$ManagerModelFromJson(Map<String, dynamic> json) => ManagerModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      role: ManagerRoleModel.fromJson(json['role'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ManagerModelToJson(ManagerModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'role':
          ManagerModel._createDocumentReferenceForManagerRole(instance.role),
      'imageUrl': instance.imageUrl,
    };
