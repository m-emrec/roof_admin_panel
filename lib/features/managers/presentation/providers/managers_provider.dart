import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/managers/data/datasources/managers_database_service.dart';
import 'package:roof_admin_panel/features/managers/data/repositories/managers_repository_impl.dart';
import 'package:roof_admin_panel/features/managers/domain/repositories/managers_repository.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/add_manager_use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/delete_manager_use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/get_managers_use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/update_manager_use_case.dart';
import 'package:roof_admin_panel/features/managers/presentation/providers/managers_view_model.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';

final _managersDatabaseService = Provider<ManagersDatabaseService>((ref) {
  return ManagersDatabaseService();
});

final _repositoryProvider = Provider<ManagersRepository>((ref) {
  return ManagersRepositoryImpl(ref.read(_managersDatabaseService));
});

final _getManagersUseCaseProvider = Provider<GetManagersUseCase>((ref) {
  return GetManagersUseCase(ref.read(_repositoryProvider));
});

final _deleteManagerUseCaseProvider = Provider<DeleteManagerUseCase>((ref) {
  return DeleteManagerUseCase(ref.read(_repositoryProvider));
});

final _updateManagerUseCaseProvider = Provider<UpdateManagerUseCase>((ref) {
  return UpdateManagerUseCase(ref.read(_repositoryProvider));
});

final _addManagerUseCaseProvider = Provider<AddManagerUseCase>((ref) {
  return AddManagerUseCase(ref.read(_repositoryProvider));
});

///
final managersViewModelProvider =
    StateNotifierProvider<ManagersViewModel, AsyncValue<List<ManagerModel>>>(
        (ref) {
  return ManagersViewModel(
    getManagersUseCase: ref.read(_getManagersUseCaseProvider),
    deleteManagerUseCase: ref.read(_deleteManagerUseCaseProvider),
    updateManagerUseCase: ref.read(_updateManagerUseCaseProvider),
    addManagerUseCase: ref.read(_addManagerUseCaseProvider),
  );
});
