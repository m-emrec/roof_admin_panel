import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/memberDetail/data/datasources/membership_detail_service.dart';
import 'package:roof_admin_panel/features/memberDetail/data/models/membership_detail_model.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/entities/membership_detail_entity.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/repositories/member_detail_repository.dart';

class MembershipDetailRepositoryImpl implements MemberDetailRepository {
  final MembershipDetailService _service;
  MembershipDetailRepositoryImpl(this._service);
  @override
  Future<DataState<void>> banMember({required String memberId}) {
    // TODO: implement banMember
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> changeMentat({
    required String memberId,
    required String newMentatId,
  }) {
    // TODO: implement changeMentat
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> changeMentor(
      {required String memberId, required String newMentorId}) {
    // TODO: implement changeMentor
    throw UnimplementedError();
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

  @override
  Future<DataState<void>> fetchMentats() {
    // TODO: implement fetchMentats
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> fetchMentors() {
    // TODO: implement fetchMentors
    throw UnimplementedError();
  }
}
