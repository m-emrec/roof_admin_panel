part of 'manager_tile.dart';

class _ManagerTileTrailing extends ConsumerWidget {
  const _ManagerTileTrailing(this.manager);
  final ManagerModel manager;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PermissionBasedVisibility(
      necessaryPermissions: [Permissions.canEdit, Permissions.canEditManagers],
      child: PopupMenuButton(
        child: const Icon(Icons.more_vert_rounded),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: 'edit',
              onTap: () => CustomAlertDialog.showAlertDialog(
                context: context,
                barrierDismissible: true,
                content: UpdateManagerDialog(manager),
              ),
              child: Text(LocaleKeys.common_edit.tr()),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Text(LocaleKeys.common_delete.tr()),
            ),
          ];
        },
      ),
    ).visibleIfAllowed;
  }
}
