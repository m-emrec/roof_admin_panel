import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/constants/firebase/time_parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/entities/membership_detail_entity.dart';

part 'membership_detail_model.g.dart';

@JsonSerializable()
class EditedMembershipDetail extends EditedMembershipDetailEntity {
  EditedMembershipDetail({
    required super.uid,
    required super.memberNumber,
    required this.membershipStartDate,
    required this.membershipEndDate,
    required super.role,
  }) : super(
          membershipEndDate: membershipEndDate,
          membershipStartDate: membershipStartDate,
        );

  @JsonKey(
    fromJson: FirebaseTimeParser.datetimeFromTimestamp,
    toJson: FirebaseTimeParser.dateTimeToTimestamp,
  )
  @override
  final DateTime? membershipStartDate;
  @JsonKey(
    fromJson: FirebaseTimeParser.datetimeFromTimestamp,
    toJson: FirebaseTimeParser.dateTimeToTimestamp,
  )
  @override
  final DateTime? membershipEndDate;

  factory EditedMembershipDetail.fromEntity(
    EditedMembershipDetailEntity entity,
  ) {
    return EditedMembershipDetail(
      uid: entity.uid,
      memberNumber: entity.memberNumber,
      membershipStartDate: entity.membershipStartDate,
      membershipEndDate: entity.membershipEndDate,
      role: entity.role,
    );
  }

  EditedMembershipDetailEntity toEntity() {
    return EditedMembershipDetailEntity(
      uid: uid,
      memberNumber: memberNumber,
      membershipStartDate: membershipStartDate,
      membershipEndDate: membershipEndDate,
      role: role,
    );
  }
}
