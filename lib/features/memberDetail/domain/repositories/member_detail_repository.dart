import 'package:core/core.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/entities/membership_detail_entity.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

abstract class MemberDetailRepository {
  Future<DataState<void>> banMember({
    required MemberModel memberData,
  });
  Future<DataState<void>> editMembershipDetails(
    EditedMembershipDetailEntity membershipDetails,
  );
}
