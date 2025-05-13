// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel(
      about: json['about'] as String?,
      workCity: json['workCity'] == null
          ? null
          : City.fromJson(json['workCity'] as Map<String, dynamic>),
      birthDate: json['birthDate'] == null
          ? DateTime.now()
          : FirebaseTimeParser.datetimeFromTimestamp(
              json['birthDate'] as Timestamp?),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      hobbies:
          (json['hobbies'] as List<dynamic>?)?.map((e) => e as String).toList(),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      livingCity: json['livingCity'] == null
          ? null
          : City.fromJson(json['livingCity'] as Map<String, dynamic>),
      memberNumber:
          UserModel.convertIntToString((json['memberNumber'] as num?)?.toInt()),
      phoneNumber: json['phoneNumber'] as String?,
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      membershipEndDate: json['membershipEndDate'] == null
          ? DateTime.now()
          : FirebaseTimeParser.datetimeFromTimestamp(
              json['membershipEndDate'] as Timestamp?),
      membershipStartDate: json['membershipStartDate'] == null
          ? DateTime.now()
          : FirebaseTimeParser.datetimeFromTimestamp(
              json['membershipStartDate'] as Timestamp?),
      mentatId: json['mentatId'] as String?,
      mentorId: json['mentorId'] as String?,
      mentors:
          (json['mentors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      occupation: json['occupation'] as String?,
      role: (json['role'] as List<dynamic>?)
          ?.map((e) => $enumDecodeNullable(_$RoleEnumMap, e))
          .toList(),
      uid: json['uid'] as String?,
      isStudent: json['isStudent'] as bool? ?? false,
      fee: (json['fee'] as num?)?.toDouble(),
      membershipType: json['membershipType'] == null
          ? null
          : Duration(microseconds: (json['membershipType'] as num).toInt()),
    );

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'memberNumber': UserModel.convertStringToInteger(instance.memberNumber),
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'about': instance.about,
      'birthDate': FirebaseTimeParser.dateTimeToTimestamp(instance.birthDate),
      'gender': _$GenderEnumMap[instance.gender],
      'livingCity': UserModel.cityToJson(instance.livingCity),
      'workCity': UserModel.cityToJson(instance.workCity),
      'occupation': instance.occupation,
      'hobbies': instance.hobbies,
      'interests': instance.interests,
      'mentorId': instance.mentorId,
      'mentatId': instance.mentatId,
      'mentors': instance.mentors,
      'members': instance.members,
      'role': instance.role?.map((e) => _$RoleEnumMap[e]).toList(),
      'phoneNumber': instance.phoneNumber,
      'membershipStartDate':
          FirebaseTimeParser.dateTimeToTimestamp(instance.membershipStartDate),
      'membershipEndDate':
          FirebaseTimeParser.dateTimeToTimestamp(instance.membershipEndDate),
      'isStudent': instance.isStudent,
      'fee': instance.fee,
      'membershipType': instance.membershipType?.inMicroseconds,
    };

const _$GenderEnumMap = {
  Gender.female: 'female',
  Gender.male: 'male',
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
