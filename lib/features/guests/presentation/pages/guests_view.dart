import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/guests/presentation/widgets/add_guest_button.dart';
import 'package:roof_admin_panel/features/guests/presentation/widgets/guest_table_actions_row.dart';
import 'package:roof_admin_panel/features/guests/presentation/widgets/guest%20table/guests_table.dart';
import 'package:roof_admin_panel/product/widgets/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

/// GuestsView
class GuestsView extends StatelessWidget {
  /// GuestsView
  const GuestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SpacingSizes.small,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(title: LocaleKeys.guestsView_pageTitle.tr()),
        const AddGuestButton(),
        const GuestTableActionsRow(),
        AsyncDataBuilder(
          provider: guestsViewModelProvider,
          data: (guests) {
            return Expanded(
              child: GuestsTable(guests: guests),
            );
          },
        ),
      ],
    );
  }
}
