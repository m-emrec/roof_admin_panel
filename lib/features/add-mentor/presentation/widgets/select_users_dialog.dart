import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/select_users_dialog_item.dart';
import 'package:roof_admin_panel/product/utility/extensions/animation_extension.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class SelectUsersDialog extends ConsumerWidget {
  const SelectUsersDialog(this.user, {super.key});
  final UserModel? user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (user != null) {
        ref.read(selectionNotifierProvider.notifier).initializeState(user!);
      }
    });
    return CustomAlertDialog<UserModel>.withCloseIcon(
      content: SizedBox(
        width: context.dynamicWidth(0.9),
        height: context.dynamicHeight(0.8),
        child: AsyncDataBuilder(
          provider: addMentorUsersNotifierProvider(user?.role ?? []),
          data: (data) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 128,
              mainAxisExtent: 128,
              mainAxisSpacing: SpacingSizes.small,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return SelectUsersDialogItem(
                data[index],
                user?.role ?? [],
              ).scaleAnimation();
            },
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(ref.read(selectionNotifierProvider));
          },
          child: const Text("Add"),
        ),
      ],
    ).scaleAnimation().fadeAnimation();
  }
}
