import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/base_user_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/user_info_entity.dart';

class MentorInfoEntity extends BaseUserInfoEntity {
  MentorInfoEntity({
    required this.members,
    required this.mentat,
  });

  final List<UserInfoEntity?> members;
  final UserInfoEntity? mentat;
}
