// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
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
  @JsonKey(
    toJson: _createDocumentReferenceForManagerRole,
    fromJson: ManagerRoleModel.fromJson,
  )
  final ManagerRoleModel role;
  final String? imageUrl;
  static DocumentReference<Map<String, dynamic>>
      _createDocumentReferenceForManagerRole(ManagerRoleModel role) {
    final doc = FirebaseFirestore.instance
        .doc("${CollectionEnum.managerRoles.name}/${role.id}");
    return doc;
  }

  factory ManagerModel.fromJson(Map<String, dynamic> json) =>
      _$ManagerModelFromJson(json);
  Map<String, dynamic> toJson() => _$ManagerModelToJson(this);

  ManagerModel copyWith({
    String? uid,
    String? email,
    String? name,
    ManagerRoleModel? role,
    String? imageUrl,
  }) {
    return ManagerModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
