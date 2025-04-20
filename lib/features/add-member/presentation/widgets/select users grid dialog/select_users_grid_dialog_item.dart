part of select_users_grid_dialog;

/// Used in [SelectUsersGrid].
///
/// It is basically a [Column] which contains the user details like
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
          smallSize: 8,
          backgroundColor: AppColors.primaryColor,
          isLabelVisible: isSelected,
          child: CircleAvatar(
            child: (user?.imageUrl != null)
                ? Image.network(
                    user?.imageUrl ?? '',
                  )
                : Image.asset(
                    user?.gender == Gender.female
                        ? Assets.images.femaleAvatar.path
                        : Assets.images.maleAvatar.path,
                  ),
          ),
        ),
        Text(
          user?.name ?? '',
          style: context.textTheme.labelLarge,
        ),
        Text(
          user?.memberNumber ?? '',
          style: context.textTheme.labelMedium,
        ),
        Text(
          user?.membershipEndDate?.formatDate(context) ?? '',
        ),
      ],
    );
  }
}
