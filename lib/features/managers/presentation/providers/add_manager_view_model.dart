import 'package:core/core.dart';
import 'package:core/resources/data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/managers/data/models/add_manager_model.dart';
import 'package:roof_admin_panel/features/managers/domain/usecases/add_manager_use_case.dart';
import 'package:roof_admin_panel/features/managers/presentation/providers/managers_provider.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

class AddManagerViewModel extends AutoDisposeNotifier<AddManagerModel> {
  AddManagerViewModel(
    this._addManagerUseCase,
  );
  final Provider<AddManagerUseCase> _addManagerUseCase;
  @override
  build() {
    return AddManagerModel(
      name: "",
      email: "",
      role: "",
      permissions: [],
    );
  }

  Future<void> addManager(AddManagerModel manager) async {
    state = state.copyWith(
      name: manager.name,
      email: manager.email,
      role: manager.role,
    );

    DataState.handleDataStateBasedAction(
      await ref.read(_addManagerUseCase).call(state),
      onSuccess: (_) =>
          ref.read(managersViewModelProvider.notifier).getManagers(),
      onFailure: (error) =>
          Toast.showErrorToast(title: error?.errorMessage ?? ""),
    );
  }

  void initializeManagerPermissions(
    List<Permissions>? permissions,
  ) {
    final currentModel = state;
    state = currentModel.copyWith(permissions: permissions ?? []);
  }

  void addPermission(Permissions permission) {
    final currentModel = state;

    final updatedPermissions =
        List<Permissions>.from(currentModel.permissions ?? []);
    if (!updatedPermissions.contains(permission)) {
      updatedPermissions.add(permission);
      if (permission.parent != null &&
          !updatedPermissions.contains(permission.parent)) {
        updatedPermissions.add(permission.parent!);
      }
    } else {
      updatedPermissions.remove(permission);
    }
    state = currentModel.copyWith(permissions: updatedPermissions);
  }
}
