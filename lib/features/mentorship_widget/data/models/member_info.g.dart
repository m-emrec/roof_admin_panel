// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberInfo _$MemberInfoFromJson(Map<String, dynamic> json) => MemberInfo(
      mentor: UserInfoModel.fromJson(json['mentor'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$MemberInfoToJson(MemberInfo instance) =>
    <String, dynamic>{
      'mentor': MemberInfo._userInfoToJson(instance.mentor),
    };
