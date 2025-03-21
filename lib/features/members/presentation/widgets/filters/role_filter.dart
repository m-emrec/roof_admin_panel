import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';

class RoleFilter extends ConsumerWidget {
  const RoleFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      child: Chip(
        labelStyle: context.textTheme.labelMedium,
        label: SizedBox(
          width: double.maxFinite,
          child: Text(
            LocaleKeys.membersView_filters_roleFilterLabel.tr(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      itemBuilder: (context) {
        return Role.values.map((role) {
          return PopupMenuItem(
            value: role,
            onTap: () => ref
                .read(filterNotifierProvider.notifier)
                .addRoleFilter(role.localizedText("")),
            child: Text(role.localizedText("")),
          );
        }).toList();
      },
    );
  }
}
