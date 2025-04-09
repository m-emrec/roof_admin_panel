import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_entity.dart';
part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel extends UserInfoEntity {
  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
  UserInfoModel({
    required super.uid,
    required super.name,
    super.imageUrl,
  });

  factory UserInfoModel.fromEntity(UserInfoEntity entity) {
    return UserInfoModel(
      uid: entity.uid,
      name: entity.name,
      imageUrl: entity.imageUrl,
    );
  }

  UserInfoEntity toEntity() {
    return UserInfoEntity(
      uid: uid,
      name: name,
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
