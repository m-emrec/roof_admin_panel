library select_users_grid_dialog;

import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/select%20users%20grid%20dialog/select_users_grid_mixin.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';
part 'select_users_dialog_error_card.dart';
part 'select_user_grid.dart';
part 'select_users_grid_dialog_item.dart';

/// This is the dialog which will be opened when the user taps on one of the
/// [RoleBasedButtons]
///
/// It will show a grid of users and the user can select one or more users
class SelectsUsersGridDialog extends ConsumerStatefulWidget {
  /// This is the dialog which will be opened when the user taps on one of the
  /// [RoleBasedButtons]
  ///
  /// It will show a grid of users and the user can select one or more users
  const SelectsUsersGridDialog({
    required this.fetchUsersMethod,
    super.key,
  });

  /// This is the future method that will be called to fetch the users
  ///
  /// This method should return a list of [UserModel]
  final Future<List<UserModel>> fetchUsersMethod;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectsUsersGridDialogState();
}

class _SelectsUsersGridDialogState
    extends ConsumerState<SelectsUsersGridDialog> {
  final List<String> selectedUserList = [];

  void onTapAdd() {
    ref.read(addMemberProvider).roleBasedAction(selectedUserList);
    CustomAlertDialog.hideAlertDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        TextButton(
          onPressed: onTapAdd,
          child: Text(LocaleKeys.common_add.tr()),
        ),
      ],
      content: SizedBox(
        width: context.dynamicWidth(0.5),
        height: context.dynamicHeight(0.5),
        child: FutureBuilder(
          future: widget.fetchUsersMethod,
          builder:
              (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator();
            }
            if (snapshot.hasError) {
              return _SelectUsersDialogErrorCard(
                errorMessage: snapshot.error.toString(),
                onRetry: () => setState(() {}),
              );
            }
            return SelectUsersGrid(
              users: snapshot.data ?? [],
              selectedUserList: selectedUserList,
            );
          },
        ),
      ),
    );
  }
}
