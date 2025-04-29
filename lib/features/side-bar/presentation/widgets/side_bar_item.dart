part of 'side_bar_item_builder.dart';

class _SideBarItem extends ConsumerWidget {
  const _SideBarItem(this.item);
  final SideBarItemModel item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(
      isItemSelectedProvider([
        context,
        item.route,
      ]),
    );
    return SideBarItemSwitcher(
      expandedChild: _ExpandedSideBarItem(item, isSelected),
      collapsedChild: _CollapsedSideBarItem(item, isSelected),
    );
  }
}

class _ExpandedSideBarItem extends StatelessWidget {
  const _ExpandedSideBarItem(this.item, this.isSelected);

  final bool isSelected;
  final SideBarItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const AppPadding.xxsmallOnlyPadding(right: true),
      child: ClipRRect(
        borderRadius: const AppBorderRadius.mediumOnly(
          topRight: true,
          bottomRight: true,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: isSelected
              ? context.theme
                  .extension<SideBarThemeExtension>()
                  ?.selectedItemColor
              : context.theme
                  .extension<SideBarThemeExtension>()
                  ?.unSelectedItemColor,
          child: ListTile(
            dense: false,
            leading: item.icon,
            title: Text(
              item.title,
              style: isSelected
                  ? context.theme
                      .extension<SideBarThemeExtension>()
                      ?.selectedTextStyle
                  : context.theme.extension<SideBarThemeExtension>()?.textStyle,
              maxLines: 1,
            ),
            onTap: () => context.goNamed(item.route.name),
          ),
        ),
      ),
    );
  }
}

class _CollapsedSideBarItem extends StatelessWidget {
  const _CollapsedSideBarItem(this.item, this.isSelected);

  final bool isSelected;
  final SideBarItemModel item;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: context.theme.iconButtonTheme.style?.copyWith(
        backgroundColor: WidgetStatePropertyAll(
          isSelected
              ? context.theme
                  .extension<SideBarThemeExtension>()
                  ?.selectedItemColor
              : context.theme
                  .extension<SideBarThemeExtension>()
                  ?.unSelectedItemColor,
        ),
      ),
      onPressed: () => context.goNamed(item.route.name),
      icon: item.icon,
      tooltip: item.title,
    );
  }
}
