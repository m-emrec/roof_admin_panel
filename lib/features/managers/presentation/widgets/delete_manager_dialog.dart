import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/managers/presentation/providers/managers_provider.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

///
class DeleteManagerDialog extends ConsumerWidget {
  ///
  const DeleteManagerDialog(this.manager, {super.key});

  Future<void> onTapDelete(WidgetRef ref, BuildContext context) async {
    await ref
        .read(managersViewModelProvider.notifier)
        .deleteManager(manager.uid)
        .showLoading(context: context);
    CustomAlertDialog.hideAlertDialog(context);
  }

  ///
  final ManagerModel manager;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAlertDialog(
      title: Text(LocaleKeys.managersView_deleteManager.tr()),
      content: Text(
        LocaleKeys.managersView_deleteManagerConfirmation
            .tr(args: [manager.email]),
      ),
      actions: [
        TextButton(
          onPressed: context.pop,
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        ElevatedButton(
          onPressed: () => onTapDelete(ref, context),
          child: Text(LocaleKeys.common_delete.tr()),
        ),
      ],
    );
  }
}
