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
    );

Map<String, dynamic> _$AddManagerModelToJson(AddManagerModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'role': AddManagerModel._getDocumentPathOfManagerRole(instance.role),
    };
