import 'package:core/core.dart';
import 'package:core/resources/data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/add_manager_use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/delete_manager_use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/get_managers_use_case.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/update_manager_use_case.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';

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

  Future<void> getManagers() async {
    state = const AsyncValue.loading();
    DataState.handleDataStateBasedAction(
      await _getManagersUseCase(const NoParams()),
      onSuccess: (p0) => state = AsyncValue.data(p0.resultData ?? []),
      onFailure: (p0) =>
          state = AsyncValue.error(p0?.errorMessage ?? "", StackTrace.current),
    );
  }
}
