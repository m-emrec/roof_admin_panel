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
    return ClipRect(
      clipBehavior: Clip.antiAlias,

      ///
      // ignore: prefer_const_constructors
      child: FutureBuilder(
        future: ref.read(sideBarUserProvider.future),
        builder: (context, AsyncSnapshot<UserModel?> snapshot) {
          return CustomSkeleton(
            // replace: true,
            enabled: snapshot.connectionState == ConnectionState.waiting,
            // enabled: true,
            // ignore: prefer_const_constructors
            child: SideBarItemViewSwitcher(
              expandedChild: _ExpandedSideBarUserAvatar(
                snapshot.data ?? UserModel(name: "loading"),
              ),
              collapsedChild: _CollapsedSideBarUserAvatar(
                snapshot.data ?? UserModel(name: "loading"),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ExpandedSideBarUserAvatar extends StatelessWidget {
  const _ExpandedSideBarUserAvatar(this.user);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name ?? ''),
      leading: CircleAvatar(
        radius: 16,
        child: Image.network(
          user.imageUrl ?? '',
          errorBuilder: (context, error, stackTrace) {
            if (user.gender == Gender.female) {
              return Image.asset(Assets.images.femaleAvatar.path);
            }
            return Image.asset(Assets.images.maleAvatar.path);
          },
        ),
      ),
      shape: Border(
        bottom: BorderSide(
          color: AppColors.neutralGray500,
          width: 2,
        ),
      ),
      subtitle: Text(LocaleKeys.sidebar_accountSettings.tr()),
      trailing: SvgPicture.asset(Assets.icons.logoutIcon),
      onTap: () {},
    );
  }
}

class _CollapsedSideBarUserAvatar extends StatelessWidget {
  const _CollapsedSideBarUserAvatar(
    this.user,
  );
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      child: Image.network(
        user.imageUrl ?? '',
        errorBuilder: (context, error, stackTrace) {
          if (user.gender == Gender.female) {
            return Image.asset(Assets.images.femaleAvatar.path);
          }
          return Image.asset(Assets.images.maleAvatar.path);
        },
      ),
    );
  }
}
