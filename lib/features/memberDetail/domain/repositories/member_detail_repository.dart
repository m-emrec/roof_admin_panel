import 'package:core/core.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/entities/membership_detail_entity.dart';

abstract class MemberDetailRepository {
  Future<DataState<void>> banMember({
    required String memberId,
  });
  Future<DataState<void>> editMembershipDetails(
    EditedMembershipDetailEntity membershipDetails,
  );

  Future<DataState<void>> changeMentor({
    required String memberId,
    required String newMentorId,
  });

  Future<DataState<void>> changeMentat({
    required String memberId,
    required String newMentatId,
  });

  Future<DataState<void>> fetchMentors();
  Future<DataState<void>> fetchMentats();
}
