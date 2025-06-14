import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/features/managers/domain/entities/add_manager_entity.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
part 'add_manager_model.g.dart';

@JsonSerializable()

///
class AddManagerModel extends AddManagerEntity {
  ///
  AddManagerModel({
    required super.name,
    required super.email,
    required super.role,
    super.permissions,
  });

  ///
  factory AddManagerModel.fromEntity(AddManagerEntity entity) =>
      AddManagerModel(
        name: entity.name,
        email: entity.email,
        role: entity.role,
        permissions: entity.permissions,
      );

  @override
  String get role => super.role;

  ///
  Map<String, dynamic> toJson() => _$AddManagerModelToJson(this);

  AddManagerModel copyWith({
    String? name,
    String? email,
    String? role,
    List<Permissions>? permissions,
  }) {
    return AddManagerModel(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      permissions: permissions ?? this.permissions,
    );
  }

  ///
  AddManagerEntity toEntity() => AddManagerEntity(
        name: name,
        email: email,
        role: role,
        permissions: permissions,
      );
}
