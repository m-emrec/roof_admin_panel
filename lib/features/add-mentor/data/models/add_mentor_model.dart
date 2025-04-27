import 'package:core/utils/constants/enums/roles.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/entities/user_entity.dart';

class AddMentorModel extends AddMentorEntity {
  AddMentorModel({
    required super.uid,
    required super.name,
    super.memberCount,
    super.imageUrl,
  });

  factory AddMentorModel.fromJson(Map<String, dynamic> json) {
    return AddMentorModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
      memberCount: _getMemberCount(json),
    );
  }

  static int? _getMemberCount(Map<String, dynamic> json) {
    if ((json["role"] as List?)?.contains(Role.mentor.name) ?? false) {
      return (json["members"] as List?)?.length;
    } else if ((json["roles"] as List?)?.contains(Role.mentat.name) ?? false) {
      return (json["mentors"] as List?)?.length;
    }
    return null;
  }

  factory AddMentorModel.fromEntity(AddMentorEntity entity) {
    return AddMentorModel(
      uid: entity.uid,
      name: entity.name,
      memberCount: entity.memberCount,
      imageUrl: entity.imageUrl,
    );
  }

  AddMentorEntity toEntity() {
    return AddMentorEntity(
      uid: uid,
      name: name,
      memberCount: memberCount,
      imageUrl: imageUrl,
    );
  }
}
