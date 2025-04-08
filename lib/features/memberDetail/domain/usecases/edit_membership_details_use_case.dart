import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/entities/membership_detail_entity.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/repositories/member_detail_repository.dart';

///
class EditMembershipDetailsUseCase
    extends UseCase<DataState<void>, EditedMembershipDetailEntity> {
  ///
  EditMembershipDetailsUseCase(this._repository);
  final MemberDetailRepository _repository;
  @override
  Future<DataState<void>> call(EditedMembershipDetailEntity params) {
    return _repository.editMembershipDetails(params);
  }
}
