// ignore_for_file: public_member_api_docs

import 'package:roof_admin_panel/features/membership-fees/domain/entities/membership_fees_entity.dart';

class MembershipFees extends MembershipFeesEntity {
  MembershipFees({required super.rates, required super.discounts});

  ///
  factory MembershipFees.fromEntity(
    MembershipFeesEntity entity,
  ) {
    return MembershipFees(
      rates: entity.rates,
      discounts: entity.discounts,
    );
  }

  ///
  factory MembershipFees.fromJson(Map<String, dynamic> json) {
    return MembershipFees(
      rates: Map<String, int>.from(json['rates'] as Map),
      discounts: Map<String, int>.from(json['discounts'] as Map),
    );
  }
  ////
  Map<String, dynamic> toJson() {
    return {
      'rates': rates,
      'discounts': discounts,
    };
  }

  ///
  MembershipFeesEntity toEntity() {
    return MembershipFeesEntity(
      rates: rates,
      discounts: discounts,
    );
  }
}
