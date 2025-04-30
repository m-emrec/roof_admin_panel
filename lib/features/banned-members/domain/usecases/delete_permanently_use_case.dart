import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/banned-members/domain/repositories/banned_members_repository.dart';

///
class DeletePermanentlyUseCase extends UseCase<DataState<void>, String> {
  ///
  DeletePermanentlyUseCase(this._repository);
  final BannedMembersRepository _repository;
  @override
  Future<DataState<void>> call(String params) {
    return _repository.deletePermanently(params);
  }
}
