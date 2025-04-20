import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/pages/add_member_page_mixin.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/member_number_field.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/member_ship_duration_drop_down.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/role_dropdown_and_role_based_button.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/date_selection_field.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/gender_drop_down.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/phone_field.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

/// AddMemberPage
class AddMemberPage extends StatefulWidget {
  /// AddMemberPage constructor
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> with AddMemberPageMixin {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: SpacingSizes.large,
        children: [
          Row(
            spacing: SpacingSizes.medium,
            children: [
              CloseButton(
                onPressed: () => context.pop(),
              ),
              TitleWidget(
                title: LocaleKeys.addMember_pageTitle.tr(),
              ),
            ],
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: SpacingSizes.large,
              children: [
                /// Name
                CustomTextField(
                  label: LocaleKeys.addMember_name.tr(),
                  validator: (value) =>
                      ValidatorMethods(text: value).validateName,
                  controller: nameController,
                ),

                /// Phone
                PhoneField(
                  controller: phoneNumberController,
                  phoneCodeController: phoneCodeController,
                ),
                const RoleDropDownAndRoleBasedButton(),
                GenderDropDown(
                  controller: genderController,
                ),
                MemberNumberField(
                  controller: memberNumberController,
                ),

                /// Membership Start Date and Duration
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: SpacingSizes.large,
                  children: [
                    DateSelectionField(
                      title: LocaleKeys.addMember_memberShipStartDate.tr(),
                      controller: memberShipStartDateController,
                    ),
                    MemberShipDurationDropDown(
                      controller: memberShipDurationController,
                    ),
                  ],
                ),
                // const EmptyBox.mediumGap(),

                /// Save Button
                Consumer(
                  builder: (context, ref, child) => ElevatedButton(
                    onPressed: () => onTapSaveButton(ref),
                    child: Text(
                      LocaleKeys.common_add.tr(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
