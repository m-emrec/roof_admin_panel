import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';

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
      child: CustomDropDownButton(
        items: List.generate(
          12,
          (index) => "${index + 1} ${LocaleKeys.common_date_month.tr()}",
        ),
        initialValue: "${controller.text} ${LocaleKeys.common_date_month.tr()}",
        onChanged: (value) {
          ref.read(addMemberProvider).memberShipDurationController.text =
              value.toString().split(" ")[0];
        },
      ),
    );
  }
}
