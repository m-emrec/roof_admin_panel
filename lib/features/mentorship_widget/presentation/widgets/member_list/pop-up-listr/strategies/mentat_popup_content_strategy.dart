part of '../mentorship_pop_up_list.dart';

class _MentatPopupContentStrategy extends MentorshipPopupContentStrategy {
  _MentatPopupContentStrategy(this.user);

  final MentatInfo user;
  @override
  List<PopupMenuEntry<void>> itemBuilder(BuildContext context) => [
        label(),
        ...user.mentors.map(
          (e) => _MentorshipPopupMenuItem(
            context,
            user: e,
            value: e?.uid,
          ),
        ),
      ];

  @override
  String get labelText => tr(
        LocaleKeys.memberDetailView_membershipInfo_mentorshipMemberList_mentors,
        args: [
          Role.mentat.localizedText(""),
        ],
      );

  @override
  String get toolTip =>
      LocaleKeys.memberDetailView_membershipInfo_mentorshipMemberList_seeList
          .tr(
        args: [
          Role.mentor.localizedText(""),
        ],
      );
}
