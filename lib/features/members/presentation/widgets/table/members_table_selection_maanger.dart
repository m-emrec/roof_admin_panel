import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/views/member_detail.dart';
import 'package:roof_admin_panel/features/members/presentation/models/table_name_field_model.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MembersTableSelectionManager extends RowSelectionManager {
  MembersTableSelectionManager({required this.ref, required this.context});

  final WidgetRef ref;
  final BuildContext context;
  @override
  void handleTap(RowColumnIndex rowColumnIndex) {
    /// Here, we only handle the tap event if the column index is 0.
    ///
    /// This is because I want to be able select the entire row when the user taps on
    /// the first column.
    ///
    /// If the user taps on any other column,
    /// I want to handle the tap event in the parent widget.
    if (rowColumnIndex.columnIndex == 2) {
      _onUserNameCellTap(
        ref,
        context,
        rowColumnIndex,
      );
    }
  }

  T _getValue<T>(RowColumnIndex rowColumnIndex) {
    final table = ref.read(membersTableSourceProvider);

    final cell = table.effectiveRows[rowColumnIndex.rowIndex - 1]
        .getCells()[rowColumnIndex.columnIndex - 1];
    return cell.value as T;
  }

  void _onUserNameCellTap(
    WidgetRef ref,
    BuildContext context,
    RowColumnIndex rowColumnIndex,
  ) {
    final user = _getValue<TableNameFieldModel>(rowColumnIndex);
    final member = ref
        .read(membersViewModelProvider)
        .value
        ?.firstWhere((e) => e.phoneNumber == user.phoneNumber);

    CustomAlertDialog.showAlertDialog(
      context: context,
      barrierDismissible: true,
      content: MemberDetailDialog(
        member: member,
      ),
    );
    // }
  }
}
