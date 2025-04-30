// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banned_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannedMemberModel _$BannedMemberModelFromJson(Map<String, dynamic> json) =>
    BannedMemberModel(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      bannedDate: FirebaseTimeParser.datetimeFromTimestamp(
          json['bannedDate'] as Timestamp?),
      reason: json['reason'] as String?,
      imageUrl: json['imageUrl'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$BannedMemberModelToJson(BannedMemberModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'imageUrl': instance.imageUrl,
      'reason': instance.reason,
      'bannedDate': FirebaseTimeParser.dateTimeToTimestamp(instance.bannedDate),
    };
