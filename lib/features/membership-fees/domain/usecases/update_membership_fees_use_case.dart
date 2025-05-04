import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/membership-fees/domain/entities/membership_fees_entity.dart';
import 'package:roof_admin_panel/features/membership-fees/domain/repositories/membership_fees_repository.dart';

///
class UpdateMembershipFeesUseCase
    extends UseCase<DataState<void>, MembershipFeesEntity> {
  ///
  UpdateMembershipFeesUseCase(this._repository);
  final MembershipFeesRepository _repository;
  @override
  Future<DataState<void>> call(MembershipFeesEntity params) {
    return _repository.updateMembershipRate(params);
  }
}
