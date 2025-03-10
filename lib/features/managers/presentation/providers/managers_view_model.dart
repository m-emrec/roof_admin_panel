import 'package:core/core.dart';
import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/add_manager_use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/delete_manager_use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/get_managers_use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/update_manager_use_case.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';
import 'package:roof_admin_panel/product/utility/models/manager_role_model.dart';

class ManagersViewModel extends StateNotifier<AsyncValue<List<ManagerModel>>> {
  ManagersViewModel({
    required GetManagersUseCase getManagersUseCase,
    required DeleteManagerUseCase deleteManagerUseCase,
    required UpdateManagerUseCase updateManagerUseCase,
    required AddManagerUseCase addManagerUseCase,
  })  : _addManagerUseCase = addManagerUseCase,
        _updateManagerUseCase = updateManagerUseCase,
        _deleteManagerUseCase = deleteManagerUseCase,
        _getManagersUseCase = getManagersUseCase,
        super(const AsyncValue.loading()) {
    getManagers();
  }

  final GetManagersUseCase _getManagersUseCase;
  final DeleteManagerUseCase _deleteManagerUseCase;
  final UpdateManagerUseCase _updateManagerUseCase;
  final AddManagerUseCase _addManagerUseCase;

  ///
  Future<void> getManagers() async {
    state = const AsyncValue.loading();
    DataState.handleDataStateBasedAction(
      await _getManagersUseCase(const NoParams()),
      onSuccess: (data) => state = AsyncValue.data(data.resultData ?? []),
      onFailure: (error) => state =
          AsyncValue.error(error?.errorMessage ?? "", StackTrace.current),
    );
  }

  ///
  Future<void> editManager(
    String newRoleId,
    ManagerModel manager,
  ) async {
    final updatedManager = manager.copyWith(
      role: ManagerRoleModel(
        name: "name",
        id: newRoleId,
        permissions: [],
      ),
    );
    DataState.handleDataStateBasedAction(
      await _updateManagerUseCase(updatedManager),
      onSuccess: (_) => getManagers(),
      onFailure: (p0) => null,
    );
  }
}
