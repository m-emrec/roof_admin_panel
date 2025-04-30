import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/utils/constants/firebase/time_parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/features/banned-members/domain/entities/banned_member_entity.dart';
part 'banned_member_model.g.dart';

@JsonSerializable()
class BannedMemberModel extends BannedMemberEntity {
  BannedMemberModel({
    required super.name,
    required super.phoneNumber,
    required super.bannedDate,
    super.reason,
    super.imageUrl,
    super.uid,
  });
  @JsonKey(
    fromJson: FirebaseTimeParser.datetimeFromTimestamp,
    toJson: FirebaseTimeParser.dateTimeToTimestamp,
  )
  @override
  DateTime? get bannedDate => super.bannedDate;

  factory BannedMemberModel.fromJson(Map<String, dynamic> json) =>
      _$BannedMemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannedMemberModelToJson(this);

  factory BannedMemberModel.fromEntity(
    BannedMemberEntity entity,
  ) {
    return BannedMemberModel(
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      bannedDate: entity.bannedDate,
      reason: entity.reason,
      imageUrl: entity.imageUrl,
      uid: entity.uid,
    );
  }
}
