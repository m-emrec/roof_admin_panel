import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/role_drop_down.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/add_mentor_button.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class RoleDropDownAndRoleBasedButton extends ConsumerWidget {
  const RoleDropDownAndRoleBasedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<UserModel> selectedUsers =
        ValueNotifier(ref.watch(addMemberProvider).user);
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
          TextButton(
            child: Text("data"),
            onPressed: () {
              ref.read(addMemberProvider).roleBasedAction(selectedUsers.value);

              Log.debug(ref.read(addMemberProvider).user);
            },
          ),
        ],
      ),
    );
  }
}
