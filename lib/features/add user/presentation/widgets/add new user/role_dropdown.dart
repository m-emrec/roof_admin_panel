import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/core/constants/enums/roles.dart';
import 'package:roof_admin_panel/core/utils/widgets/custom_drop_down_button.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';
import 'package:roof_admin_panel/product/widgets/validation_wrapper.dart';

class RoleDropdown extends ConsumerStatefulWidget {
  const RoleDropdown({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoleDropdownState();
}

class _RoleDropdownState extends ConsumerState<RoleDropdown> {
  final List<Role> roles = [];
  Role selectedRole = Role.member;
  @override
  void initState() {
    for (final element in Role.values) {
      if (element != Role.other &&
          element != Role.guest &&
          element != Role.approvedGuest) {
        roles.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      required: true,
      title: LocaleKeys.addMember_role.tr(),
      child: CustomDropDownButton(
        items: roles
            .map(
              (e) => e.localizedText(),
            )
            .toList(),
        initialValue: selectedRole.localizedText(),
        onChanged: (value) {
          selectedRole = value.toString().fromLocalizedStringToRoleEnum();

          ref.read(addMemberProvider.notifier).setRole(selectedRole);
        },
      ),
    );
  }
}
