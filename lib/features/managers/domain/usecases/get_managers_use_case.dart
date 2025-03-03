import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/repositories/managers_repository.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';

///
class GetManagersUseCase
    extends UseCase<DataState<List<ManagerModel>>, NoParams> {
  ///
  GetManagersUseCase(this._repository);
  final ManagersRepository _repository;
  @override
  Future<DataState<List<ManagerModel>>> call(NoParams params) {
    return _repository.getManagers();
  }
}
