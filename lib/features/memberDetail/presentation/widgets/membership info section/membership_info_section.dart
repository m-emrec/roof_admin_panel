import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/responsive_builder.dart';
part '_member_ship_info_card_item.dart';

class MembershipInfoSection extends StatelessWidget {
  const MembershipInfoSection({
    required this.member,
  });

  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: _MobileView(member: member),
      desktop: Flexible(child: _MobileView(member: member)),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({
    required this.member,
  });

  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: SpacingSizes.large,
      runSpacing: SpacingSizes.small,
      runAlignment: WrapAlignment.center,
      children: [
        _MembershipInfoCardItem(
          label: LocaleKeys.memberDetailView_membershipInfo_memberNumber.tr(),
          value: member?.memberNumber,
        ),

        _MembershipInfoCardItem(
          label: LocaleKeys.memberDetailView_membershipInfo_memberShipStartDate
              .tr(),
          value: member?.membershipStartDate?.formatDate(context),
        ),
        _MembershipInfoCardItem(
          label:
              LocaleKeys.memberDetailView_membershipInfo_memberShipEndDate.tr(),
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
    );
  }
}
