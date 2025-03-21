import 'package:core/utils/logger/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/filters/age_filter.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class FilterDialog extends ConsumerWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAlertDialog(
      title: const Text("Filter"),
      content: SizedBox(
        width: 400,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// age
            AgeFilter(),

            // membership end duration ( slider )

            // role ( dropdown )
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
        TextButton(
          onPressed: () {
            ref.read(filterNotifierProvider.notifier).applyFilters();
            CustomAlertDialog.hideAlertDialog(context);

            Log.debug(ref.read(membersTableSourceProvider).filterConditions);
          },
          child: Text(LocaleKeys.common_save.tr()),
        ),
      ],
    );
  }
}
