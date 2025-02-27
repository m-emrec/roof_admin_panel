part of 'add_guest_dialog.dart';

class _AddGuestForm extends StatelessWidget {
  const _AddGuestForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _AddGuestFormControllers.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: SpacingSizes.medium,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: _AddGuestFormControllers.nameController,
            validator: (_) => ValidatorMethods(
              text: _AddGuestFormControllers.nameController.text,
            ).validateName,
            textCapitalization: TextCapitalization.words,
            label: LocaleKeys.guestsView_tableColumnLabels_name.tr(),
          ),
          PhoneField(
            controller: _AddGuestFormControllers.phoneController,
            phoneCodeController: _AddGuestFormControllers.phoneCodeController,
          ),
          GenderDropDown(controller: _AddGuestFormControllers.genderController),
          Section(
            title: LocaleKeys.guestsView_tableColumnLabels_guestStartDate.tr(),
            required: true,
            child: ValidationWrapper(
              validator: (p0) =>
                  _AddGuestFormControllers.startDateController.text.isEmpty
                      ? LocaleKeys.common_validationError_required.tr()
                      : null,
              child: DateField(
                // title: LocaleKeys.guestsView_tableColumnLabels_guestStartDate.tr(),
                controller: _AddGuestFormControllers.startDateController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
