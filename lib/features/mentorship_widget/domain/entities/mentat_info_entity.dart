import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/user_info_entity.dart';

class MentatInfoEntity extends UserInfoEntity {
  MentatInfoEntity({
    required this.mentors,
  });
  final List<UserInfoEntity?> mentors;
}
