import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/pages/add_member_page_mixin.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/table_column_names.dart';
import 'package:roof_admin_panel/product/widgets/table/custom_table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// AddMemberPage
class AddMemberTable extends ConsumerStatefulWidget {
  /// AddMemberPage constructor
  const AddMemberTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddMemberTableState();
}

class _AddMemberTableState extends ConsumerState<AddMemberTable>
    with AddMemberPageMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Form(
        key: ref.read(addMemberProvider).formKey,
        child: CustomTable(
          rowsPerPage: 1,
          showCheckboxColumn: false,
          source: ref.watch(addMemberTableProvider),
          columns: [
            GridColumn(
              columnWidthMode: ColumnWidthMode.auto,
              columnName: AddMemberTableColumnNames.memberNumber.name,
              label: Center(
                child: Text(AddMemberTableColumnNames.memberNumber.name),
              ),
            ),
            GridColumn(
              columnWidthMode: ColumnWidthMode.auto,
              columnName: AddMemberTableColumnNames.name.name,
              label: Center(child: Text(AddMemberTableColumnNames.name.name)),
            ),
            GridColumn(
              columnWidthMode: ColumnWidthMode.auto,
              width: 300,
              columnName: AddMemberTableColumnNames.phoneNumber.name,
              label: Center(
                child: Text(AddMemberTableColumnNames.phoneNumber.name),
              ),
            ),
            GridColumn(
              columnWidthMode: ColumnWidthMode.auto,
              columnName: AddMemberTableColumnNames.role.name,
              label: Center(child: Text(AddMemberTableColumnNames.role.name)),
            ),
            GridColumn(
              columnWidthMode: ColumnWidthMode.auto,
              columnName: AddMemberTableColumnNames.mentor.name,
              label: Center(child: Text(AddMemberTableColumnNames.mentor.name)),
            ),
            GridColumn(
              columnWidthMode: ColumnWidthMode.auto,
              columnName: AddMemberTableColumnNames.gender.name,
              label: Center(child: Text(AddMemberTableColumnNames.gender.name)),
            ),
            GridColumn(
              columnWidthMode: ColumnWidthMode.auto,
              columnName: AddMemberTableColumnNames.membershipStartDate.name,
              label: Center(
                child: Text(AddMemberTableColumnNames.membershipStartDate.name),
              ),
            ),
            GridColumn(
              columnWidthMode: ColumnWidthMode.auto,
              columnName: AddMemberTableColumnNames.membershipDuration.name,
              label: Center(
                child: Text(AddMemberTableColumnNames.membershipDuration.name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         spacing: SpacingSizes.large,
//         children: [
//           Row(
//             spacing: SpacingSizes.medium,
//             children: [
//               CloseButton(
//                 onPressed: () => context.pop(),
//               ),
//               TitleWidget(
//                 title: LocaleKeys.addMember_pageTitle.tr(),
//               ),
//             ],
//           ),
//           Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               spacing: SpacingSizes.large,
//               children: [
//                 /// Name
//                 CustomTextField(
//                   label: LocaleKeys.addMember_name.tr(),
//                   validator: (value) =>
//                       ValidatorMethods(text: value).validateName,
//                   controller: nameController,
//                 ),

//                 /// Phone
//                 PhoneField(
//                   controller: phoneNumberController,
//                   phoneCodeController: phoneCodeController,
//                 ),
//                 const RoleDropdownAndAddMentorButton(),
//                 GenderDropDown(
//                   controller: genderController,
//                 ),
//                 MemberNumberField(
//                   controller: memberNumberController,
//                 ),

//                 /// Membership Start Date and Duration
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: SpacingSizes.large,
//                   children: [
//                     DateSelectionField(
//                       title: LocaleKeys.addMember_memberShipStartDate.tr(),
//                       controller: memberShipStartDateController,
//                     ),
//                     MemberShipDurationDropDown(
//                       controller: memberShipDurationController,
//                     ),
//                   ],
//                 ),
//                 // const EmptyBox.mediumGap(),

//                 /// Save Button
//                 Consumer(
//                   builder: (context, ref, child) => ElevatedButton(
//                     onPressed: () => onTapSaveButton(ref),
//                     child: Text(
//                       LocaleKeys.common_add.tr(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),