import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/features/managers/domain/entities/add_manager_entity.dart';
part 'add_manager_model.g.dart';

@JsonSerializable()

///
class AddManagerModel extends AddManagerEntity {
  ///
  AddManagerModel({
    required super.name,
    required super.email,
    required super.role,
  });

  ///
  factory AddManagerModel.fromEntity(AddManagerEntity entity) =>
      AddManagerModel(
        name: entity.name,
        email: entity.email,
        role: entity.role,
      );

  @JsonKey(toJson: _createDocumentReferenceForManagerRole)
  @override
  String get role => super.role;

  static String _createDocumentReferenceForManagerRole(String roleId) {
    final doc = FirebaseFirestore.instance
        .doc('${CollectionEnum.managerRoles.name}/$roleId');
    return doc.path;
  }

  ///
  Map<String, dynamic> toJson() => _$AddManagerModelToJson(this);

  ///
  AddManagerEntity toEntity() => AddManagerEntity(
        name: name,
        email: email,
        role: role,
      );
}
