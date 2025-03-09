import 'package:core/core.dart';
import 'package:roof_admin_panel/product/utility/models/manager_role_model.dart';

/// ManagerRolesRepository is an abstract class that defines the methods that
/// must be implemented by the ManagerRolesRepositoryImpl class.
///
///
abstract class ManagerRolesRepository {
  ///
  Future<DataState<List<ManagerRoleModel>>> getManagerRoles();

  ///
  Future<DataState<void>> addManagerRole(ManagerRoleModel managerRoleModel);
}
