import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class MemberShipDurationDropDown extends StatelessWidget {
  const MemberShipDurationDropDown({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: LocaleKeys.addMember_memberShipDuration.tr(),
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
