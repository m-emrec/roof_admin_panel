import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/managers/data/datasources/managers_database_service.dart';
import 'package:roof_admin_panel/features/managers/domain/repositories/managers_repository.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';

///
class ManagersRepositoryImpl implements ManagersRepository {
  ///
  ManagersRepositoryImpl(
    this._managersDatabaseService,
  );

  final ManagersDatabaseService _managersDatabaseService;
  @override
  Future<DataState<void>> addManager(ManagerModel manager) {
    return DataState.handleDataState(
      () => _managersDatabaseService.addManager(manager.toJson()),
    );
  }

  @override
  Future<DataState<void>> deleteManager(String id) {
    return DataState.handleDataState(
      () => _managersDatabaseService.deleteManager(id),
    );
  }

  @override
  Future<DataState<List<ManagerModel>>> getManagers() {
    return DataState.handleDataState(
      () => _managersDatabaseService.getManagers().then(
            (managers) => managers.map(ManagerModel.fromJson).toList(),
          ),
    );
  }

  @override
  Future<DataState<void>> updateManager(ManagerModel updatedManager) {
    return DataState.handleDataState(
      () => _managersDatabaseService.updateManager(updatedManager.toJson()),
    );
  }
}
