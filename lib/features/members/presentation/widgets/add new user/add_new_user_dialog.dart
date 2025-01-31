import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/core/constants/enums/roles.dart';
import 'package:roof_admin_panel/core/extensions/media_query_extension.dart';
import 'package:roof_admin_panel/core/utils/widgets/custom_drop_down_button.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/add%20new%20user/phone_field.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/add%20new%20user/role_dropdown.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';
import 'package:roof_admin_panel/product/utility/constants/spacing_sizes.dart';
import 'package:roof_admin_panel/product/utility/logger/logger.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class AddNewUserDialog extends ConsumerWidget {
  AddNewUserDialog({super.key});

  final TextEditingController roleController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAlertDialog(
      title: Text(LocaleKeys.membersView_addUserDialog_title.tr()),
      actions: [
        TextButton(
          onPressed: () => CustomAlertDialog.hideAlertDialog(context),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(membersViewModelProvider.notifier).addNewUser(
                  UserModel(
                    name: nameController.text,
                    phoneNumber: phoneNumberController.text,
                    role: [roleController.text.toRole()],
                  ),
                );
          },
          child: Text(
            LocaleKeys.common_save.tr(),
          ),
        ),
      ],
      content: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: context.dynamicHeight(0.3),
          child: Column(
            spacing: SpacingSizes.medium,
            children: [
              CustomTextField(
                label: LocaleKeys.membersView_addUserDialog_name.tr(),
              ),
              PhoneField(
                controller: phoneNumberController,
              ),
              RoleDropdown(
                controller: roleController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
