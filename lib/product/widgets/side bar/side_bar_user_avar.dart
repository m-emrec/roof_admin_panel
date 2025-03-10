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
    /// ! !! !! DO NOT MAKE THIS WIDGET CONST !! !! !
    /// Because when this widget is const it will not rebuild it self when the
    /// [SideBarController().isExpanded] value changes.
    /// So, it will not change the avatar when the sidebar is expanded or collapsed.
    // ignore: prefer_const_constructors
    return SideBarItemViewSwitcher(
      expandedChild: const _ExpandedSideBarUserAvatar(),
      collapsedChild: const _CollapsedSideBarUserAvatar(),
    );
  }
}

class _ExpandedSideBarUserAvatar extends StatelessWidget {
  const _ExpandedSideBarUserAvatar();

  @override
  Widget build(BuildContext context) {
    final user = ManagerInfo.instance.managerModel;
    return ListTile(
      title: Text(user.name),
      leading: Avatar(
        imageUrl: user.imageUrl,
        radius: 16,
      ),
      shape: Border(
        bottom: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      subtitle: Text(LocaleKeys.sidebar_accountSettings.tr()),
      trailing: GestureDetector(
        child: SvgPicture.asset(
          Assets.icons.logoutIcon,
        ),
        onTap: () => AuthService().signOut(),
      ),
      onTap: () {},
    );
  }
}

class _CollapsedSideBarUserAvatar extends StatelessWidget {
  const _CollapsedSideBarUserAvatar();

  @override
  Widget build(BuildContext context) {
    return Avatar(
      imageUrl: ManagerInfo.instance.managerModel.imageUrl,
      radius: 16,
    );
  }
}
