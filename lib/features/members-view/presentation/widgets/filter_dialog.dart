import 'package:core/core.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members-view/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members-view/presentation/widgets/filters/members_age_filter.dart';
import 'package:roof_admin_panel/features/members-view/presentation/widgets/filters/membership_end_duration_filter.dart';
import 'package:roof_admin_panel/features/members-view/presentation/widgets/filters/role_filter.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class FilterDialog extends ConsumerWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvokedWithResult: (_, __) =>
          ref.read(filterNotifierProvider).revertUnappliedFilters(),
      child: CustomAlertDialog(
        title: Text(LocaleKeys.membersView_filters_title.tr()),
        content: SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: SpacingSizes.small,
            children: [
              /// age
              MembersAgeFilter(),

              // membership end duration ( slider )
              MembershipEndDurationFilter(),
              // role ( dropdown )
              const MembersRoleFilter(),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              CustomAlertDialog.hideAlertDialog(context);
            },
            child: Text(LocaleKeys.common_close.tr()),
          ),
          Visibility(
            visible: ref.watch(filterNotifierProvider).isFilterApplied,
            child: TextButton(
              onPressed: () => ref.read(filterNotifierProvider).clearFilters(),
              child: Text(
                LocaleKeys.membersView_filters_clearFilters.tr(),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(filterNotifierProvider).applyFilters();

              CustomAlertDialog.hideAlertDialog(context);
            },
            child: Text(LocaleKeys.common_save.tr()),
          ),
        ],
      ),
    );
  }
}
