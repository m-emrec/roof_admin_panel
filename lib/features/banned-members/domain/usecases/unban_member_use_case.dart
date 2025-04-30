import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/banned-members/domain/repositories/banned_members_repository.dart';

///
class UnbanUseCase extends UseCase<DataState<void>, String> {
  ///
  UnbanUseCase(this._repository);
  final BannedMembersRepository _repository;
  @override
  Future<DataState<void>> call(String params) {
    return _repository.unbanMember(params);
  }
}
