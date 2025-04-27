import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/selection_dialog_for_mentor.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/selection_grid.dart';
import 'package:roof_admin_panel/product/utility/extensions/animation_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

/// A dialog that presents a list of users for selection based on the given user's role.
///
/// This dialog supports two different UI flows depending on whether the user is a mentor or not:
/// - If the user is a mentor, it shows a specialized [SelectionDialogForMentor].
/// - Otherwise, it uses [AsyncDataBuilder] to fetch and display available users in a [SelectionGrid].
///
/// The selected user(s) are managed using [selectionNotifierProvider].
/// The dialog returns the selected users when the "Okay" button is pressed.
///
/// Animations ([scaleAnimation] and [fadeAnimation]) are applied to the dialog for better UX.
///
/// The dialog is displayed using [CustomAlertDialog.withCloseIcon].
///
/// Example usage:
/// ```dart
/// final result = await CustomAlertDialog.showAlertDialog<UserModel>(
///   context: context,
///   content: SelectUsersDialog(user),
/// );
/// ```
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
        child: user.role?.isMentor == true
            ? SelectionDialogForMentor(user: user)
            : AsyncDataBuilder(
                provider: addMentorUsersNotifierProvider(user.role ?? []),
                data: (data) => SelectionGrid(
                  user: user,
                  data: data,
                ),
              ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(ref.read(selectionNotifierProvider));
          },
          child: Text(LocaleKeys.common_okay.tr()),
        ),
      ],
    ).scaleAnimation().fadeAnimation();
  }
}
