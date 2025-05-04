import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/membership-fees/data/models/membership_fees.dart';

/// A card that displays the membership fees
class FeesCard extends StatelessWidget {
  /// male constructor
  FeesCard.male({
    required this.fees,
    super.key,
  })  : title = LocaleKeys.common_gender.tr(gender: "male"),
        discount = 0;

  ///
  FeesCard.female({
    required this.fees,
    super.key,
  })  : title = LocaleKeys.common_gender.tr(gender: "female"),
        discount = (fees.discounts["female"]?.toDouble() ?? 100) / 100;

  ///
  final String title;

  ///
  final MembershipFees fees;

  ///
  final double discount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const AppPadding.horizontalMSymmetric() +
            const AppPadding.verticalMSymmetric(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: SpacingSizes.small,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.titleMedium,
            ),

            /// Body
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: SpacingSizes.extraLarge,
              children: [
                /// Durations
                _FeesCardColumn(
                  LocaleKeys.membershipFeesView_duration.tr(),
                  _durations,
                ),

                /// Prices
                _FeesCardColumn(
                  LocaleKeys.membershipFeesView_fullPrice.tr(),
                  _fullPrices,
                ),

                /// Student Prices
                _FeesCardColumn(
                  LocaleKeys.membershipFeesView_studentPrice.tr(),
                  _studentPrices,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> get _durations {
    return fees.rates.keys
        .map((e) => '$e  ${LocaleKeys.common_date_month.tr()}')
        .toList();
  }

  List<String> get _fullPrices {
    return fees.rates.values.map((e) => (e - e * discount).toString()).toList();
  }

  List<String> get _studentPrices {
    final discount = (fees.discounts["student"] ?? 100) / 100;
    return _fullPrices
        .map((e) => (int.parse(e) - int.parse(e) * discount).toString())
        .toList();
  }
}

class _FeesCardColumn extends StatelessWidget {
  const _FeesCardColumn(this.title, this.items);

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SpacingSizes.small,
      children: [
        Column(
          children: [
            Text(
              title,
              style: context.textTheme.labelLarge,
            ),
            SizedBox(
              width: SpacingSizes.large,
              child: Divider(
                color: AppColors.primaryColor[50],
                thickness: 2,
              ),
            ),
          ],
        ),
        ...items.map(
          (e) => Text(
            e,
            style: context.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
