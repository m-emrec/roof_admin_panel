import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/add_member_view_model.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/select%20users%20grid%20dialog/select_users_grid_dialog.dart';

///  This mixin contains the logic for the [SelectUsersGrid] widget
mixin SelectUsersGridMixin on ConsumerState<SelectUsersGrid> {
  /// This is the list of selected users
  late final List<String> selectedUserList;

  @override
  void initState() {
    selectedUserList = widget.selectedUserList;

    super.initState();
  }

  /// This method will check if the user is selected or not
  bool isSelected(int index) {
    return selectedUserList.contains(widget.users[index].uid) == true;
  }

  /// Here based ont the [RoleBasedActionNames] the user will be selected
  /// if the [roleBasedActionName] is [RoleBasedActionNames.setMembers] or
  /// [RoleBasedActionNames.setMentors] then more than one user can be selected
  ///
  /// If the [roleBasedActionName] is [RoleBasedActionNames.setAdmin] then only
  /// one user can be selected
  void onUserSelected(String uid) {
    switch (ref.read(addMemberProvider).roleBasedActionName) {
      case RoleBasedActionNames.setMembers:
      case RoleBasedActionNames.setMentors:
        if (selectedUserList.contains(uid) == true) {
          selectedUserList.remove(uid);
        } else {
          selectedUserList.add(uid);
        }

      /// I use the default here because rest of the cases are same
      // ignore: no_default_cases
      default:
        if (selectedUserList.isEmpty) {
          selectedUserList.add(uid);
        } else {
          selectedUserList
            ..clear()
            ..add(uid);
        }
    }
    setState(() {});
  }
}
