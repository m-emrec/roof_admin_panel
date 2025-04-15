import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/base_user_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/user_info_entity.dart';

class MemberInfoEntity extends AbstractUserInfoEntity {
  MemberInfoEntity({
    required this.mentor,
  });
  final UserInfoEntity? mentor;
}
