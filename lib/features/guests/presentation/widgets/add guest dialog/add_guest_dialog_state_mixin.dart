part of 'add_guest_dialog.dart';

/// A mixin that contains the methods and properties needed for the
/// [AddGuestDialog] state.
mixin AddGuestDialogStateMixin on ConsumerState<AddGuestDialog> {
  @override
  void didChangeDependencies() {
    _AddGuestFormControllers.init(context);
    super.didChangeDependencies();
  }

  /// A method to handle the onPressed event of the add button.
  void onPressedAdd() {
    if (_AddGuestFormControllers.formKey.currentState?.validate() ?? false) {
      _addGuest();
    }
  }

  void _addGuest() {
    ref
        .read(guestsViewModelProvider.notifier)
        .addGuest(
          Guest(
            name: _AddGuestFormControllers.nameController.text.trim(),
            phoneNumber: _AddGuestFormControllers.phoneCodeController.text +
                _AddGuestFormControllers.phoneController.text.trim(),
            guestStartDate: DateTime.parse(
              _AddGuestFormControllers.startDateController.text,
            ),
            gender: _AddGuestFormControllers.genderController.text
                .fromLocalizedStringToGenderEnum(),
          ),
        )
        .then(
          (_) => CustomRightSideDialog.hide(context),
        );
  }

  @override
  void dispose() {
    _AddGuestFormControllers.dispose();
    super.dispose();
  }
}
