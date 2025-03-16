// part of "side_bar_state_mixin.dart";
part of "side_bar_items_builder.dart";

class _SideBarItem extends StatelessWidget {
  const _SideBarItem({
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final Widget icon;
  final BaseRouteClass route;

  @override
  Widget build(BuildContext context) {
    return SideBarItemViewSwitcher(
      expandedChild: _ExpandedSideBarItem(
        icon: icon,
        title: title,
        route: route,
      ),
      collapsedChild: _CollapsedSideBarItem(
        icon: icon,
        route: route,
        title: title,
      ),
    );
  }
}

class _ExpandedSideBarItem extends StatelessWidget {
  const _ExpandedSideBarItem({
    required this.icon,
    required this.title,
    required this.route,
  });
  final BaseRouteClass route;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: SideBarController().isItemSelected(context, route.path)
          ? AppColors.backgroundColor[40] ?? Colors.transparent
          : Colors.transparent,
      child: ListTile(
        contentPadding: const AppPadding.horizontalSSymmetric(),
        leading: icon,
        title: Text(
          title,
          style: context.textTheme.labelMedium,
        ),
        onTap: () => context.goNamed(route.name),
      ),
    );
  }
}

class _CollapsedSideBarItem extends StatelessWidget {
  const _CollapsedSideBarItem({
    required this.icon,
    required this.title,
    required this.route,
  });

  final BaseRouteClass route;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: context.theme.iconButtonTheme.style?.copyWith(
        backgroundColor: WidgetStatePropertyAll(
          SideBarController().isItemSelected(context, route.path)
              ? AppColors.backgroundColor[40]
              : Colors.transparent,
        ),
      ),
      onPressed: () => context.goNamed(route.name),
      icon: icon,
      tooltip: title,
    );
  }
}
