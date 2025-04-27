// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditedMembershipDetail _$EditedMembershipDetailFromJson(
        Map<String, dynamic> json) =>
    EditedMembershipDetail(
      uid: json['uid'] as String,
      memberNumber: json['memberNumber'] as String?,
      membershipStartDate: FirebaseTimeParser.datetimeFromTimestamp(
          json['membershipStartDate'] as Timestamp?),
      membershipEndDate: FirebaseTimeParser.datetimeFromTimestamp(
          json['membershipEndDate'] as Timestamp?),
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      mentorId: json['mentorId'] as String?,
      mentatId: json['mentatId'] as String?,
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      mentors:
          (json['mentors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EditedMembershipDetailToJson(
        EditedMembershipDetail instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'mentorId': instance.mentorId,
      'mentatId': instance.mentatId,
      'members': instance.members,
      'mentors': instance.mentors,
      'role': EditedMembershipDetail._roleToJson(instance.role),
      'memberNumber':
          EditedMembershipDetail._memberNumberToJson(instance.memberNumber),
      'membershipStartDate':
          FirebaseTimeParser.dateTimeToTimestamp(instance.membershipStartDate),
      'membershipEndDate':
          FirebaseTimeParser.dateTimeToTimestamp(instance.membershipEndDate),
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.member: 'member',
  Role.guest: 'guest',
  Role.approvedGuest: 'approvedGuest',
  Role.mentat: 'mentat',
  Role.mentor: 'mentor',
  Role.other: 'other',
};
