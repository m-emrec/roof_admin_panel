import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/repositories/managers_repository.dart';

///
class DeleteManagerUseCase extends UseCase<DataState<void>, String> {
  ///
  DeleteManagerUseCase(this._repository);
  final ManagersRepository _repository;
  @override
  Future<DataState<void>> call(String params) {
    return _repository.deleteManager(params);
  }
}
