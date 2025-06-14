import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/managers/presentation/providers/managers_provider.dart';

import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';

class AddPermissions extends ConsumerStatefulWidget {
  const AddPermissions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddPermissionsState();
}

class _AddPermissionsState extends ConsumerState<AddPermissions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: SpacingSizes.medium,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SpacingSizes.extraSmall,
          children: [
            Text(
              LocaleKeys.managersView_addPermission.tr(),
              style: context.textTheme.titleMedium,
            ),
            Text(
              LocaleKeys.managersView_addPermissionDescription.tr(),
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
        GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.responsiveSelector(mobile: 1, desktop: 2),
            mainAxisSpacing: SpacingSizes.small,
            crossAxisSpacing: SpacingSizes.small,
            mainAxisExtent: SpacingSizes.large,
          ),
          children: Permissions.values.map((permission) {
            return Row(
              children: [
                FilterChip(
                  showCheckmark: false,
                  avatar: shouldShowWarning(permission),
                  color: context.theme.chipTheme.color,
                  tooltip: permission.description,
                  label: Text(permission.toLocale()),
                  selected: ref
                          .watch(addManagerViewModelProvider)
                          .permissions
                          ?.contains(permission) ??
                      false,
                  onSelected: (isSelected) {
                    ref
                        .read(addManagerViewModelProvider.notifier)
                        .addPermission(permission);
                  },
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget? shouldShowWarning(Permissions permission) {
    final a = [
      Permissions.canEdit,
      Permissions.canRead,
      Permissions.canEditManagers,
      Permissions.canEditMembershipFees,
      Permissions.canEditBannedMembers,
    ];
    if (a.contains(permission)) {
      return Icon(
        Icons.warning_rounded,
        color: AppColors.accentError[90],
      );
    }
    return null;
  }
}
