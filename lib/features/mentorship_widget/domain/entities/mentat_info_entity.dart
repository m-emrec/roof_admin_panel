import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/base_user_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/user_info_entity.dart';

class MentatInfoEntity extends AbstractUserInfoEntity {
  MentatInfoEntity({
    required this.mentors,
  });
  final List<UserInfoEntity?> mentors;
}
