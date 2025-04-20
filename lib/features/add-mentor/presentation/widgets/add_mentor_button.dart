import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/select_users_dialog.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class AddMentorButton extends ConsumerWidget {
  const AddMentorButton({
    required this.selectedUsers,
    super.key,
    this.user,
  });
  final UserModel? user;
  final ValueNotifier<UserModel> selectedUsers;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: () async {
        await CustomAlertDialog.showAlertDialog<UserModel>(
          context: context,
          content: SelectUsersDialog(user),
        ).then((value) {
          if (value != null) {
            selectedUsers.value = value;
          }
        });
      },
      child: Text(getLabel),
    );
  }

  String get getLabel {
    if (user == null) {
      return "";
    } else if (user!.isMentat) {
      return "Add mentor";
    } else if (user!.isMentor) {
      return "Add mentat/member";
    } else {
      return "Add mentor";
    }
  }
}
