part of 'manager_tile.dart';

class _ManagerTileTitle extends StatelessWidget {
  const _ManagerTileTitle(
    this.manager,
  );

  final ManagerModel manager;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: manager.name),
          TextSpan(
            text: ' (${manager.role.name})',
            style: context.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
