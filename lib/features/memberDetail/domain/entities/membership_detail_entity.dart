import 'package:core/utils/constants/enums/roles.dart';

class EditedMembershipDetailEntity {
  EditedMembershipDetailEntity({
    required this.uid,
    required this.memberNumber,
    required this.membershipStartDate,
    required this.membershipEndDate,
    required this.role,
  });

  final String uid;
  final String? memberNumber;
  final DateTime? membershipStartDate;
  final DateTime? membershipEndDate;
  final Role? role;
}
