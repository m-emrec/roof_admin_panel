import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/managers/data/datasources/managers_database_service.dart';
import 'package:roof_admin_panel/features/managers/data/models/add_manager_model.dart';
import 'package:roof_admin_panel/features/managers/domain/entities/add_manager_entity.dart';
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
  Future<DataState<void>> addManager(AddManagerEntity manager) {
    return DataState.handleDataState(
      () async => _managersDatabaseService
          .addManager(AddManagerModel.fromEntity(manager).toJson()),
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
    final data = AddManagerModel(
      email: updatedManager.email,
      name: updatedManager.name,
      role: updatedManager.role.id,
      permissions: updatedManager.role.permissions,
    );
    return DataState.handleDataState(
      () => _managersDatabaseService.updateManager(
          data.toJson()..putIfAbsent("uid", () => updatedManager.uid)),
    );
  }
}
