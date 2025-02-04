import 'package:core/utils/constants/constant_values.dart';
import 'package:core/utils/constants/enums/gender.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/pages/add_member_page.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';

/// This mixin is used to add the required controllers and form key to the AddMemberPage
mixin AddMemberPageMixin on State<AddMemberPage> {
  late final TextEditingController nameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController genderController;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController phoneCodeController;
  late final TextEditingController memberNumberController;
  late final TextEditingController memberShipStartDateController;
  late final TextEditingController memberShipDurationController;
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
    memberNumberController = TextEditingController();
    memberShipStartDateController = TextEditingController();
    memberShipDurationController = TextEditingController(text: "3");
    super.didChangeDependencies();
  }

  Future<void> onTapSaveButton(WidgetRef ref) async {
    if (formKey.currentState?.validate() ?? false) {
      await ref
          .read(addMemberProvider)
          .addNewUser(
            UserModel(
              name: nameController.text,
              phoneNumber:
                  phoneCodeController.text + phoneNumberController.text,
              gender: genderController.text.fromLocalizedStringToGenderEnum(),
              memberNumber: memberNumberController.text,
              membershipStartDate: DateTime.parse(
                memberShipStartDateController.text,
              ),
              membershipEndDate: DateTime.parse(
                memberShipStartDateController.text,
              ).addMonth(
                int.parse(memberShipDurationController.text),
              ),
            ),
          )
          .showLoading(context: context);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    genderController.dispose();
    phoneCodeController.dispose();
    memberNumberController.dispose();
    memberShipStartDateController.dispose();
    memberShipDurationController.dispose();

    super.dispose();
  }
}
