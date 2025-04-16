part of '../mentorship_pop_up_list.dart';

class _MentorPopupContentStrategy extends MentorshipPopupContentStrategy {
  _MentorPopupContentStrategy(this.user);

  final MentorInfo user;
  @override
  List<PopupMenuEntry<void>> itemBuilder(BuildContext context) => [
        _MentorshipPopupMenuItem.mentat(
          context,
          user: user.mentat,
          value: user.mentat?.uid,
        ),
        label(),
        ...user.members.map(
          (e) => _MentorshipPopupMenuItem(
            context,
            user: e,
            value: e?.uid,
          ),
        ),
      ];

  @override
  String get labelText => tr(
        LocaleKeys.memberDetailView_membershipInfo_mentorshipMemberList_members,
        args: [
          Role.mentor.localizedText(""),
        ],
      );

  @override
  String get toolTip =>
      LocaleKeys.memberDetailView_membershipInfo_mentorshipMemberList_seeList
          .tr(
        args: [
          Role.member.localizedText(""),
        ],
      );
}
