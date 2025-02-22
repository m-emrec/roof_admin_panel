import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/guests/data/datasources/guests_table_source.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_table_names.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/table/custom_table.dart';
import 'package:roof_admin_panel/product/widgets/table/header_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
part 'guests_table_utils.dart';

/// GuestsTable
class GuestsTable extends ConsumerWidget {
  /// GuestsTable
  const GuestsTable({required this.guests, super.key});

  /// List of guests
  final List<Guest> guests;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTable(
      onSelectionChanged: (added, removed) =>
          _GuestsTableUtils.onSelectionChanged(added, removed, ref),
      // onCellTap: (p0) => Log.debug('Cell Tapped: $p0'),
      source: GuestsTableSource(guests),
      columns: [
        GridColumn(
          columnName: GuestTableNames.name.name,
          label: ColumnTitle(
            title: LocaleKeys.guestsView_tableColumnLabels_name.tr(),
          ),
        ),
        GridColumn(
          columnName: GuestTableNames.phoneNumber.name,
          label: ColumnTitle(
            title: LocaleKeys.guestsView_tableColumnLabels_phoneNumber.tr(),
          ),
        ),
        GridColumn(
          columnName: GuestTableNames.gender.name,
          label: ColumnTitle(
            title: LocaleKeys.guestsView_tableColumnLabels_guestStartDate.tr(),
          ),
        ),
        GridColumn(
          columnName: GuestTableNames.guestStartDate.name,
          label: ColumnTitle(
            title: LocaleKeys.guestsView_tableColumnLabels_guestStartDate.tr(),
          ),
        ),
        GridColumn(
          columnName: GuestTableNames.joinedEventCount.name,
          label: ColumnTitle(
            title:
                LocaleKeys.guestsView_tableColumnLabels_joinedEventCount.tr(),
          ),
        ),
        GridColumn(
          columnName: GuestTableNames.role.name,
          label: ColumnTitle(
            title: LocaleKeys.guestsView_tableColumnLabels_role.tr(),
          ),
          visible: false,
        ),
      ],
    );
  }
}
