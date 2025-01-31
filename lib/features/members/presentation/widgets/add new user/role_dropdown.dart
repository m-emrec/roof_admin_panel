import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/core/constants/enums/roles.dart';
import 'package:roof_admin_panel/core/utils/widgets/custom_drop_down_button.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class RoleDropdown extends StatelessWidget {
  final TextEditingController controller;
  const RoleDropdown({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Section(
      required: true,
      title: LocaleKeys.membersView_addUserDialog_role.tr(),
      child: CustomDropDownButton(
        items: Role.values
            .map(
              (e) => e.text(""),
            )
            .toList(),
        initialValue: Role.guest.text(),
        onChanged: (value) {
          controller.text = value.toString();
        },
      ),
    );
  }
}
