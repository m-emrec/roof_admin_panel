import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/providers.dart';

class RoleDropDown extends ConsumerStatefulWidget {
  const RoleDropDown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoleDropDownState();
}

class _RoleDropDownState extends ConsumerState<RoleDropDown> {
  final List<Role> selectableRoles = [];
  Role selectedRole = Role.member;
  @override
  void initState() {
    for (final element in Role.values) {
      if (element != Role.other &&
          element != Role.guest &&
          element != Role.approvedGuest) {
        selectableRoles.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      items: selectableRoles
          .map(
            (e) => e.localizedText(),
          )
          .toList(),
      initialValue: selectedRole.localizedText(),
      onChanged: (value) {
        selectedRole = value.toString().fromLocalizedStringToRoleEnum();

        ref.read(addMemberProvider.notifier).setRole(selectedRole);
      },
    );
  }
}
