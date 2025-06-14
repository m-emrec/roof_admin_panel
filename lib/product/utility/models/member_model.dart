import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/utils/constants/enums/gender.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/constants/firebase/time_parser.dart';
import 'package:core/utils/models/city_model.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

@JsonSerializable()
class MemberModel extends UserModel {
  MemberModel({
    super.about,
    super.workCity,
    super.birthDate,
    super.gender,
    super.hobbies,
    super.interests,
    super.imageUrl,
    super.name,
    super.livingCity,
    super.memberNumber,
    super.phoneNumber,
    super.members,
    super.membershipEndDate,
    super.membershipStartDate,
    super.mentatId,
    super.mentorId,
    super.mentors,
    super.occupation,
    super.role,
    super.uid,
    this.isStudent = false,
    this.fee,
    this.membershipType,
  });

  @override
  MemberModel copyWith({
    String? uid,
    String? imageUrl,
    String? name,
    String? about,
    DateTime? birthDate,
    Gender? gender,
    City? livingCity,
    City? workCity,
    String? occupation,
    List<String>? hobbies,
    List<String>? interests,
    String? mentorId,
    String? mentatId,
    List<String>? members,
    List<Role?>? role,
    DateTime? membershipStartDate,
    DateTime? membershipEndDate,
    String? phoneNumber,
    List<String>? mentors,
    String? memberNumber,
    bool? isStudent,
    double? fee,
    int? membershipType,
  }) {
    return MemberModel(
      uid: uid ?? this.uid,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      about: about ?? this.about,
      birthDate: birthDate ?? this.birthDate,
      fee: fee ?? this.fee,
      gender: gender ?? this.gender,
      livingCity: livingCity ?? this.livingCity,
      workCity: workCity ?? this.workCity,
      occupation: occupation ?? this.occupation,
      hobbies: hobbies ?? this.hobbies,
      interests: interests ?? this.interests,
      mentorId: mentorId ?? this.mentorId,
      mentatId: mentatId ?? this.mentatId,
      members: members ?? this.members,
      mentors: mentors ?? this.mentors,
      role: role ?? this.role,
      membershipStartDate: membershipStartDate ?? this.membershipStartDate,
      membershipEndDate: membershipEndDate ?? this.membershipEndDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      memberNumber: memberNumber ?? this.memberNumber,
      isStudent: isStudent ?? this.isStudent,
      membershipType: membershipType ?? this.membershipType,
    );
  }

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$MemberModelToJson(this);

  final bool isStudent;
  final double? fee;
  final int? membershipType;
}
