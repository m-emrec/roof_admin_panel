import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/memberDetail/data/models/membership_detail_model.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/usecases/edit_membership_details_use_case.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/views/member_detail.dart';
import 'package:roof_admin_panel/product/utility/handlers/role_action_handler.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

///
/// MembershipDetailNotifier
/// This class is responsible for managing the state of the membership details.
/// It extends the StateNotifier class from Riverpod and takes a MemberModel as its state.
/// It also takes an EditMembershipDetailsUseCase as a dependency to edit the membership details.
///
/// It initializes the form key and text editing controllers for the membership details.
///
/// It contains the [TextEditingController]s for the following fields:
/// - memberNumber
/// - membershipStartDate
/// - membershipEndDate
/// - role
/// - mentorId
///
class MembershipDetailNotifier extends StateNotifier<MemberModel?> {
  /// Constructor for the [MembershipDetailNotifier].
  MembershipDetailNotifier(
    this.ref, {
    required EditMembershipDetailsUseCase editMembershipDetailsUseCase,
  })  : _editMembershipDetailsUseCase = editMembershipDetailsUseCase,
        super(null);

  /// Initializes the state with the given [member] and sets up the form key and text editing controllers.
  /// This method called iin the [MemberDetailDialog] when the dialog is opened.
  void initializeState(MemberModel? member) {
    state = member;
    _initializeControllers();
  }

  /// The [ref] is used to access the provider and its dependencies.
  final Ref ref;
  final EditMembershipDetailsUseCase _editMembershipDetailsUseCase;

  ///
  /// The form key is used to validate the form and access its state.
  late final GlobalKey<FormState> formKey;

  /// The text editing controllers are used to manage the text input for the membership details.
  /// They are initialized with the current values of the membership details.
  /// The controllers are disposed of when the notifier is disposed.
  late final TextEditingController memberNumberController;

  ///
  late final TextEditingController membershipStartDateController;

  ///
  late final TextEditingController membershipEndDateController;

  ///
  late final ValueNotifier<Role> roleController;

  late final ValueNotifier<MemberModel> mentorList;

  ///
  late final TextEditingController mentorIdController;

  /// Initializes all form and text controllers with the existing user state.
  /// This ensures that the form fields reflect current data and are ready for editing.
  /// Disposing controllers is handled in the `dispose` method.
  void _initializeControllers() {
    formKey = GlobalKey<FormState>();
    memberNumberController = TextEditingController(
      text: state?.memberNumber ?? '',
    );
    mentorList = ValueNotifier(state ?? MemberModel());
    membershipStartDateController = TextEditingController(
      text: state?.membershipStartDate?.toString() ?? '',
    );
    membershipEndDateController = TextEditingController(
      text: state?.membershipEndDate?.toString() ?? '',
    );
    roleController = ValueNotifier(state?.role?.first ?? Role.member);
    mentorIdController = TextEditingController(
      text: state?.mentorId ?? '',
    );
  }

  /// This method is called to edit the membership details.
  /// It creates an instance of [EditedMembershipDetail] using the current values
  /// from the text editing controllers and the selected role.
  /// It then updates the state with the new values and calls the use case to edit
  /// the membership details.
  /// If the operation is successful, it shows a success toast message.
  /// If it fails, it shows an error toast message.
  /// Finally, it resets the form fields to their initial values.
  /// This method is called when the user submits the form.
  Future<void> editMembershipDetails() async {
    if (_validateFields() == false) return;
    _setMentors();
    final model = _createEditedMembershipDetailModel();

    state = state?.copyWith(
      membershipStartDate: model.membershipStartDate,
      membershipEndDate: model.membershipEndDate,
      memberNumber: model.memberNumber,
      role: [model.role],
    );
    Log.error(model.toJson());
    DataState.handleDataStateBasedAction(
      await _editMembershipDetailsUseCase(model),
      onSuccess: (_) => Toast.showSuccessToast(
        desc: LocaleKeys.memberDetailView_success_memberUpdated.tr(),
      ),
      onFailure: (error) {
        Toast.showErrorToast(
          desc: AppErrorText.errorMessageConverter(error?.errorMessage ?? ''),
        );
      },
    );
    reset();
  }

  void _setMentors() {
    RoleActionHandler(
      roles: state?.role ?? [],
      memberAction: () => state = state?.copyWith(
        mentorId: mentorList.value.mentorId,
        mentatId: "",
        members: [],
        mentors: [],
        role: state?.role,
      ),
      mentatAction: () => state = state?.copyWith(
        mentors: mentorList.value.mentors,
        mentatId: "",
        members: [],
        mentorId: "",
        role: state?.role,
      ),
      mentorAction: () => state = state?.copyWith(
        members: mentorList.value.members,
        mentatId: mentorList.value.mentatId,
        mentorId: "",
        mentors: [],
        role: state?.role,
      ),
    ).handle();
    Log.warning(state?.toJson());
  }

  /// resets the form fields to their initial values.
  /// It also sets the edit state to false.
  /// This is useful when the user wants to cancel the editing process and
  /// revert to the original values.
  void reset() {
    ref.read(isEditingProvider.notifier).state = false;
    memberNumberController.text = state?.memberNumber ?? '';
    membershipStartDateController.text =
        state?.membershipStartDate?.toString() ?? '';
    membershipEndDateController.text =
        state?.membershipEndDate?.toString() ?? '';
    roleController.value = state?.role?.first ?? Role.member;
    mentorIdController.text = state?.mentorId ?? '';
  }

  EditedMembershipDetail _createEditedMembershipDetailModel() =>
      EditedMembershipDetail(
        uid: state?.uid ?? '',
        memberNumber: memberNumberController.text,
        membershipStartDate: DateTime.parse(membershipStartDateController.text),
        membershipEndDate: DateTime.parse(membershipEndDateController.text),
        role: roleController.value,
        mentorId: state?.mentorId,
        mentatId: state?.mentatId,
        members: state?.members,
        mentors: state?.mentors,
      );

  String? _validateDates() {
    final startDate = DateTime.parse(membershipStartDateController.text);
    final endDate = DateTime.parse(membershipEndDateController.text);
    if (ValidatorMethods(text: membershipStartDateController.text).emptyField !=
        null) {
      return LocaleKeys.common_validationError_required.tr();
    }
    if (startDate.isAfter(endDate)) {
      return LocaleKeys
          .memberDetailView_validationErrors_startDateLaterThanEndDate
          .tr();
    }
    return null;
  }

  bool _validateFields() {
    final validators = {
      LocaleKeys.memberDetailView_membershipInfo_memberNumber.tr():
          ValidatorMethods(text: memberNumberController.text)
              .numberOnlyValidator,
      LocaleKeys.memberDetailView_membershipInfo_memberShipStartDate.tr():
          _validateDates(),
      LocaleKeys.memberDetailView_membershipInfo_memberShipEndDate.tr():
          _validateDates(),
    };

    for (final validator in validators.entries) {
      if (validator.value != null) {
        Toast.showErrorToast(title: validator.key, desc: validator.value);
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    // formKey.currentContext.dis
    memberNumberController.dispose();
    membershipStartDateController.dispose();
    membershipEndDateController.dispose();
    roleController.dispose();
    mentorIdController.dispose();

    super.dispose();
  }
}
