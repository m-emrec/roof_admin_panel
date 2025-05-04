import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/membership-fees/data/datasources/membership_fees_service.dart';
import 'package:roof_admin_panel/features/membership-fees/data/models/membership_fees.dart';
import 'package:roof_admin_panel/features/membership-fees/domain/entities/membership_fees_entity.dart';
import 'package:roof_admin_panel/features/membership-fees/domain/repositories/membership_fees_repository.dart';

class MembershipFeesRepositoryImpl implements MembershipFeesRepository {
  MembershipFeesRepositoryImpl(this._membershipFeesService);

  final MembershipFeesService _membershipFeesService;
  @override
  Future<DataState<MembershipFeesEntity>> getMembershipRates() async {
    return DataState.handleDataState(
      () async => MembershipFees.fromJson(
        await _membershipFeesService.getMembershipFees() ?? {},
      ).toEntity(),
    );
  }

  @override
  Future<DataState<void>> updateMembershipRate(
    MembershipFeesEntity membershipRate,
  ) {
    return DataState.handleDataState(
      () async => _membershipFeesService.updateMembershipFee(
        MembershipFees.fromEntity(membershipRate).toJson(),
      ),
    );
  }
}
