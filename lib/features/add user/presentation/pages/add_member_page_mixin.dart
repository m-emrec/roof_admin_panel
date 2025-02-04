import 'package:core/utils/constants/constant_values.dart';
import 'package:core/utils/constants/enums/gender.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/pages/add_member_page.dart';

mixin AddMemberPageMixin on State<AddMemberPage> {
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
}
