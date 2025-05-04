import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/membership-fees/domain/entities/membership_fees_entity.dart';

abstract class MembershipFeesRepository {
  Future<DataState<MembershipFeesEntity>> getMembershipRates();

  Future<DataState<void>> updateMembershipRate(
    MembershipFeesEntity membershipRate,
  );
}
