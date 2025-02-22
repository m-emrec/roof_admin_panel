part of 'add_guest_dialog.dart';

class _AddGuestForm extends StatelessWidget {
  const _AddGuestForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _AddGuestProperties.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: SpacingSizes.medium,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: _AddGuestProperties.nameController,
            validator: (_) => ValidatorMethods(
              text: _AddGuestProperties.nameController.text,
            ).validateName,
            label: LocaleKeys.guestsView_tableColumnLabels_name.tr(),
          ),
          PhoneField(
            controller: _AddGuestProperties.phoneController,
            phoneCodeController: _AddGuestProperties.phoneCodeController,
          ),
          GenderDropDown(controller: _AddGuestProperties.genderController),
          Section(
            title: LocaleKeys.guestsView_tableColumnLabels_guestStartDate.tr(),
            required: true,
            child: ValidationWrapper(
              validator: (p0) =>
                  _AddGuestProperties.startDateController.text.isEmpty
                      ? LocaleKeys.common_validationError_required.tr()
                      : null,
              child: DateField(
                // title: LocaleKeys.guestsView_tableColumnLabels_guestStartDate.tr(),
                controller: _AddGuestProperties.startDateController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
