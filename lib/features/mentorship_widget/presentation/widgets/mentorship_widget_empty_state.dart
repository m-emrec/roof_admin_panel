part of '../views/mentorship_widget.dart';

class _MentorshipWidgetEmptyState extends StatelessWidget {
  const _MentorshipWidgetEmptyState({required this.roles});
  final List<Role?> roles;

  @override
  Widget build(BuildContext context) {
    if (roles.isMentor) {
      return Text(
        LocaleKeys
            .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_noMentatAndMembersForMentor
            .tr(),
      );
    } else if (roles.isMentat) {
      return Text(
        LocaleKeys
            .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_notMentorsForMentat
            .tr(),
      );
    } else {
      return Text(
        LocaleKeys
            .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_noMentorForMember
            .tr(),
      );
    }
  }
}
