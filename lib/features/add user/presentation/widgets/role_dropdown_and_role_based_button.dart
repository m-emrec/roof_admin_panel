import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/role_based_buttons.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/role_drop_down.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class RoleDropDownAndRoleBasedButton extends StatelessWidget {
  const RoleDropDownAndRoleBasedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      required: true,
      title: LocaleKeys.addMember_role.tr(),
      child: const Column(
        spacing: SpacingSizes.extraExtraSmall,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoleDropDown(),
          RoleBasedButtons(),
        ],
      ),
    );
  }
}
