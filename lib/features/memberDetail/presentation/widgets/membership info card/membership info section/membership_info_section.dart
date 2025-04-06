import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/date_selection_field.dart';
part '_member_ship_info_card_item.dart';

class MembershipInfoSection extends ConsumerWidget {
  const MembershipInfoSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(memberProvider);
    return context.responsiveSelector<Widget>(
      mobile: _MembershipInfoGrid(
        member: member,
      ),
      desktop: Flexible(
        child: _MembershipInfoGrid(
          member: member,
        ),
      ),
    );
  }
}

class _MembershipInfoGrid extends ConsumerWidget {
  const _MembershipInfoGrid({
    required this.member,
  });

  final UserModel? member;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membershipNotifierProvider =
        ref.read(membershipDetailNotifierProvider.notifier);
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.responsiveSelector<int>(
          mobile: 1,
          desktop: 2,
          tablet: 1,
        ),
        crossAxisSpacing: SpacingSizes.extraSmall,
        mainAxisSpacing: SpacingSizes.medium,
        mainAxisExtent: context.responsiveSelector<double>(
          mobile: SpacingSizes.small,
          desktop: SpacingSizes.small,
          tablet: SpacingSizes.large,
        ),
      ),
      children: [
        _MembershipInfoCardItem(
          label: LocaleKeys.memberDetailView_membershipInfo_memberNumber.tr(),
          child: _TextItem(
            value: member?.memberNumber ?? "",
            editStateLabel:
                LocaleKeys.memberDetailView_membershipInfo_memberNumber.tr(),
            controller: membershipNotifierProvider.memberNumberController,
          ),
        ),
        _MembershipInfoCardItem(
          label: LocaleKeys.memberDetailView_membershipInfo_memberShipStartDate
              .tr(),
          child: _DateItem(
            member?.membershipStartDate,
            LocaleKeys.memberDetailView_membershipInfo_memberShipStartDate.tr(),
            membershipNotifierProvider.membershipStartDateController,
          ),
        ),
        _MembershipInfoCardItem(
          label:
              LocaleKeys.memberDetailView_membershipInfo_memberShipEndDate.tr(),
          child: _DateItem(
            member?.membershipEndDate,
            LocaleKeys.memberDetailView_membershipInfo_memberShipEndDate.tr(),
            membershipNotifierProvider.membershipEndDateController,
          ),
        ),
        _MembershipInfoCardItem.notEditable(
          label: LocaleKeys.memberDetailView_membershipInfo_memberShipDuration
              .tr(),
          child: _TextItem(
            value: member?.membershipStartDate != null
                ? "${DateTime.now().difference(member!.membershipStartDate!).inDays} ${LocaleKeys.common_date_day.tr()}"
                : "",
            editStateLabel: LocaleKeys
                .memberDetailView_membershipInfo_memberShipDuration
                .tr(),
          ),
        ),
        _MembershipInfoCardItem.notEditable(
          label: LocaleKeys.memberDetailView_membershipInfo_mentor.tr(),
          child: const _TextItem(
            value: "mentor widget",
            editStateLabel: "asd",
          ),
        ),
      ],
    );
  }
}
