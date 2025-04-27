import 'package:core/core.dart';
import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/memberDetail/data/datasources/membership_detail_service.dart';
import 'package:roof_admin_panel/features/memberDetail/data/models/membership_detail_model.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/entities/membership_detail_entity.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/repositories/member_detail_repository.dart';

class MembershipDetailRepositoryImpl implements MemberDetailRepository {
  MembershipDetailRepositoryImpl(this._service);
  final MembershipDetailService _service;
  @override
  Future<DataState<void>> banMember({required UserModel memberData}) {
    return DataState.handleDataState(
      () async {
        await _service.banMember(
          memberData: memberData.toJson(),
        );
      },
    );
  }

  @override
  Future<DataState<void>> editMembershipDetails(
    EditedMembershipDetailEntity membershipDetails,
  ) {
    return DataState.handleDataState(
      () async {
        await _service.editMembershipDetails(
          EditedMembershipDetail.fromEntity(membershipDetails).toJson(),
        );
      },
    );
  }
}
