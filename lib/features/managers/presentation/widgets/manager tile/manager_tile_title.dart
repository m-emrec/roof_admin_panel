part of 'manager_tile.dart';

class _ManagerTileTitle extends StatelessWidget {
  const _ManagerTileTitle(
    this.manager,
  );

  final ManagerModel manager;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(manager.name),
        Tooltip(
          message: manager.role.permissions.map((e) => e.toLocale()).join("\n"),
          textStyle: context.textTheme.labelLarge,
          child: Text(
            ' (${manager.role.name})',
            style: context.textTheme.labelLarge
                ?.copyWith(color: AppColors.secondaryColor[40]),
          ),
        ),
      ],
    );
  }
}
