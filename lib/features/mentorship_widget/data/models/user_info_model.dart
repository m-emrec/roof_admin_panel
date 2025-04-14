import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/user_info_entity.dart';
part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel extends UserInfoEntity {
  factory UserInfoModel.fromJson(Map<String, dynamic>? json) =>
      _$UserInfoModelFromJson(json ?? const {});
  UserInfoModel({
    super.uid,
    super.name,
    super.imageUrl,
  });

  factory UserInfoModel.fromEntity(UserInfoEntity entity) {
    return UserInfoModel(
      uid: entity.uid,
      name: entity.name,
      imageUrl: entity.imageUrl,
    );
  }
}
