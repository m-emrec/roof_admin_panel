part of side_bar;

/// SideBarUserAvatar is a widget that contains the user avatar and current
/// user name  in the sidebar.
class SideBarUserAvatar extends ConsumerWidget {
  /// SideBarUserAvatar is a widget that contains the user avatar and current
  /// user name  in the sidebar.
  // ignore: prefer_const_constructors_in_immutables
  SideBarUserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.backgroundColor[30] ?? Colors.transparent,
          ),
        ),
      ),

      /// ! !! !! DO NOT MAKE [SideBarItemViewSwitcher] CONST !! !! !
      /// Because when this widget is const it will not rebuild it self when the
      /// [SideBarController().isExpanded] value changes.
      /// So, it will not change the avatar when the sidebar is expanded or collapsed.
      // ignore: prefer_const_constructors
      child: SideBarItemViewSwitcher(
        expandedChild: const _ExpandedSideBarUserAvatar(),
        collapsedChild: const _CollapsedSideBarUserAvatar(),
      ),
    );
  }
}

class _ExpandedSideBarUserAvatar extends StatelessWidget {
  const _ExpandedSideBarUserAvatar();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CurrentManager.instance.managerModelNotifier,
      builder: (context, user, child) => ListTile(
        title: Text(user.name, style: context.textTheme.labelMedium),
        leading: Avatar(
          imageUrl: user.imageUrl,
          radius: 12,
        ),
        shape: Border(
          bottom: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        trailing: GestureDetector(
          child: const MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Icon(
              Icons.settings,
              size: 16,
            ),
          ),
          onTap: () => context.goNamed(AccountSettingsRoute().name),
        ),
      ),
    );
  }
}

class _CollapsedSideBarUserAvatar extends StatelessWidget {
  const _CollapsedSideBarUserAvatar();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CurrentManager.instance.managerModelNotifier,
      builder: (context, user, child) => Avatar(
        imageUrl: user.imageUrl,
        radius: 16,
      ),
    );
  }
}
