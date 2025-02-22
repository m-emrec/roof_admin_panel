import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';

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
              ? () => ref.read(guestsViewModelProvider.notifier).approveGuests(
                    ref.read(selectedGuestsProvider),
                  )
              : null,
          child: Text(LocaleKeys.common_confirm.tr()),
        ),
        TextButton(
          onPressed: isButtonsActive
              ? () => ref
                  .read(guestsViewModelProvider.notifier)
                  .deleteGuest(
                    ref.read(selectedGuestsProvider),
                  )
                  .then(
                    (_) => ref.read(selectedGuestsProvider.notifier).state = [],
                  )
              : null,
          child: Text(LocaleKeys.common_delete.tr()),
        ),
      ],
    );
  }
}
