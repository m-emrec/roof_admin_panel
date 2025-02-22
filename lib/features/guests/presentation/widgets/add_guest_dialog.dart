import 'package:core/utils/constants/enums/gender.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/date_selection_field.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/gender_drop_down.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/phone_field.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';
import 'package:roof_admin_panel/product/widgets/validation_wrapper.dart';

class AddGuestDialog extends ConsumerStatefulWidget {
  const AddGuestDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddGuestDialogState();
}

class _AddGuestDialogState extends ConsumerState<AddGuestDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController phoneCodeController = TextEditingController();
  final TextEditingController genderController =
      TextEditingController(text: Gender.female.localizedText);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      actions: [
        TextButton(
          child: Text(LocaleKeys.common_cancel.tr()),
          onPressed: () => CustomAlertDialog.hideAlertDialog(context),
        ),
        TextButton(
          child: Text(LocaleKeys.common_add.tr()),
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              ref
                  .read(guestsViewModelProvider.notifier)
                  .addGuest(
                    Guest(
                      name: nameController.text,
                      phoneNumber:
                          phoneCodeController.text + phoneController.text,
                      guestStartDate: DateTime.parse(startDateController.text),
                      gender: genderController.text
                          .fromLocalizedStringToGenderEnum(),
                    ),
                  )
                  .then(
                    (_) => CustomAlertDialog.hideAlertDialog(context),
                  );
            }
          },
        ),
      ],
      title: Text(LocaleKeys.guestsView_addGuest.tr()),
      content: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SpacingSizes.medium,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: nameController,
              validator: (_) => ValidatorMethods(
                text: nameController.text,
              ).validateName,
              label: LocaleKeys.guestsView_tableColumnLabels_name.tr(),
            ),
            PhoneField(
              controller: phoneController,
              phoneCodeController: phoneCodeController,
            ),
            GenderDropDown(controller: genderController),
            Section(
              title:
                  LocaleKeys.guestsView_tableColumnLabels_guestStartDate.tr(),
              required: true,
              child: ValidationWrapper(
                validator: (p0) => startDateController.text.isEmpty
                    ? LocaleKeys.common_validationError_required.tr()
                    : null,
                child: DateField(
                  // title: LocaleKeys.guestsView_tableColumnLabels_guestStartDate.tr(),
                  controller: startDateController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
