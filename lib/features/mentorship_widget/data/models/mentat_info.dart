import 'package:roof_admin_panel/features/mentorship_widget/data/models/base_user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentat_info_entity.dart';

class MentatInfo extends MentatInfoEntity implements BaseUserInfo {
  MentatInfo({
    required this.mentors,
  }) : super(
          mentors: mentors,
        );

  final List<UserInfoModel?> mentors;

  factory MentatInfo.fromJson(List<Map<String, dynamic>> json) => MentatInfo(
        mentors: json.map(UserInfoModel.fromJson).toList(),
      );
  factory MentatInfo.fromEntity(MentatInfoEntity entity) {
    return MentatInfo(
      mentors: entity.mentors
          .map((mentor) => UserInfoModel.fromEntity(mentor as UserInfoModel))
          .toList(),
    );
  }
}
