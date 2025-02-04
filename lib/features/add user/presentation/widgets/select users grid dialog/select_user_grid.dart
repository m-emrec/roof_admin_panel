import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/select%20users%20grid%20dialog/select_users_grid_mixin.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
part 'select_users_grid_dialog_item.dart';

class SelectUsersGrid extends ConsumerStatefulWidget {
  final List<UserModel> users;
  final List<String> selectedUserList;
  const SelectUsersGrid(
      {super.key, required this.users, required this.selectedUserList});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectUserGridState();
}

class _SelectUserGridState extends ConsumerState<SelectUsersGrid>
    with SelectUsersGridMixin {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: widget.users.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => onUserSelected(widget.users[index].uid ?? ''),
          child: _SelectsUsersGridDialogItem(
            user: widget.users[index],
            isSelected: isSelected(index),
          ),
        );
      },
    );
  }
}
