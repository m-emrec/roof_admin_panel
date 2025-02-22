// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/utils/constants/enums/gender.dart';
import 'package:core/utils/constants/enums/roles.dart';

class GuestEntity {
  final String? id;
  final String? phoneNumber;
  final Gender? gender;
  final DateTime? guestStartDate;
  final int? joinedEventCount;
  final String? name;
  final List<Role>? role;
  GuestEntity({
    this.id,
    this.role,
    this.phoneNumber,
    this.gender,
    this.guestStartDate,
    this.joinedEventCount,
    this.name,
  });
}
