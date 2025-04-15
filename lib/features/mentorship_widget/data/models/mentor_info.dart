import 'package:roof_admin_panel/features/mentorship_widget/data/models/base_user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/user_info_entity.dart';

class MentorInfo extends MentorInfoEntity implements AbstractUserInfo {
  MentorInfo({
    required this.members,
    required this.mentat,
  }) : super(
          members: members,
          mentat: mentat,
        );

  final UserInfoModel? mentat;
  final List<UserInfoModel?> members;

  factory MentorInfo.fromJson({
    required Map<String, dynamic>? mentatJson,
    required List<Map<String, dynamic>>? membersJson,
  }) {
    return MentorInfo(
      mentat: UserInfoModel.fromJson(mentatJson ?? const {}),
      members: membersJson?.map(UserInfoModel.fromJson).toList() ?? [],
    );
  }

  factory MentorInfo.fromEntity(
    MentorInfoEntity entity,
  ) {
    return MentorInfo(
      mentat: UserInfoModel.fromEntity(entity.mentat!),
      members: entity.members
          .map((member) => UserInfoModel.fromEntity(member as UserInfoEntity))
          .toList(),
    );
  }
}
