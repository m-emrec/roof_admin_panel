import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/base_user_info_entity.dart';

class UserInfoEntity extends AbstractUserInfoEntity {
  UserInfoEntity({
    this.uid,
    this.name,
    this.imageUrl,
  });

  final String? uid;

  final String? name;
  final String? imageUrl;
}
