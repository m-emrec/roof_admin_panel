part of 'manager_tile.dart';

class _ManagerTileTrailing extends ConsumerWidget {
  const _ManagerTileTrailing(this.manager);
  final ManagerModel manager;

  void onTapEdit(BuildContext context) {
    CustomAlertDialog.showAlertDialog(
      context: context,
      barrierDismissible: true,
      content: UpdateManagerDialog(manager),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PermissionBasedVisibility(
      necessaryPermissions: [Permissions.canEdit, Permissions.canEditManagers],
      child: PopupMenuButton(
        child: const Icon(Icons.more_vert_rounded),
        itemBuilder: (context) {
          return [
            PopupMenuItem<void>(
              onTap: () => onTapEdit(context),
              child: Text(LocaleKeys.common_edit.tr()),
            ),
            PopupMenuItem<void>(
              child: Text(LocaleKeys.common_delete.tr()),
            ),
          ];
        },
      ),
    ).visibleIfAllowed;
  }
}
