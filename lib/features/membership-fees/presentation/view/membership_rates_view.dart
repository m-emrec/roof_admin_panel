// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/widgets/fees_card.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/widgets/update_membership_fees_dialog.dart';
import 'package:roof_admin_panel/product/widgets/app_text_button.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class MembershipRatesView extends ConsumerWidget {
  const MembershipRatesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncDataBuilder(
      provider: membershipFeesViewModelProvider,
      data: (data) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: AppTextButton(
                onPressed: () {
                  CustomAlertDialog.showAlertDialog<void>(
                    barrierDismissible: true,
                    context: context,
                    content: const UpdateMembershipFeesDialog(),
                  );
                },
                title: LocaleKeys.common_edit.tr(),
              ),
            ),
            Scrollbar(
              thumbVisibility: true,
              child: Wrap(
                spacing: SpacingSizes.large,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FeesCard.male(
                      fees: data,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FeesCard.female(
                      fees: data,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
