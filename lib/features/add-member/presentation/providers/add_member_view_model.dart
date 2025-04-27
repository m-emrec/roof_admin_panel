import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/add-member/domain/usecases/add_new_member_use_case.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';

///
class AddMemberViewModel extends ChangeNotifier {
  ///
  AddMemberViewModel({
    required AddNewMemberUseCase addNewUserUseCase,
  }) : _addNewUserUseCase = addNewUserUseCase;

  final AddNewMemberUseCase _addNewUserUseCase;

  late final TextEditingController nameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController genderController;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController phoneCodeController;
  late final TextEditingController memberNumberController;
  late final TextEditingController memberShipStartDateController;
  late final TextEditingController memberShipDurationController;
  ValueNotifier<UserModel> get selectedUsers => ValueNotifier(
        user,
      );

  void init(BuildContext context) {
    Log.debug("AddMemberViewModel initialized");
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    genderController = TextEditingController(text: Gender.female.localizedText);
    phoneCodeController = TextEditingController(
      text: ConstantValues.phoneCodes[context.locale.countryCode].toString(),
    );
    memberNumberController = TextEditingController();
    memberShipStartDateController = TextEditingController();
    memberShipDurationController = TextEditingController(text: "3");
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
    Log.debug("AddMemberViewModel disposed");
    super.dispose();
  }

  /// This variable holds the user data
  ///
  /// This will be used to add a new user
  UserModel user = UserModel(
    role: [Role.member],
  );

  ///  Sets the role for the user
  void setRole(Role role) {
    user = user.copyWith(role: [role]);

    notifyListeners();
  }

  /// This variable holds the roleBasedActionName
  ///
  /// This is used to set roleBasedAction
  RoleBasedActionNames roleBasedActionName = RoleBasedActionNames.setMentorId;

  /// Purpose of this method is to set
  /// mentorId, mentatId, members, mentors
  /// based on the [roleBasedActionName]
  ///
  /// if [roleBasedActionName] is [setMentorId] then [mentorId] will be set and the
  /// rest of the values will be null
  ///
  /// if [roleBasedActionName] is [setMentatId] then mentatId will be set and the
  /// rest of the values will be null
  ///
  /// ...
  void roleBasedAction(UserModel userModel) {
    Log.debug("RoleBasedAction: ${userModel}");

    if (user.role?.contains(Role.member) == true ||
        user.role?.contains(Role.admin) == true) {
      user = user.copyWith(
        mentorId: userModel.mentorId,
        mentatId: "",
        members: [],
        mentors: [],
        role: user.role,
      );
    } else if (user.role?.contains(Role.mentat) == true) {
      user = user.copyWith(
        mentors: userModel.mentors,
        mentatId: "",
        members: [],
        mentorId: "",
        role: user.role,
      );
    } else if (user.role?.contains(Role.mentor) == true) {
      user = user.copyWith(
        members: userModel.members,
        mentatId: userModel.mentatId,
        mentorId: "",
        mentors: [],
        role: user.role,
      );
    }

    notifyListeners();
  }

  UserModel _setUser() {
    return user.copyWith(
      name: nameController.text,
      phoneNumber: phoneCodeController.text + phoneNumberController.text,
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
    );
  }

  /// Adds a new user
  Future<DataState<UserModel>> addNewMember() async {
    // user = _setUser();
    // Log.info(user.toJson());
    if (formKey.currentState?.validate() ?? false) {
      user = _setUser();
      Log.info(user.toJson());
      final dataState = await _addNewUserUseCase(user);
    }
    // final dataState = await _addNewUserUseCase(user);
    return DataSuccess(user);
    // return dataState;
  }
}

///
/// This enum holds the action names that are used to set the roleBasedAction
///
/// setMentorId: This is used to set the mentorId
/// **So, when this is selected the mentorId will be set**
///
/// **and the rest of the values will be null**
///
/// The rest are the same
///
/// setMentatId: This is used to set the mentatId
///
/// setMembers: This is used to set the members
///
/// setMentors: This is used to set the mentors
enum RoleBasedActionNames {
  setMentorId,
  setMentatId,
  setMembers,
  setMentors,
}
