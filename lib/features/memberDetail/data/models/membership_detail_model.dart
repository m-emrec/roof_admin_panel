import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/constants/firebase/time_parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/entities/membership_detail_entity.dart';

part 'membership_detail_model.g.dart';

/// [EditedMembershipDetail] is a model class that represents the details of a membership.
/// It extends the [EditedMembershipDetailEntity] class and provides
/// serialization and deserialization functionality using the [JsonSerializable] annotation.
/// It contains fields for the user's unique identifier (uid), member number,
/// membership start date, membership end date, and role.
/// The class also includes a factory constructor to create an instance from an entity
/// and a method to convert the model back to an entity.
@JsonSerializable()
class EditedMembershipDetail extends EditedMembershipDetailEntity {
  /// Constructor for [EditedMembershipDetail].
  /// It requires the user's unique identifier (uid), member number,
  /// membership start date, membership end date, and role.
  /// The [membershipStartDate] and [membershipEndDate] fields are parsed
  /// from and to Firestore timestamps using the [FirebaseTimeParser].
  EditedMembershipDetail({
    required super.uid,
    required super.memberNumber,
    required super.membershipStartDate,
    required super.membershipEndDate,
    required super.role,
    super.mentorId,
    super.mentatId,
    super.members,
    super.mentors,
  });

  /// a factory constructor to create an instance of [EditedMembershipDetail]
  /// from [EditedMembershipDetailEntity].
  factory EditedMembershipDetail.fromEntity(
    EditedMembershipDetailEntity entity,
  ) {
    return EditedMembershipDetail(
      uid: entity.uid,
      memberNumber: entity.memberNumber,
      membershipStartDate: entity.membershipStartDate,
      membershipEndDate: entity.membershipEndDate,
      role: entity.role,
      mentorId: entity.mentorId,
      mentatId: entity.mentatId,
      members: entity.members,
      mentors: entity.mentors,
    );
  }

  @override
  @JsonKey(
    toJson: _roleToJson,
  )
  Role? get role => super.role;

  @JsonKey(toJson: _memberNumberToJson)
  @override
  String? get memberNumber => super.memberNumber;

  @JsonKey(
    fromJson: FirebaseTimeParser.datetimeFromTimestamp,
    toJson: FirebaseTimeParser.dateTimeToTimestamp,
  )
  @override
  DateTime? get membershipStartDate => super.membershipStartDate;
  @JsonKey(
    fromJson: FirebaseTimeParser.datetimeFromTimestamp,
    toJson: FirebaseTimeParser.dateTimeToTimestamp,
  )
  @override
  DateTime? get membershipEndDate => super.membershipEndDate;

  /// This method is used to convert the model back to an entity.
  EditedMembershipDetailEntity toEntity() {
    return EditedMembershipDetailEntity(
      uid: uid,
      memberNumber: memberNumber,
      membershipStartDate: membershipStartDate,
      membershipEndDate: membershipEndDate,
      role: role,
    );
  }

  ///
  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() => _$EditedMembershipDetailToJson(this);

  ///
  static int _memberNumberToJson(String? memberNumber) {
    return int.tryParse(memberNumber ?? "") ?? 0;
  }

  ///
  static List<String?> _roleToJson(Role? role) {
    if (role == null) {
      return [];
    }

    return [_$RoleEnumMap[role]];
  }
}
