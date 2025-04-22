import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/role_drop_down.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/add_mentor_button.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class RoleDropdownAndAddMentorButton extends ConsumerStatefulWidget {
  const RoleDropdownAndAddMentorButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RoleDropDownAndRoleBasedButtonState();
}

class _RoleDropDownAndRoleBasedButtonState
    extends ConsumerState<RoleDropdownAndAddMentorButton> {
  late final ValueNotifier<UserModel> selectedUsers;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    selectedUsers = ref.watch(
      addMemberProvider.select((p) => p.selectedUsers),
    );
    selectedUsers.addListener(() {
      ref.read(addMemberProvider).roleBasedAction(selectedUsers.value);
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    selectedUsers
      ..removeListener(() {
        ref.read(addMemberProvider).roleBasedAction(selectedUsers.value);
      })
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      required: true,
      title: LocaleKeys.addMember_role.tr(),
      child: Column(
        spacing: SpacingSizes.extraExtraSmall,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RoleDropDown(),
          AddMentorButton(
            user: ref.watch(addMemberProvider.select((p) => p.user)),
            selectedUsers: selectedUsers,
          ),
        ],
      ),
    );
  }
}
