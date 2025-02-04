part of "select_users_grid_dialog.dart";

/// This is a grid view of users to select
///
/// It takes :
///
/// 1. [users] : List of [UserModel] to display in grid
/// 2. [selectedUserList] : List of [String] which contains the selected user ids
///
class SelectUsersGrid extends ConsumerStatefulWidget {
  /// This is a grid view of users to select
  ///
  /// It takes :
  ///
  /// 1. [users] : List of [UserModel] to display in grid
  /// 2. [selectedUserList] : List of [String] which contains the selected user ids
  ///
  const SelectUsersGrid({
    required this.users,
    required this.selectedUserList,
    super.key,
  });

  /// 1. [users] : List of [UserModel] to display in grid
  final List<UserModel> users;

  /// 2. [selectedUserList] : List of [String] which contains the selected user ids
  final List<String> selectedUserList;

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
          child: _SelectsUsersGridItem(
            user: widget.users[index],
            isSelected: isSelected(index),
          ),
        );
      },
    );
  }
}
