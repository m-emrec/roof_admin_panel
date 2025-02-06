part of "side_bar_state_mixin.dart";

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
    final isSelected = SideBarController().currentLocation.value == route.path;

    return SideBarItemViewSwitcher(
      expandedChild: _ExpandedSideBarItem(
        isSelected: isSelected,
        icon: icon,
        title: title,
        routeName: route.name,
      ),
      collapsedChild: _CollapsedSideBarItem(
        isSelected: isSelected,
        icon: icon,
        routeName: route.name,
        title: title,
      ),
    );
  }
}

class _ExpandedSideBarItem extends StatelessWidget {
  const _ExpandedSideBarItem({
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.routeName,
  });
  final String routeName;
  final bool isSelected;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: isSelected
          ? AppColors.backgroundColor[40] ?? Colors.transparent
          : Colors.transparent,
      child: ListTile(
        contentPadding: const AppPadding.horizontalSSymmetric(),
        leading: icon,
        title: Text(
          title,
          style: context.textTheme.labelLarge,
        ),
        onTap: () => context.goNamed(routeName),
      ),
    );
  }
}

class _CollapsedSideBarItem extends StatelessWidget {
  const _CollapsedSideBarItem({
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.routeName,
  });

  final String routeName;
  final bool isSelected;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: context.theme.iconButtonTheme.style?.copyWith(
        backgroundColor: WidgetStatePropertyAll(
          isSelected ? AppColors.backgroundColor[40] : Colors.transparent,
        ),
      ),
      onPressed: () => context.goNamed(routeName),
      icon: icon,
      tooltip: title,
    );
  }
}
