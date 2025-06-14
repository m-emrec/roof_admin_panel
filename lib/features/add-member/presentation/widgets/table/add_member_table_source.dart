import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/fields/fee_field.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/fields/member_number_field.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/fields/member_ship_duration_drop_down.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/fields/role_drop_down.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/fields/studen_status_dropdown.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/table_column_names.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/add_mentor_button.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/date_selection_field.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/gender_drop_down.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/phone_field.dart';
import 'package:roof_admin_panel/product/widgets/validation_wrapper.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AddMemberTableSource extends DataGridSource {
  AddMemberTableSource(
    this.ref,
  ) {
    _generateRow();
  }

  final Ref ref;
  List<DataGridRow> _dataGridRows = [];
  @override
  List<DataGridRow> get rows => _dataGridRows;

  void _generateRow() {
    final provider = ref.watch(addMemberProvider);
    final selectedUsers = ref.watch(
      addMemberProvider.select((p) => p.mentorshipSelectedMembers),
    );
    selectedUsers.addListener(() {
      ref.read(addMemberProvider).roleBasedAction(selectedUsers.value);
    });
    _dataGridRows = [
      DataGridRow(
        cells: [
          /// Member Number
          DataGridCell(
            columnName: AddMemberTableColumnNames.memberNumber.name,
            value: MemberNumberField(
              controller: provider.memberNumberController,
            ),
          ),

          /// Name
          DataGridCell(
            columnName: AddMemberTableColumnNames.name.name,
            value: CustomTextField(
              focusNode: FocusNode(),
              unfocusOnTapOutside: true,
              textCapitalization: TextCapitalization.words,
              autovalidateMode: AutovalidateMode.disabled,
              label: LocaleKeys.addMember_name.tr(),
              validator: (value) => ValidatorMethods(text: value).validateName,
              controller: provider.nameController,
              textInputAction: TextInputAction.next,
            ),
          ),

          /// Phone Number
          DataGridCell(
            columnName: AddMemberTableColumnNames.phoneNumber.name,
            value: PhoneField(
              autovalidateMode: AutovalidateMode.disabled,
              controller: provider.phoneNumberController,
              phoneCodeController: provider.phoneCodeController,
            ),
          ),

          /// Role
          DataGridCell(
            columnName: AddMemberTableColumnNames.role.name,
            value: const RoleDropDown(),
          ),

          /// Mentor
          DataGridCell(
            columnName: AddMemberTableColumnNames.mentor.name,
            value: AddMentorButton(
              user: ref.watch(addMemberProvider.select((p) => p.user)),
              selectedUsers: selectedUsers,
            ),
          ),

          /// Gender
          DataGridCell(
            columnName: AddMemberTableColumnNames.gender.name,
            value: GenderDropDown(
              controller: provider.genderController,
            ),
          ),

          /// Membership Start Date
          DataGridCell(
            columnName: AddMemberTableColumnNames.membershipStartDate.name,
            value: ValidationWrapper(
              validator: (_) => ValidatorMethods(
                text: provider.memberShipStartDateController.text,
              ).emptyField,
              child: DateField(
                label: LocaleKeys.addMember_memberShipStartDate.tr(),
                controller: provider.memberShipStartDateController,
              ),
            ),
          ),

          /// Fee
          DataGridCell(
            columnName: AddMemberTableColumnNames.fee.name,
            value: const FeeField(),
          ),

          ///  IS Student
          DataGridCell(
            columnName: AddMemberTableColumnNames.isStudent.name,
            value: const StudentStatusDropdown(),
          ),

          /// Membership Duration
          DataGridCell(
            columnName: AddMemberTableColumnNames.membershipDuration.name,
            value: MemberShipDurationDropDown(
              controller: provider.memberShipDurationController,
            ),
          ),
        ],
      ),
    ];
  }

  Widget _cell(Widget child) {
    return Container(
      // height: 50,
      padding: const AppPadding.horizontalxsSymmetric() +
          const AppPadding.verticalxsSymmetric(),
      alignment: Alignment.center,

      child: child,
    );
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
