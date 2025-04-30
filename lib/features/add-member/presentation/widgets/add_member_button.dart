import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/handlers/permissions_handler.dart';

class AddMemberButton extends ConsumerWidget {
  const AddMemberButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: !ref.watch(shouldShowAddMemberTableProvider),
      child: TextButton.icon(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            context.textTheme.labelLarge,
          ),
          foregroundColor: WidgetStatePropertyAll(
            AppColors.primaryColor[50] ?? Colors.transparent,
          ),
        ),
        onPressed: PermissionBasedAction(
          () =>
              ref.read(shouldShowAddMemberTableProvider.notifier).state = true,
          necessaryPermissions: [
            Permissions.canEdit,
            Permissions.canEditMembers,
          ],
        ).executeIfAuthorized(),
        icon: const Icon(Icons.add),
        label: Text(
          LocaleKeys.membersView_addMember.tr(),
        ),
      ),
    );
  }
}
