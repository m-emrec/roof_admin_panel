part of 'mentor_pop_up_list.dart';

/// A popup menu item used in the mentorship system to represent a mentat or a member.
///
/// This widget is displayed inside the [MemberPopupList] and provides a customized
/// visual presentation of either:
///
/// - A mentat (highlighted with a distinct shape and style), or
/// - A member (standard styling).
///
/// Depending on the constructor used (`.mentat` or `.member`), this item displays
/// the appropriate label, avatar, and styling. If no user is provided, a localized
/// empty state text is shown in a disabled popup item.
///
/// This class extends [PopupMenuItem] to ensure compatibility with [PopupMenuButton]
/// and integrates directly into the itemBuilder list.
///
/// Example usage:
/// ```dart
/// MentorshipPopupMenuItem.mentat(context, user: mentat);
/// MentorshipPopupMenuItem.member(context, user: member);
/// ```
class _MentorshipPopupMenuItem extends PopupMenuItem<String> {
  _MentorshipPopupMenuItem.member(
    this.context, {
    this.user,
    super.value,
  })  : tileColor = null,
        textColor = AppColors.secondaryColor[30],
        shape = null,
        trailing = null,
        emptyStateText = LocaleKeys
            .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_noMembersForMentor
            .tr(),
        super(child: null);
  _MentorshipPopupMenuItem.mentat(
    this.context, {
    this.user,
    super.value,
  })  : tileColor = AppColors.secondaryColor[30],
        textColor = AppColors.secondaryColor[90],
        shape = const StadiumBorder(),
        trailing = Role.mentat.localizedText(""),
        emptyStateText = LocaleKeys
            .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_noMentatForMentor
            .tr(),
        super(child: null);

  @override
  Widget? get child => hasNoUser
      ? emptyState()
      : ListTile(
          shape: shape,
          tileColor: tileColor,
          title: Text(
            user?.name ?? " - ",
            style: context.textTheme.labelLarge?.copyWith(
              color: textColor,
            ),
          ),
          trailing: trailing != null
              ? Padding(
                  padding: const AppPadding.smallOnlyPadding(right: true),
                  child: Text(
                    trailing ?? "",
                    style: context.textTheme.labelSmall?.copyWith(
                      color: textColor,
                    ),
                  ),
                )
              : null,
          leading: Avatar(
            imageUrl: user?.imageUrl,
            radius: IconSizes.small.height,
            showShadow: false,
          ).showClickMouseCursorOnWidget(),
        );

  final String emptyStateText;

  PopupMenuItem<void> emptyState() {
    return PopupMenuItem<void>(
      enabled: false,
      child: Text(
        emptyStateText,
      ),
    );
  }

  bool get hasNoUser => user == null;
  final BuildContext context;
  final UserInfoModel? user;

  final Color? tileColor;
  final Color? textColor;
  final ShapeBorder? shape;
  final String? trailing;
}
