import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

/// This is a drop down button for membership duration
///
/// It takes :
///
/// 1. [controller] : The controller to control the text field
class MemberShipDurationDropDown extends StatelessWidget {
  /// This is a drop down button for membership duration
  ///
  /// It takes :
  ///
  /// 1. [controller] : The controller to control the text field
  const MemberShipDurationDropDown({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: LocaleKeys.addMember_memberShipDuration.tr(),
      child: CustomDropDownButton(
        items: List.generate(
          12,
          (index) => "${index + 1} ${LocaleKeys.common_date_month.tr()}",
        ),
        initialValue: "${controller.text} ${LocaleKeys.common_date_month.tr()}",
        onChanged: (value) {
          controller.text = value.toString().split(" ")[0];
        },
      ),
    );
  }
}
