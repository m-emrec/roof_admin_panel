// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) => Guest(
      id: json['id'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      guestStartDate: FirebaseTimeParser.datetimeFromTimestamp(
          json['guestStartDate'] as Timestamp?),
      joinedEventCount: (json['joinedEventCount'] as num?)?.toInt(),
      name: json['name'] as String?,
      role: (json['role'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$RoleEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'gender': _$GenderEnumMap[instance.gender],
      'joinedEventCount': instance.joinedEventCount,
      'name': instance.name,
      'role': instance.role?.map((e) => _$RoleEnumMap[e]!).toList(),
      'guestStartDate':
          FirebaseTimeParser.dateTimeToTimestamp(instance.guestStartDate),
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
