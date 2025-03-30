part of "membership_info_card.dart";

class _MembershipInfoSection extends StatelessWidget {
  const _MembershipInfoSection({
    required this.member,
  });

  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: SpacingSizes.medium,
        crossAxisSpacing: SpacingSizes.extraSmall,
        mainAxisSpacing: SpacingSizes.extraSmall,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        _MembershipInfoCardItem(
          label: LocaleKeys.memberDetailView_memberNumber.tr(),
          value: member?.memberNumber,
        ),
        _MembershipInfoCardItem(
          label: LocaleKeys.memberDetailView_phoneNumber.tr(),
          value: member?.phoneNumber,
        ),
        _MembershipInfoCardItem(
          label: LocaleKeys.memberDetailView_memberShipStartDate.tr(),
          value: member?.membershipStartDate?.formatDate(context),
        ),
        _MembershipInfoCardItem(
          label: LocaleKeys.memberDetailView_memberShipEndDate.tr(),
          value: member?.membershipEndDate?.formatDate(context),
        ),
        _MembershipInfoCardItem(
          label: LocaleKeys.memberDetailView_memberShipDuration.tr(),
          value: member?.membershipStartDate != null
              ? "${DateTime.now().difference(member!.membershipStartDate!).inDays} ${LocaleKeys.common_date_day.tr()}"
              : "",
        ),

        /// TODO: Addd mentor, mentat, members etc.
      ],
    );
  }
}
