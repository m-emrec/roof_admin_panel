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
            ? const _EditStateBadge()
            : PopupMenuButton(
                itemBuilder: _popMenuItemBuilder,

                onSelected: (value) =>
                    _onSelected(value, ref), // Handle the selected value
              ),
      ).visibleIfAllowed,
      child: child,
    );
  }

  void _onSelected(_Value value, WidgetRef ref) {
    switch (value) {
      case _Value.edit:
        ref.read(isEditingProvider.notifier).state = true;
      case _Value.delete:
        break;
    }
  }

  List<PopupMenuEntry<_Value>> _popMenuItemBuilder(BuildContext context) => [
        PopupMenuItem(
          value: _Value.edit,
          child: Text(
            LocaleKeys.memberDetailView_options_edit.tr(),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: _Value.delete,
          child: Text(
            LocaleKeys.memberDetailView_options_ban.tr(),
          ),
        ),
      ];
}

class _EditStateBadge extends ConsumerWidget {
  const _EditStateBadge();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      spacing: SpacingSizes.small,
      children: [
        InkWell(
          onTap: () =>
              ref.read(membershipDetailNotifierProvider.notifier).reset(),
          child: Icon(
            Icons.close,
            color: AppColors.accentError[50],
          ),
        ),
        InkWell(
          onTap: () => ref
              .read(membershipDetailNotifierProvider.notifier)
              .editMembershipDetails()
              .showLoading(context: context),
          child: Icon(
            Icons.check,
            color: AppColors.primaryColor[50],
          ),
        ),
      ],
    );
  }
}

enum _Value {
  edit,
  delete,
}
