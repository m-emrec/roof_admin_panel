import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/memberDetail/data/models/membership_detail_model.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/usecases/edit_membership_details_use_case.dart';

///
/// MembershipDetailNotifier
/// This class is responsible for managing the state of the membership details.
/// It extends the StateNotifier class from Riverpod and takes a UserModel as its state.
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
class MembershipDetailNotifier extends StateNotifier<UserModel> {
  MembershipDetailNotifier(
    UserModel user, {
    required EditMembershipDetailsUseCase editMembershipDetailsUseCase,
  })  : _editMembershipDetailsUseCase = editMembershipDetailsUseCase,
        super(user) {
    _initializeControllers();
  }

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
  late final TextEditingController roleController;

  ///
  late final TextEditingController mentorIdController;

  void _initializeControllers() {
    formKey = GlobalKey<FormState>();
    memberNumberController = TextEditingController(
      text: state.memberNumber ?? '',
    );
    membershipStartDateController = TextEditingController(
      text: state.membershipStartDate?.toString() ?? '',
    );
    membershipEndDateController = TextEditingController(
      text: state.membershipEndDate?.toString() ?? '',
    );
    roleController = TextEditingController(
      text: state.role?.first?.name ?? '',
    );
    mentorIdController = TextEditingController(
      text: state.mentorId ?? '',
    );
  }

  ///
  Future<void> editMembershipDetails({
    required EditedMembershipDetail details,
  }) async {
    state = state.copyWith(
      membershipStartDate: details.membershipStartDate,
      membershipEndDate: details.membershipEndDate,
      memberNumber: details.memberNumber,
      role: [details.role],
    );
  }

  @override
  void dispose() {
    Log.info('MembershipDetailNotifier disposed');
    // formKey.currentContext.dis
    memberNumberController.dispose();
    membershipStartDateController.dispose();
    membershipEndDateController.dispose();
    roleController.dispose();
    mentorIdController.dispose();

    super.dispose();
  }
}
