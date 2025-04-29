import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';

class RoleDropDown extends ConsumerStatefulWidget {
  const RoleDropDown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoleDropDownState();
}

class _RoleDropDownState extends ConsumerState<RoleDropDown> {
  Role selectedRole = Role.member;

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      items: Role.values.getMemberRelatedRoles
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
