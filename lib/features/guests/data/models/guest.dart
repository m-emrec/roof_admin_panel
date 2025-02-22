// ignore_for_file: public_member_api_docs

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:roof_admin_panel/features/guests/domain/entities/guest_entity.dart';

part 'guest.g.dart';

///
@JsonSerializable()
class Guest extends GuestEntity {
  ///
  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  /// Guest model
  Guest({
    super.id,
    super.phoneNumber,
    super.gender,
    this.guestStartDate,
    super.joinedEventCount,
    super.name,
    super.role,
  }) : super(
          guestStartDate: guestStartDate,
        );

  ///
  factory Guest.fromEntity(GuestEntity entity) {
    return Guest(
      id: entity.id,
      phoneNumber: entity.phoneNumber,
      gender: entity.gender,
      guestStartDate: entity.guestStartDate,
      joinedEventCount: entity.joinedEventCount,
      name: entity.name,
      role: entity.role,
    );
  }

  @override
  @JsonKey(
    fromJson: FirebaseTimeParser.datetimeFromTimestamp,
    toJson: FirebaseTimeParser.dateTimeToTimestamp,
    defaultValue: null,
  )
  final DateTime? guestStartDate;

  ///
  GuestEntity toEntity() {
    return GuestEntity(
      id: id,
      phoneNumber: phoneNumber,
      gender: gender,
      guestStartDate: guestStartDate,
      joinedEventCount: joinedEventCount,
      name: name,
      role: role,
    );
  }

  Map<String, dynamic> toJson() => _$GuestToJson(this);

  ///
  Guest copyWith({
    String? id,
    String? phoneNumber,
    Gender? gender,
    DateTime? guestStartDate,
    int? joinedEventCount,
    String? name,
    List<Role>? role,
  }) {
    return Guest(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      guestStartDate: guestStartDate ?? this.guestStartDate,
      joinedEventCount: joinedEventCount ?? this.joinedEventCount,
      name: name ?? this.name,
      role: role ?? this.role,
    );
  }
}
