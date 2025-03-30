part of "membership_info_card.dart";

class _MembershipInfoSection extends StatelessWidget {
  const _MembershipInfoSection({
    required this.member,
  });

  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Wrap(
        spacing: SpacingSizes.large,
        runSpacing: SpacingSizes.small,
        runAlignment: WrapAlignment.center,
        children: [
          _MembershipInfoCardItem(
            label: LocaleKeys.memberDetailView_membershipInfo_memberNumber.tr(),
            value: member?.memberNumber,
          ),
          // _MembershipInfoCardItem(
          //   label: LocaleKeys.memberDetailView_membershipInfo_phoneNumber.tr(),
          //   value: member?.phoneNumber,
          // ),
          _MembershipInfoCardItem(
            label: LocaleKeys
                .memberDetailView_membershipInfo_memberShipStartDate
                .tr(),
            value: member?.membershipStartDate?.formatDate(context),
          ),
          _MembershipInfoCardItem(
            label: LocaleKeys.memberDetailView_membershipInfo_memberShipEndDate
                .tr(),
            value: member?.membershipEndDate?.formatDate(context),
          ),
          _MembershipInfoCardItem(
            label: LocaleKeys.memberDetailView_membershipInfo_memberShipDuration
                .tr(),
            value: member?.membershipStartDate != null
                ? "${DateTime.now().difference(member!.membershipStartDate!).inDays} ${LocaleKeys.common_date_day.tr()}"
                : "",
          ),
          _MembershipInfoCardItem(
            label: LocaleKeys.memberDetailView_membershipInfo_mentor.tr(),
            value: member?.mentorId,
          ),

          /// TODO: Addd mentor, mentat, members etc.
        ],
      ),
    );
  }
}
