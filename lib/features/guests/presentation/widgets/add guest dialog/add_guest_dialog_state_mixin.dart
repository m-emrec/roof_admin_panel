part of 'add_guest_dialog.dart';

/// A mixin that contains the methods and properties needed for the
/// [AddGuestDialog] state.
mixin AddGuestDialogStateMixin on ConsumerState<AddGuestDialog> {
  // late final TextEditingController nameController;
  // late final TextEditingController phoneController;
  // late final TextEditingController startDateController;
  // late final TextEditingController phoneCodeController;
  // late final TextEditingController genderController;
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    _AddGuestProperties.init(context);
    super.didChangeDependencies();
  }

  /// A method to handle the onPressed event of the add button.
  void onPressedAdd() {
    if (_AddGuestProperties.formKey.currentState?.validate() ?? false) {
      _addGuest();
    }
  }

  void _addGuest() {
    ref
        .read(guestsViewModelProvider.notifier)
        .addGuest(
          Guest(
            name: _AddGuestProperties.nameController.text,
            phoneNumber: _AddGuestProperties.phoneCodeController.text +
                _AddGuestProperties.phoneController.text,
            guestStartDate:
                DateTime.parse(_AddGuestProperties.startDateController.text),
            gender: _AddGuestProperties.genderController.text
                .fromLocalizedStringToGenderEnum(),
          ),
        )
        .then(
          (_) => CustomRightSideDialog.hide(context),
        );
  }

  @override
  void dispose() {
    _AddGuestProperties.dispose();
    super.dispose();
  }
}
