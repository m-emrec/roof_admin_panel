part of side_bar;

class SideBarUserAvatar extends StatelessWidget {
  const SideBarUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.antiAlias,
      child: AnimatedCrossFade(
        duration: SideBarController().animationDuration,
        crossFadeState: SideBarController().isExpanded.value
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        secondChild: CircleAvatar(
          radius: 24,
        ),
        firstChild: ListTile(
          title: Text('Aytaç Şahin'),
          leading: CircleAvatar(
            radius: 24,
          ),
          subtitle: Text(LocaleKeys.sidebar_accountSettings.tr()),
          trailing: SvgPicture.asset(Assets.icons.logoutIcon),
          onTap: () {
            context.goNamed(MembersRoute().name);
          },
        ),
      ),
    );
  }
}
