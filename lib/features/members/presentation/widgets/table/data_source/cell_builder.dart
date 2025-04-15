import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/constant_values.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/models/table_name_field_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/views/mentorship_widget.dart';
import 'package:roof_admin_panel/product/utility/extensions/show_click_mouse_cursor_on_widget_extension.dart';
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
            color: ConstantValues.isMembershipExpiringSoon(value)
                ? AppColors.accentError[10]?.withValues(
                    alpha: 0.3,
                  )
                : null,
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
        value as TableNameFieldModel;
        return _cell(
          Tooltip(
            message: LocaleKeys.membersView_seeMemberDetail.tr(),
            child: TableUserAvatar(
              userName: value.name,
              phoneNumber: value.phoneNumber,
              imageUrl: value.imageUrl,
            ),
          ),
        ).showClickMouseCursorOnWidget();
      case MemberTableNames.x:
        value as UserModel;

        return _cell(
          Padding(
            padding: const EdgeInsets.all(8),
            child: FittedBox(
              child: MentorshipWidget(value),
            ),
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
  Container _cell(Widget child, {Color? color}) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: child,
    );
  }
}
