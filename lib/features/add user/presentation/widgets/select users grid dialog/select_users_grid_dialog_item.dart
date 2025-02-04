part of 'select_user_grid.dart';

class _SelectsUsersGridDialogItem extends StatelessWidget {
  const _SelectsUsersGridDialogItem({
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
