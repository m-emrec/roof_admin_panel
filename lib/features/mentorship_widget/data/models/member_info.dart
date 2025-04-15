import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/base_user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/member_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/user_info_entity.dart';
part 'member_info.g.dart';

@JsonSerializable()
class MemberInfo extends MemberInfoEntity implements BaseUserInfo {
  MemberInfo({
    this.mentor,
  }) : super(
          mentor: mentor,
        );

  @JsonKey(
    fromJson: UserInfoModel.fromJson,
    toJson: _userInfoToJson,
  )
  final UserInfoModel? mentor;

  factory MemberInfo.fromJson(
    Map<String, dynamic>? json,
  ) {
    return MemberInfo(
      mentor: UserInfoModel.fromJson(json),
    );
  }

  static Map<String, dynamic>? _userInfoToJson(UserInfoEntity? user) {
    return null;
  }

  factory MemberInfo.fromEntity(MemberInfoEntity entity) {
    return MemberInfo(
      mentor: UserInfoModel.fromEntity(entity.mentor!),
    );
  }
}
