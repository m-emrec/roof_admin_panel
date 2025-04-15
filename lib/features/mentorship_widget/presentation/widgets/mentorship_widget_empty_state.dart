part of '../views/mentorship_widget.dart';

class _MentorshipWidgetEmptyState extends StatelessWidget {
  const _MentorshipWidgetEmptyState({required this.roles});
  final List<Role?> roles;

  @override
  Widget build(BuildContext context) {
    return Text(
      _emptyStateText,
      style: context.textTheme.labelMedium,
    );
  }

  String get _emptyStateText {
    if (roles.isMentor) {
      return LocaleKeys
          .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_noMentatAndMembersForMentor
          .tr();
    } else if (roles.isMentat) {
      return LocaleKeys
          .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_notMentorsForMentat
          .tr();
    } else {
      return LocaleKeys
          .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_noMentorForMember
          .tr();
    }
  }
}
