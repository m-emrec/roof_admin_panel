import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/guests_table_theme_extension.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/table/table_cell_item.dart';

///
class GuestsTableJoinedEventCountItem extends ConsumerWidget {
  ///
  const GuestsTableJoinedEventCountItem(
    this.count,
    this.phoneNumber, {
    super.key,
  });

  /// The count of joined events
  final int count;

  /// The phone number of the guest to update the count
  final String phoneNumber;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: count == 0
              ? null
              : () => ref
                  .read(guestsViewModelProvider.notifier)
                  .decreaseJoinedEventCount(
                    ref.read(guestsTableSourceProvider).getGuestByPhoneNumber(
                          phoneNumber: phoneNumber,
                        ),
                  ),
          icon: const Icon(Icons.remove),
          style: context.theme
              .extension<GuestsTableThemeExtension>()
              ?.joinedEventCountButtonStyle,
        ),
        TableCellItem(
          label: count.toString(),
        ),
        IconButton(
          onPressed: () => ref
              .read(guestsViewModelProvider.notifier)
              .increaseJoinedEventCount(
                ref.read(guestsTableSourceProvider).getGuestByPhoneNumber(
                      phoneNumber: phoneNumber,
                    ),
              ),
          icon: const Icon(Icons.add),
          style: context.theme
              .extension<GuestsTableThemeExtension>()
              ?.joinedEventCountButtonStyle,
        ),
      ],
    );
  }
}
