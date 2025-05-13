import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/select_users_dialog.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

/// A widget that displays a button for adding a mentor or other roles based on the given user's role.
///
/// This widget is designed to handle user role-based actions and requires a [user] and a [selectedUsers] notifier.
///
/// - [user]: The user whose role determines the button's label and functionality. If null, the button will have no label.
/// - [selectedUsers]: A [ValueNotifier] used to notify the parent widget of the selected user.
///
/// When the button is pressed, it opens a dialog ([SelectUsersDialog]) to select a user.
/// If a user is selected, the [selectedUsers] notifier is updated with the selected user.
///
/// The button's label is determined by the user's role:
/// - If the user is a "Mentat", the label will be "Add mentor".
/// - If the user is a "Mentor", the label will be "Add mentat/member".
/// - For other roles, the label defaults to "Add mentor".
///
class AddMentorButton extends ConsumerWidget {
  /// Creates an instance of [AddMentorButton].
  ///
  const AddMentorButton({
    required this.selectedUsers,
    required this.user,
    super.key,
  });

  /// A nullable [MemberModel] representing the user associated with this widget.
  final MemberModel user;

  /// A [ValueNotifier] that holds the currently selected [MemberModel].
  /// This allows for reactive updates when the selected user changes.
  final ValueNotifier<MemberModel> selectedUsers;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(backgroundColor: Colors.transparent),
      onPressed: () async {
        await CustomAlertDialog.showAlertDialog<MemberModel>(
          context: context,
          content: SelectUsersDialog(user),
          forceOpen: true,
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
    if (user.isMentat) {
      return LocaleKeys.addMentor_buttonLabel_addMentor.tr();
    } else if (user.isMentor) {
      return LocaleKeys.addMentor_buttonLabel_addMentatAndMember.tr();
    } else {
      return LocaleKeys.addMentor_buttonLabel_addMentor.tr();
    }
  }
}
