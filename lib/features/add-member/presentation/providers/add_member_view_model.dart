import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/domain/usecases/add_new_member_use_case.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/membership-fees/data/models/membership_fees.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

///
class AddMemberViewModel extends ChangeNotifier {
  ///
  AddMemberViewModel({
    required AddNewMemberUseCase addNewUserUseCase,
    required this.ref,
  }) : _addNewUserUseCase = addNewUserUseCase;

  final AddNewMemberUseCase _addNewUserUseCase;
  final Ref ref;

  ///
  late final TextEditingController nameController;

  late final TextEditingController feeController;

  late final TextEditingController isStudent;

  ///
  late final TextEditingController phoneNumberController;

  ///
  late final TextEditingController genderController;

  ///
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///
  late final TextEditingController phoneCodeController;

  ///
  late final TextEditingController memberNumberController;

  ///
  late final TextEditingController memberShipStartDateController;

  ///
  late final TextEditingController memberShipDurationController;

  int studentDiscount = 100;
  int femaleDiscount = 100;
  int fullPrice = 0;

  ///
  ValueNotifier<MemberModel> get mentorshipSelectedMembers => ValueNotifier(
        user,
      );

  /// This method is used to initialize the controllers
  /// and set the initial values for the controllers
  void initControllers(BuildContext context) async {
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    genderController = TextEditingController(text: Gender.female.localizedText);
    genderController.addListener(configureMembershipFee);
    phoneCodeController = TextEditingController(
      text: ConstantValues.phoneCodes[context.locale.countryCode].toString(),
    );
    memberNumberController = TextEditingController();
    memberShipStartDateController = TextEditingController();
    memberShipDurationController = TextEditingController(text: "3");
    memberShipDurationController.addListener(configureMembershipFee);
    isStudent = TextEditingController(text: "false");
    isStudent.addListener(configureMembershipFee);
    feeController = TextEditingController();
    configureMembershipFee();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    nameController.dispose();
    phoneNumberController.dispose();
    genderController.dispose();
    phoneCodeController.dispose();
    memberNumberController.dispose();
    memberShipStartDateController.dispose();
    memberShipDurationController.dispose();
    feeController.dispose();
    isStudent.dispose();
  }

  /// This variable holds the user data
  ///
  /// This will be used to add a new user
  MemberModel user = MemberModel(
    role: [Role.member],
  );

  ///  Sets the role for the user
  void setRole(Role role) {
    user = user.copyWith(role: [role]);

    notifyListeners();
  }

  void _resetControllers(BuildContext context) {
    nameController.clear();
    phoneNumberController.clear();
    genderController.text = Gender.female.localizedText;
    phoneCodeController.text =
        ConstantValues.phoneCodes[context.locale.countryCode].toString();
    memberNumberController.clear();
    memberShipStartDateController.clear();
    memberShipDurationController.text = "3";
  }

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
  void roleBasedAction(MemberModel userModel) {
    if (user.isMentat) {
      user = user.copyWith(
        mentors: userModel.mentors,
        mentatId: "",
        members: [],
        mentorId: "",
        role: user.role,
      );
    } else if (user.isMentor) {
      user = user.copyWith(
        members: userModel.members,
        mentatId: userModel.mentatId,
        mentorId: "",
        mentors: [],
        role: user.role,
      );
    } else {
      user = user.copyWith(
        mentorId: userModel.mentorId,
        mentatId: "",
        members: [],
        mentors: [],
        role: user.role,
      );
    }

    notifyListeners();
  }

  MemberModel _setUser() {
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
      membershipType: int.parse(memberShipDurationController.text),
      isStudent: isStudent.text == "true",
      fee: double.parse(feeController.text),
    );
  }

  void configureMembershipFee() async {
    final fees = ref.read(membershipFeesViewModelProvider).valueOrNull;
    final discounts =
        ref.read(membershipFeesViewModelProvider).valueOrNull?.discounts ?? {};

    final fullPrice = fees?.rates[memberShipDurationController.text] ?? 0;

    final studentDiscount =
        discounts[isStudent.text == "true" ? "student" : ""] ?? 0;
    final femaleDiscount = discounts[
            genderController.text.fromLocalizedStringToGenderEnum()?.name] ??
        0;

    final priceAfterFemale = fullPrice * (1 - femaleDiscount / 100);
    final priceAfterStudent = priceAfterFemale * (1 - studentDiscount / 100);

    feeController.text = priceAfterStudent.toStringAsFixed(2);
  }

  /// Adds a new user
  Future<DataState<MemberModel>> addNewMember(BuildContext context) async {
    user = _setUser();
    Log.info(user.toJson());
    final dataState = await _addNewUserUseCase(user);
    DataState.handleDataStateBasedAction(
      dataState,
      onSuccess: (_) {
        Toast.showSuccessToast(
          desc: LocaleKeys.addMember_success.tr(),
        );
        _resetControllers(context);
      },
      onFailure: (fail) {
        Toast.showErrorToast(
          desc: AppErrorText.errorMessageConverter(fail?.errorMessage ?? ""),
        );
      },
    );
    // final dataState = await _addNewUserUseCase(user);
    return dataState;
    // return dataState;
  }
}
