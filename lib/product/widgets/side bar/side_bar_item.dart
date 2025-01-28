part of side_bar;

class _SideBarItem extends StatelessWidget {
  const _SideBarItem({
    required this.title,
    required this.icon,
    required this.index,
    required this.isSelected,
  });
  final String title;
  final Widget icon;
  final int index;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    SideBarController().selectedPage.addListener(() {
      if (SideBarController().selectedPage.value == index) {
        // SideBarController().isExpanded.value = false;
      }
    });
    return AnimatedCrossFade(
      duration: SideBarController().animationDuration,
      crossFadeState: SideBarController().isExpanded.value
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      secondChild: IconButton(
        onPressed: () {
          SideBarController().navigationManager(index);
        },
        icon: icon,
      ),
      firstChild: ListTile(
        leading: icon,
        title: Text(title),
        selected: isSelected,
        style: ListTileStyle.drawer,
        selectedTileColor: Colors.red,
        selectedColor: Colors.red,
        tileColor: Colors.red,
        onTap: () {
          SideBarController().navigationManager(index);
        },
      ),
    );
  }
}
