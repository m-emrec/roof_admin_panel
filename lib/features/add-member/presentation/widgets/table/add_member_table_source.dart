import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/member_number_field.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/member_ship_duration_drop_down.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/role_drop_down.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/table_column_names.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/add_mentor_button.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/date_selection_field.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/gender_drop_down.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/phone_field.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AddMemberTableSource extends DataGridSource {
  AddMemberTableSource(
    this.ref,
  ) {
    generateRow();
  }

  final Ref ref;
  // DataGridRowGenerator({required super.users, required super.ref});
  List<DataGridRow> _dataGridRows = [];
  @override
  List<DataGridRow> get rows => _dataGridRows;

  Widget _cell(Widget child) {
    return Container(
      // height: 50,
      padding: const AppPadding.horizontalxsSymmetric() +
          const AppPadding.verticalxsSymmetric(),
      alignment: Alignment.center,

      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          AppColors.backgroundColor[50] ?? Colors.white,
          BlendMode.srcATop,
        ),
        child: child,
      ),
    );
  }

  void generateRow() {
    final p = ref.watch(addMemberProvider);
    final selectedUsers = ref.watch(
      addMemberProvider.select((p) => p.selectedUsers),
    );
    selectedUsers.addListener(() {
      ref.read(addMemberProvider).roleBasedAction(selectedUsers.value);
    });
    _dataGridRows = [
      DataGridRow(
        cells: [
          DataGridCell(
            columnName: AddMemberTableColumnNames.memberNumber.name,
            value: MemberNumberField(
              controller: p.memberNumberController,
            ),
          ),
          DataGridCell(
            columnName: AddMemberTableColumnNames.name.name,
            value: CustomTextField(
              label: LocaleKeys.addMember_name.tr(),
              validator: (value) => ValidatorMethods(text: value).validateName,
              controller: p.nameController,
            ),
          ),
          DataGridCell(
            columnName: AddMemberTableColumnNames.phoneNumber.name,
            value: PhoneField(
              controller: p.phoneNumberController,
              phoneCodeController: p.phoneCodeController,
            ),
          ),
          DataGridCell(
            columnName: AddMemberTableColumnNames.role.name,
            value: const RoleDropDown(),
          ),
          DataGridCell(
            columnName: AddMemberTableColumnNames.mentor.name,
            value: AddMentorButton(
              user: ref.watch(addMemberProvider.select((p) => p.user)),
              selectedUsers: selectedUsers,
            ),
          ),
          DataGridCell(
            columnName: AddMemberTableColumnNames.gender.name,
            value: GenderDropDown(
              controller: p.genderController,
            ),
          ),
          DataGridCell(
            columnName: AddMemberTableColumnNames.membershipStartDate.name,
            value: DateField(
              controller: p.memberShipStartDateController,
            ),
          ),
          DataGridCell(
            columnName: AddMemberTableColumnNames.membershipDuration.name,
            value: MemberShipDurationDropDown(
              controller: p.memberShipDurationController,
            ),
          ),
        ],
      ),
    ];
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataCell) {
        return _cell(
          dataCell.value as Widget,
        );
      }).toList(),
    );
  }
}
