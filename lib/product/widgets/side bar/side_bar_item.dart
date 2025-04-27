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
    final isSelected = SideBarController().isItemSelected(context, route.path);
    return ClipRRect(
      borderRadius: const AppBorderRadius.mediumOnly(
        topRight: true,
        bottomRight: true,
      ),
      child: ColoredBox(
        color: isSelected
            ? context.theme
                    .extension<SideBarThemeExtension>()
                    ?.selectedItemColor ??
                Colors.transparent
            : context.theme
                    .extension<SideBarThemeExtension>()
                    ?.unSelectedItemColor ??
                Colors.transparent,
        child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: isSelected
                ? context.theme
                    .extension<SideBarThemeExtension>()
                    ?.selectedTextStyle
                : context.theme.extension<SideBarThemeExtension>()?.textStyle,
          ),
          onTap: () => context.goNamed(route.name),
        ),
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
              ? context.theme
                  .extension<SideBarThemeExtension>()
                  ?.selectedItemColor
              : context.theme
                  .extension<SideBarThemeExtension>()
                  ?.unSelectedItemColor,
        ),
      ),
      onPressed: () => context.goNamed(route.name),
      icon: icon,
      tooltip: title,
    );
  }
}
