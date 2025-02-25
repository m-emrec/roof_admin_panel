import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/guests_view_model.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
part 'guests_table_action_rows_utils.dart';

/// This is a ConsumerWidget that displays a row of buttons that can be used to
/// approve or delete selected rows in a table.
///
/// It uses the [selectedRowsProvider] to get the selected rows.
///
class GuestTableActionsRow extends ConsumerWidget {
  /// This is a ConsumerWidget that displays a row of buttons that can be used to
  /// approve or delete selected rows in a table.
  ///
  /// It uses the [selectedRowsProvider] to get the selected rows.
  ///
  const GuestTableActionsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonsActive = ref.watch(selectedGuestsProvider).isNotEmpty;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: isButtonsActive
              ? () => _GuestsTableActionRowUtils(context, ref).approveGuests()
              : null,
          style: context.theme.textButtonTheme.style?.copyWith(
            foregroundColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey;
              }
              return AppColors.primaryColor[70] ?? Colors.grey;
            }),
          ),
          child: Text(LocaleKeys.guestsView_approveAGuest.tr()),
        ),
        TextButton(
          onPressed: isButtonsActive
              ? () => _GuestsTableActionRowUtils(context, ref).deleteGuests()
              : null,
          style: context.theme.textButtonTheme.style?.copyWith(
            foregroundColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey;
              }
              return AppColors.accentError[70] ?? Colors.grey;
            }),
          ),
          child: Text(LocaleKeys.guestsView_removeAGuest.tr()),
        ),
      ],
    );
  }
}
