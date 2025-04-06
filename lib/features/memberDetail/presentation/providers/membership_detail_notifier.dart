import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/memberDetail/data/models/membership_detail_model.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/usecases/edit_membership_details_use_case.dart';

class MembershipDetailNotifier extends StateNotifier<UserModel> {
  MembershipDetailNotifier(
    UserModel user, {
    required EditMembershipDetailsUseCase editMembershipDetailsUseCase,
  })  : _editMembershipDetailsUseCase = editMembershipDetailsUseCase,
        super(user) {
    _setControllers();
    memberNumberController.text = user.memberNumber ?? '';
    membershipStartDateController.text =
        user.membershipStartDate?.toString() ?? '';
    membershipEndDateController.text = user.membershipEndDate?.toString() ?? '';
    roleController.text = user.role?.first?.name ?? '';
    mentorIdController.text = user.mentorId ?? '';
  }

  final EditMembershipDetailsUseCase _editMembershipDetailsUseCase;

  late final GlobalKey<FormState> formKey;

  late final TextEditingController memberNumberController;
  late final TextEditingController membershipStartDateController;
  late final TextEditingController membershipEndDateController;
  late final TextEditingController roleController;
  late final TextEditingController mentorIdController;

  void _setControllers() {
    Log.info('MembershipDetailNotifier initialized');
    formKey = GlobalKey<FormState>();
    memberNumberController = TextEditingController();
    membershipStartDateController = TextEditingController();
    membershipEndDateController = TextEditingController();
    roleController = TextEditingController();
    mentorIdController = TextEditingController();
  }

  void a() {
    Log.info("""
      memberNumberController : ${memberNumberController.text}
      membershipStartDateController : ${membershipStartDateController.text}
      membershipEndDateController : ${membershipEndDateController.text}
      roleController : ${roleController.text}
      mentorIdController : ${mentorIdController.text}
  
    
""");
  }

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
    // memberNumberController.dispose();
    membershipStartDateController.dispose();
    membershipEndDateController.dispose();
    roleController.dispose();
    mentorIdController.dispose();

    super.dispose();
  }
}
