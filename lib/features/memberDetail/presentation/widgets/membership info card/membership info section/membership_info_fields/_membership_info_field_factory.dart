part of '../membership_info_section.dart';

class _MembershipInfoFieldFactory {
  _MembershipInfoFieldFactory._();

  static List<BaseMembershipField<dynamic>> _membershipCardFields(
    WidgetRef ref,
  ) {
    final member = ref.watch(membershipDetailNotifierProvider);
    final membershipNotifierProvider =
        ref.read(membershipDetailNotifierProvider.notifier);
    return [
      // Membership Number
      TextMembershipInfoField(
        label: LocaleKeys.memberDetailView_membershipInfo_memberNumber.tr(),
        value: member?.memberNumber ?? "",
        controller: membershipNotifierProvider.memberNumberController,
      ),
      // Membership Start Date
      DateMembershipInfoField(
        label:
            LocaleKeys.memberDetailView_membershipInfo_memberShipStartDate.tr(),
        value: member?.membershipStartDate,
        controller: membershipNotifierProvider.membershipStartDateController,
      ),
      // Membership End Date
      DateMembershipInfoField(
        label:
            LocaleKeys.memberDetailView_membershipInfo_memberShipEndDate.tr(),
        value: member?.membershipEndDate,
        controller: membershipNotifierProvider.membershipEndDateController,
      ),
      // Membership duration
      TextMembershipInfoField.notEditable(
        label:
            LocaleKeys.memberDetailView_membershipInfo_memberShipDuration.tr(),
        value: member?.membershipStartDate != null
            ? "${DateTime.now().difference(member!.membershipStartDate!).inDays} ${LocaleKeys.common_date_day.tr()}"
            : "",
      ),
    ];
  }

  static List<Widget> factory(
    WidgetRef ref,
  ) =>
      _membershipCardFields(ref)
          .map(
            _MembershipInfo.new,
          )
          .toList();
}
