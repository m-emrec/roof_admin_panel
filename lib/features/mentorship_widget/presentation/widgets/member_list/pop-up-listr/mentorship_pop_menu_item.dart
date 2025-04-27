part of 'mentorship_pop_up_list.dart';

class _MentorshipPopupMenuItem extends PopupMenuItem<String> {
  const _MentorshipPopupMenuItem(
    this.context, {
    this.user,
    super.value,
    this.emptyStateText = " - ",
  }) : super(
          child: null,
        );
  const _MentorshipPopupMenuItem.mentat(
    this.context, {
    this.user,
    super.value,
    this.emptyStateText = LocaleKeys
        .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_noMentatForMentor,
  }) : super(
          child: null,
        );
  final UserInfoModel? user;
  final BuildContext context;
  @override
  bool get enabled => hasUser;
  @override
  Widget? get child => ListTile(
        leading: hasUser
            ? Avatar(
                imageUrl: user?.imageUrl,
                radius: IconSizes.small.height,
                showShadow: false,
              )
            : null,
        title: Text(
          user?.name ?? emptyStateText.tr(),
          style: context.textTheme.labelLarge?.copyWith(
            color: hasUser
                ? AppColors.secondaryColor[60]
                : AppColors.neutralGray500[50],
          ),
        ).showClickMouseCursorOnWidget(),
      );

  bool get hasUser => user != null && user?.uid != null;

  /// The text to display when there is no user.
  /// This is used for the empty state of the popup menu item.
  /// The default value is " - ".
  ///
  /// if the user is null or has no uid, this text will be displayed.
  ///
  final String emptyStateText;
}
