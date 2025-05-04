// ignore_for_file: public_member_api_docs, sort_constructors_first
class MembershipFeesEntity {
  MembershipFeesEntity({
    required this.rates,
    required this.discounts,
  });

  final Map<String, int> rates;
  final Map<String, int> discounts;
}
