import 'package:core/utils/logger/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/pages/add_member_page.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/handlers/permissions_handler.dart';

class AddMemberButton extends ConsumerWidget {
  const AddMemberButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: PermissionBasedAction(
            () => ref.read(shouldShowAddMemberTableProvider.notifier).state =
                true,
            necessaryPermissions: [
              Permissions.canEdit,
              Permissions.canEditMembers,
            ],
          ).call(),
          icon: const Icon(Icons.add),
          label: Text(LocaleKeys.membersView_addMember.tr()),
        ),
        TextButton(
          onPressed: () => ref.read(addMemberProvider).addNewMember(),
          child: const Text("Hide Table"),
        ),
        Visibility(
          visible: ref.watch(shouldShowAddMemberTableProvider),
          child: const AddMemberTable(),
        ),
      ],
    );
  }
}
