part of select_users_grid_dialog;

/// Used in [SelectUsersGrid].
///
/// It is basically a [Columns] which contains the user details like
///
/// 1. User Image
/// 2. User Name
/// 3. User Birth Date
///
///
class _SelectsUsersGridItem extends StatelessWidget {
  /// Used in [SelectUsersGrid].
  ///
  /// It is basically a [Columns] which contains the user details like
  ///
  /// 1. User Image
  /// 2. User Name
  /// 3. User Birth Date
  ///
  ///
  const _SelectsUsersGridItem({
    required this.user,
    required this.isSelected,
  });
  final UserModel? user;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Badge(
          isLabelVisible: isSelected,
          child: CircleAvatar(
            child: (user?.imageUrl != null)
                ? Image.network(
                    user?.imageUrl ?? '',
                  )
                : const SizedBox(),
          ),
        ),
        Text(
          user?.name ?? '',
        ),
        Text(
          user?.birthDate?.formatDate(context) ?? '',
        ),
      ],
    );
  }
}
