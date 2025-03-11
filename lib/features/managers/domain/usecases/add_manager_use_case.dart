import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/entities/add_manager_entity.dart';
import 'package:roof_admin_panel/features/managers/domain/repositories/managers_repository.dart';

///
class AddManagerUseCase extends UseCase<DataState<void>, AddManagerEntity> {
  ///
  AddManagerUseCase(this._repository);
  final ManagersRepository _repository;
  @override
  Future<DataState<void>> call(AddManagerEntity params) {
    return _repository.addManager(params);
  }
}
