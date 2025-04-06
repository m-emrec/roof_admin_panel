part of 'membership_info_card.dart';

class _MembershipInfoCardBadge extends ConsumerWidget {
  const _MembershipInfoCardBadge(this.child);
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingProvider);
    return Badge(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      offset: Offset(
        isEditing ? -SpacingSizes.extraExtraLarge : -SpacingSizes.large,
        isEditing ? SpacingSizes.small : SpacingSizes.medium,
      ),
      label: PermissionBasedVisibility(
        necessaryPermissions: [
          Permissions.canEdit,
          Permissions.canEditMembers,
        ],
        child: isEditing
            ? Row(
                spacing: SpacingSizes.small,
                children: [
                  InkWell(
                    onTap: () =>
                        ref.read(isEditingProvider.notifier).state = false,
                    child: Icon(
                      Icons.close,
                      color: AppColors.accentError[50],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref
                          .read(membershipDetailNotifierProvider.notifier)
                          .editMembershipDetails();
                    },
                    child: Icon(
                      Icons.check,
                      color: AppColors.primaryColor[50],
                    ),
                  ),
                ],
              )
            : PopupMenuButton(
                itemBuilder: _popMenuItemBuilder,
                onSelected: (value) => ref
                    .read(isEditingProvider.notifier)
                    .state = value == 1 ? true : false,
              ),
      ).visibleIfAllowed,
      child: child,
    );
  }

  List<PopupMenuEntry<int>> _popMenuItemBuilder(BuildContext context) => [
        const PopupMenuItem(
          value: 1,
          child: Text(
            'Edit',
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            'Delete',
          ),
        ),
      ];
}
