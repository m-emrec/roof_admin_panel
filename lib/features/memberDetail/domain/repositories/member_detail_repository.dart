import 'package:core/core.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/entities/membership_detail_entity.dart';

abstract class MemberDetailRepository {
  Future<DataState<void>> banMember({
    required UserModel memberData,
  });
  Future<DataState<void>> editMembershipDetails(
    EditedMembershipDetailEntity membershipDetails,
  );
}
