import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';

/// This is a drop down button for membership duration
///
/// It takes :
///
/// 1. [controller] : The controller to control the text field
class MemberShipDurationDropDown extends ConsumerWidget {
  /// This is a drop down button for membership duration
  ///
  /// It takes :
  ///
  /// 1. [controller] : The controller to control the text field
  const MemberShipDurationDropDown({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: LocaleKeys.addMember_memberShipDuration.tr(),
      child: AsyncDataBuilder(
        provider: membershipFeesViewModelProvider,
        data: (p0) => CustomDropDownButton(
          items: p0.rates.keys
              .map(
                (e) => '$e ${LocaleKeys.common_date_month.tr()}',
              )
              .toList(),
          initialValue:
              "${controller.text} ${LocaleKeys.common_date_month.tr()}",
          onChanged: (value) {
            ref.read(addMemberProvider).memberShipDurationController.text =
                value.toString().split(" ")[0];
          },
        ),
      ),
    );
  }
}
