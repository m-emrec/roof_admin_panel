part of 'add_guest_dialog.dart';

/// A class that contains the properties needed for the [AddGuestDialog].
///
/// This class is used in the [AddGuestDialogStateMixin] and [_AddGuestForm]
///
/// This class contains the following properties:
/// - [formKey]
/// - [nameController]
/// - [phoneController]
/// - [phoneCodeController]
/// - [genderController]
/// - [startDateController]
///
/// This class contains the following methods:
/// - [init]
/// - [dispose]
///
///* NOTE: The reason I used this class is to share the controllers and form key
///* between the [_AddGuestForm] and [AddGuestDialogStateMixin].
///* This way, I can access the controllers and form key in both the form and the mixin.
///*  and I don't have to pass them as parameters to the form or the mixin.
///
class _AddGuestProperties {
  static late GlobalKey<FormState> formKey;
  static late TextEditingController nameController;
  static late TextEditingController phoneController;
  static late TextEditingController phoneCodeController;
  static late TextEditingController genderController;
  static late TextEditingController startDateController;

  static void init(BuildContext context) {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    startDateController = TextEditingController();
    phoneCodeController = TextEditingController(
      text: ConstantValues.phoneCodes[context.locale.countryCode].toString(),
    );
    genderController = TextEditingController(text: Gender.female.localizedText);
    formKey = GlobalKey<FormState>();
  }

  static void dispose() {
    nameController.dispose();
    phoneController.dispose();
    startDateController.dispose();
    phoneCodeController.dispose();
    genderController.dispose();
  }
}
