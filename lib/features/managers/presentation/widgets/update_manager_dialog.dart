import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/features/managerRoles/presentation/widgets/select_role_dropdown.dart';
import 'package:roof_admin_panel/features/managers/presentation/providers/managers_provider.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';
import 'package:roof_admin_panel/product/utility/models/manager_role_model.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class UpdateManagerDialog extends ConsumerWidget {
  const UpdateManagerDialog(this.manager, {super.key});
  final ManagerModel manager;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController roleController = TextEditingController();
    return CustomAlertDialog(
      title: const Text('Update Manager'),
      content: SelectRoleDropdown(
        roleController,
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(managersViewModelProvider.notifier).editManager(
                  roleController.text,
                  manager,
                );
            Log.debug(roleController.text);
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
