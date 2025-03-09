import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/managerRoles/domain/repositories/manager_roles_repository.dart';
import 'package:roof_admin_panel/product/utility/models/manager_role_model.dart';

///
class GetManagerRolesUseCase
    extends UseCase<DataState<List<ManagerRoleModel>>, NoParams> {
  ///
  GetManagerRolesUseCase(this._repository);
  final ManagerRolesRepository _repository;
  @override
  Future<DataState<List<ManagerRoleModel>>> call(NoParams params) {
    return _repository.getManagerRoles();
  }
}
