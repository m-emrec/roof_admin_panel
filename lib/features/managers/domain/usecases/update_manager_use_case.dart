import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/repositories/managers_repository.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';

///
class UpdateManagerUseCase extends UseCase<DataState<void>, ManagerModel> {
  ///
  UpdateManagerUseCase(this._repository);
  final ManagersRepository _repository;
  @override
  Future<DataState<void>> call(ManagerModel params) {
    return _repository.updateManager(params);
  }
}
