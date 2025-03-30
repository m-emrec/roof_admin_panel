part of "membership_info_card.dart";

class _MobileView extends StatelessWidget {
  const _MobileView(this.member);
  final UserModel? member;
  @override
  Widget build(BuildContext context) {
    return MembersDetailSectionCard(
      child: SizedBox(
        width: context.dynamicWidth(0.9),
        // height: context.dynamicHeight(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SpacingSizes.medium,
          children: [
            AvatarNameRoleSection(member: member),
            MembershipInfoSection(member: member),
          ],
        ),
      ),
    );
  }
}
