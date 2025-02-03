import 'package:core/utils/constants/constant_values.dart';
import 'package:core/utils/constants/enums/gender.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/add%20new%20user/add_meber_to_mentor_drop_down.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/add%20new%20user/gender_drop_down.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/add%20new%20user/phone_field.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/add%20new%20user/role_dropdown.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

class AddNewUserDialog extends ConsumerStatefulWidget {
  const AddNewUserDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddNewUserDialogState();
}

class _AddNewUserDialogState extends ConsumerState<AddNewUserDialog> {
  late final TextEditingController nameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController genderController;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController phoneCodeController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    genderController = TextEditingController(text: Gender.female.localizedText);
    phoneCodeController = TextEditingController(
      text: ConstantValues.phoneCodes[context.locale.countryCode].toString(),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: Text(LocaleKeys.addMember_pageTitle.tr()),
      actions: [
        TextButton(
          onPressed: () => CustomAlertDialog.hideAlertDialog(context),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {}
          },
          child: Text(
            LocaleKeys.common_save.tr(),
          ),
        ),
      ],
      content: Material(
        color: Colors.transparent,
        child: SizedBox(
          child: Form(
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
                RoleDropdown(),
                AddMemberToMentorDropDown(),
                GenderDropDown(
                  controller: genderController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
