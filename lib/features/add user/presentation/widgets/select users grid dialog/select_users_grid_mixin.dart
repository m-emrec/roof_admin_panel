import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/add_member_view_model.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/select%20users%20grid%20dialog/select_user_grid.dart';

mixin SelectUsersGridMixin on ConsumerState<SelectUsersGrid> {
  late final List<String> selectedUserList;

  @override
  void initState() {
    selectedUserList = widget.selectedUserList;

    super.initState();
  }

  bool isSelected(int index) {
    return selectedUserList.contains(widget.users[index].uid) == true;
  }

  void onUserSelected(String uid) {
    switch (ref.read(addMemberProvider).selectedParameter) {
      case A.setMembers:
      case A.setMentors:
        if (selectedUserList.contains(uid) == true) {
          selectedUserList.remove(uid);
        } else {
          selectedUserList.add(uid);
        }

      default:
        if (selectedUserList.isEmpty) {
          selectedUserList.add(uid);
        } else {
          selectedUserList.clear();
          selectedUserList.add(uid);
        }
    }

    setState(() {});
  }
}
