import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/add_mentor_button.dart';

///
/// Purpose of this widget is to show buttons based on the selected role on [RoleDropdown]
///
/// This widget is used in [AddNewUserDialog]
class RoleBasedButtons extends ConsumerWidget {
  ///
  /// Purpose of this widget is to show buttons based on the selected role on [RoleDropdown]
  ///
  /// This widget is used in [AddNewUserDialog]
  const RoleBasedButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<UserModel> selectedUsers =
        ValueNotifier(ref.read(addMemberProvider).user);
    return Column(
      children: [
        AddMentorButton(
          user: ref.watch(addMemberProvider.select((p) => p.user)),
          selectedUsers: selectedUsers,
        ),
        TextButton(
          child: Text("data"),
          onPressed: () {
            Log.debug(selectedUsers.value.mentors);
          },
        ),
      ],
    );
  }
}
