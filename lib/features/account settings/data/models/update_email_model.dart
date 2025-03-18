// ignore_for_file: public_member_api_docs

import 'package:roof_admin_panel/features/account%20settings/domain/entities/update_email_entity.dart';

class UpdateEmailModel extends UpdateEmailEntity {
  UpdateEmailModel({required super.email, required super.uid});

  factory UpdateEmailModel.fromEntity(UpdateEmailEntity entity) {
    return UpdateEmailModel(email: entity.email, uid: entity.uid);
  }

  UpdateEmailEntity toEntity() {
    return UpdateEmailEntity(email: email, uid: uid);
  }
}
