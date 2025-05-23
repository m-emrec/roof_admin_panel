import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/managerRoles/data/datasources/manager_roles_service.dart';
import 'package:roof_admin_panel/features/managerRoles/domain/repositories/manager_roles_repository.dart';
import 'package:roof_admin_panel/product/utility/models/manager_role_model.dart';

///
class ManagerRolesRepositoryImpl implements ManagerRolesRepository {
  ///
  ManagerRolesRepositoryImpl(this._managerRolesService);

  final ManagerRolesService _managerRolesService;
  @override
  Future<DataState<void>> addManagerRole(ManagerRoleModel managerRoleModel) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<ManagerRoleModel>>> getManagerRoles() async {
    return DataState.handleDataState(
      () => _managerRolesService.getManagerRoles().then(
            (data) => data.map(ManagerRoleModel.fromJson).toList(),
          ),
    );
  }
}
