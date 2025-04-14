import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/user_info_entity.dart';

class MemberInfoEntity extends UserInfoEntity {
  MemberInfoEntity({
    required this.mentor,
  });
  final UserInfoEntity? mentor;
}
