part of "../membership_info_card.dart";

class _MembershipCardOptionBadge extends ConsumerWidget {
  const _MembershipCardOptionBadge(this.child);
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
        child: _OptionBadgeField(
          _popMenuItemBuilder,
          ref,
          (value) => _onSelected(value, ref, context),
        ).build(context, isEditing: isEditing),
      ).visibleIfAllowed,
      child: child,
    );
  }

  void _onSelected(_Value value, WidgetRef ref, BuildContext context) {
    switch (value) {
      case _Value.edit:
        ref.read(isEditingProvider.notifier).state = true;
      case _Value.delete:
        CustomAlertDialog.showAlertDialog<void>(
          forceOpen: true,
          context: context,
          content: const BanMemberDialog(),
        );
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

enum _Value {
  edit,
  delete,
}
