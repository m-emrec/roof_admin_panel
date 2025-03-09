import 'package:core/resources/use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/managerRoles/data/datasources/manager_roles_service.dart';
import 'package:roof_admin_panel/features/managerRoles/data/repositories/manager_roles_repository_impl.dart';
import 'package:roof_admin_panel/features/managerRoles/domain/repositories/manager_roles_repository.dart';
import 'package:roof_admin_panel/features/managerRoles/domain/usecases/get_manager_roles_use_case.dart';
import 'package:roof_admin_panel/product/utility/models/manager_role_model.dart';

final _managerRolesServiceProvider = Provider<ManagerRolesService>((ref) {
  return ManagerRolesService();
});

final _repositoryProvider = Provider<ManagerRolesRepository>((ref) {
  return ManagerRolesRepositoryImpl(ref.read(_managerRolesServiceProvider));
});

final _getManagerRolesUseCaseProvider = Provider<GetManagerRolesUseCase>((ref) {
  return GetManagerRolesUseCase(ref.read(_repositoryProvider));
});

///
final getManagerRolesProvider =
    FutureProvider.autoDispose<List<ManagerRoleModel>>((ref) async {
  final managerRoles =
      await ref.read(_getManagerRolesUseCaseProvider)(const NoParams());
  return managerRoles.resultData ?? [];
});
