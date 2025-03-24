import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/product/widgets/table/table_cell_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_date_item.dart';
import 'package:roof_admin_panel/product/widgets/table/table_null_item.dart';
import 'package:roof_admin_panel/product/widgets/table/user_avatar_item.dart';

mixin CellBuilder {
  /// Builds the cell widget based on the [columnName] and given [value].
  Widget cellBuilder(MemberTableNames columnName, dynamic value) {
    if (value == null) {
      return _cell(
        const TableNullItem(),
      );
    }
    switch (columnName) {
      case MemberTableNames.membershipEndDate:
        if (value is DateTime) {
          return _cell(
            TableDateItem(date: value),
          );
        }
      case MemberTableNames.age:
        return _cell(
          TableCellItem(
            label: value.toString(),
          ),
        );

      case MemberTableNames.role:
        value as List<String?>;
        return _cell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final role in value) TableCellItem(label: role.toString()),
            ],
          ),
        );

      case MemberTableNames.memberName:
        value as List<String?>;
        return _cell(
          TableUserAvatar(
            userName: value[0].toString(),
            phoneNumber: value[1].toString(),
          ),
        );

      /// I use default case here because rest of the fields are
      /// [TableRowItem]
      // ignore: no_default_cases
      default:
        return _cell(
          TableCellItem(label: value.toString()),
        );
    }
    return Container(
      alignment: Alignment.center,
      child: Text(value.toString()),
    );
  }

  /// Builds the cell widget
  Container _cell(Widget child) {
    return Container(
      alignment: Alignment.center,
      child: child,
    );
  }
}
