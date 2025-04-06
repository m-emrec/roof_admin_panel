import 'package:core/core.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';

class RoleSelectionDropDown extends StatelessWidget {
  RoleSelectionDropDown({
    required this.roleKey,
    super.key,
  }) : selectableRoles = Role.values
            .where(
              (element) =>
                  element != Role.other &&
                  element != Role.guest &&
                  element != Role.approvedGuest,
            )
            .toList();
  RoleSelectionDropDown.guest({
    required this.roleKey,
    super.key,
  }) : selectableRoles = Role.values
            .where(
              (element) =>
                  element == Role.guest || element == Role.approvedGuest,
            )
            .toList();
  final ValueNotifier<Role> roleKey;
  final List<Role> selectableRoles;
  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      items: selectableRoles
          .map(
            (e) => e.localizedText(),
          )
          .toList(),
      initialValue: roleKey.value.localizedText(),
      onChanged: (value) {
        final selectedRole = value.toString().fromLocalizedStringToRoleEnum();
        roleKey.value = selectedRole;
      },
    );
  }
}
