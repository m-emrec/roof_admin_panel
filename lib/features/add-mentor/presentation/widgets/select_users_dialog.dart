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

/// A dialog widget that allows the user to select users from a list.
///
/// This widget is a `ConsumerWidget` that uses Riverpod for state management.
/// It displays a custom alert dialog with a grid of selectable users. The dialog
/// is initialized with an optional `UserModel` object, which is used to set up
/// the initial state of the selection.
///
/// The dialog fetches the list of users asynchronously using the
/// `addMentorUsersNotifierProvider` and displays them in a grid. Each user item
/// is represented by a `SelectUsersDialogItem` widget with animations applied.
///
/// The dialog has a single action button labeled "Add", which closes the dialog
/// and returns the selected users via the `selectionNotifierProvider`.
///
/// ### Parameters:
/// - `user` (optional): A `UserModel` object representing the user for whom the
///   dialog is being initialized. If provided, it is used to set up the initial
///   state of the selection.
///
/// ### Widget Structure:
/// - The dialog content is wrapped in a `CustomAlertDialog` with a close icon.
/// - The main content is a `SizedBox` that adjusts its width and height based on
///   the screen size.
/// - The user list is displayed using a `GridView.builder` with a maximum cross-axis
///   extent of 128 and spacing defined by `SpacingSizes.small`.
/// - Each user item is animated using `scaleAnimation`.
///
/// ### Actions:
/// - The "Add" button closes the dialog and returns the selected users.
///
class SelectUsersDialog extends ConsumerWidget {
  /// Creates an instance of [SelectUsersDialog].
  ///
  const SelectUsersDialog(this.user, {super.key});

  final UserModel user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(selectionNotifierProvider.notifier).initializeState(user);
    });
    return CustomAlertDialog<UserModel>.withCloseIcon(
      content: SizedBox(
        width: context.dynamicWidth(0.9),
        height: context.dynamicHeight(0.8),
        child: AsyncDataBuilder(
          provider: addMentorUsersNotifierProvider(user.role ?? []),
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
                user.role ?? [],
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
