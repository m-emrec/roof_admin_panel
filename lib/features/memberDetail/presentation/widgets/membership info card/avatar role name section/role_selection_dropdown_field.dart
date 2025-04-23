import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_fields/base_member_ship_info_field.dart';
import 'package:roof_admin_panel/product/widgets/role_selection_drop_down.dart';

final class RoleSelectionDropdownField
    extends BaseMembershipInfoField<List<Role?>> {
  RoleSelectionDropdownField({
    required super.value,
    required this.roleKey,
    super.controller,
  }) : super(
          label: "",
          isEditable: true,
        );
  final ValueNotifier<Role> roleKey;
  @override
  Widget editStateWidget(BuildContext context) {
    return RoleSelectionDropDown(
      roleKey: roleKey,
    );
  }

  @override
  Widget widget(BuildContext context) {
    return Text(
      value.map((e) => e?.localizedText("")).join(" | "),
      style: context.theme
          .extension<MembershipInfoCardThemeExtension>()
          ?.roleTextStyle,
    );
  }
}
