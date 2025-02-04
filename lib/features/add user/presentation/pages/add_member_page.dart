import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/pages/add_member_page_mixin.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/gender_drop_down.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/phone_field.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/role_dropdown_and_role_based_button.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          title: LocaleKeys.addMember_pageTitle.tr(),
        ),
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: SpacingSizes.medium,
            children: [
              CustomTextField(
                label: LocaleKeys.addMember_name.tr(),
                validator: (value) =>
                    ValidatorMethods(text: value).validateName,
                controller: nameController,
              ),
              PhoneField(
                controller: phoneNumberController,
                phoneCodeController: phoneCodeController,
              ),
              const RoleDropDownAndRoleBasedButton(),
              GenderDropDown(
                controller: genderController,
              ),
              Consumer(
                builder: (context, ref, child) => ElevatedButton(
                  onPressed: () {
                    Log.debug(ref.read(addMemberProvider).user);
                  },
                  child: Text(
                    LocaleKeys.common_add.tr(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
