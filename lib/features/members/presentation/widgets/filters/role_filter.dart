import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';

class RoleFilter extends ConsumerWidget {
  const RoleFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Role? roleFilter = ref.watch(filterNotifierProvider).roleFilter;
    return PopupMenuButton(
      child: Chip(
        labelStyle: context.textTheme.labelMedium,
        onDeleted: roleFilter != null
            ? () => ref
                .read(filterNotifierProvider.notifier)
                .removeFilter(MemberTableNames.role)
            : null,
        label: SizedBox(
          width: double.maxFinite,
          child: Text(
            roleFilter != null
                ? roleFilter.localizedText("")
                : LocaleKeys.membersView_filters_roleFilterLabel.tr(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      itemBuilder: (context) {
        return Role.values.map((role) {
          return PopupMenuItem(
            value: role,
            onTap: () => ref
                .read(filterNotifierProvider)
                .addFilter(MemberTableNames.role, role.localizedText("")),
            child: Text(role.localizedText("")),
          );
        }).toList();
      },
    );
  }
}
