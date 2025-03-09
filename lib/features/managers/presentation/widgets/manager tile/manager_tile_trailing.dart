part of 'manager_tile.dart';

class _ManagerTileTrailing extends StatelessWidget {
  const _ManagerTileTrailing();

  @override
  Widget build(BuildContext context) {
    return PermissionBasedVisibility(
      necessaryPermissions: [Permissions.canEdit, Permissions.canEditManagers],
      child: PopupMenuButton(
        child: const Icon(Icons.more_vert_rounded),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: 'edit',
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
