import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/member_ship_info_card_item.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';

class MembershipInfoSection extends StatelessWidget {
  const MembershipInfoSection({
    super.key,
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
        MemberInfoCardItem(
          label: LocaleKeys.memberDetailView_memberNumber.tr(),
          value: member?.memberNumber,
        ),
        MemberInfoCardItem(
          label: LocaleKeys.memberDetailView_phoneNumber.tr(),
          value: member?.phoneNumber,
        ),
        MemberInfoCardItem(
          label: LocaleKeys.memberDetailView_memberShipStartDate.tr(),
          value: member?.membershipStartDate?.formatDate(context),
        ),
        MemberInfoCardItem(
          label: LocaleKeys.memberDetailView_memberShipEndDate.tr(),
          value: member?.membershipEndDate?.formatDate(context),
        ),
        MemberInfoCardItem(
          label: LocaleKeys.memberDetailView_memberShipDuration.tr(),
          value: member?.membershipStartDate != null
              ? "${DateTime.now().difference(member!.membershipStartDate!).inDays} ${LocaleKeys.common_date_day.tr()}"
              : "",
        ),
      ],
    );
  }
}
