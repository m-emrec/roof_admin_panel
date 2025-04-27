import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_table_names.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';
import 'package:roof_admin_panel/product/widgets/table/custom_table.dart';
import 'package:roof_admin_panel/product/widgets/table/header_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
part 'guests_table_utils.dart';

/// GuestsTable
class GuestsTable extends ConsumerWidget with _TableColumnBuilderMixin {
  /// GuestsTable
  GuestsTable({required this.guests, super.key});

  /// List of guests
  final List<Guest> guests;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTable(
      onSelectionChanged: (added, removed) =>
          _GuestsTableUtils(added, removed, ref).onSelectionChanged(),
      source: ref.watch(guestsTableSourceProvider),
      columns: buildColumns(context),
    );
  }
}

///
mixin _TableColumnBuilderMixin {
  final List<GuestTableNames> _tableNames = [
    GuestTableNames.name,
    GuestTableNames.phoneNumber,
    GuestTableNames.gender,
    GuestTableNames.guestStartDate,
    GuestTableNames.joinedEventCount,
    GuestTableNames.role,
  ];

  ///
  List<GridColumn> buildColumns(BuildContext context) {
    return _tableNames.map(
      (e) {
        final bool visibility;
        if (e == GuestTableNames.role) {
          visibility = false;
        } else {
          visibility = true;
        }

        return GridColumn(
          columnName: e.name,
          visible: visibility,
          label: ColumnTitle(
            title: e.toLocale,
          ),
          columnWidthMode: context.responsiveSelector(
            mobile: ColumnWidthMode.auto,
            tablet: ColumnWidthMode.auto,
            desktop: ColumnWidthMode.fill,
          ),
          allowEditing: false,
        );
      },
    ).toList();
  }
}
