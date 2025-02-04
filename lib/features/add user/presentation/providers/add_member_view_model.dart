import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/add_new_member_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_members_without_mentor_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_mentats_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_mentors_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_mentors_without_mentat_use_case.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

///
class AddMemberViewModel extends ChangeNotifier {
  ///
  AddMemberViewModel({
    required AddNewMemberUseCase addNewUserUseCase,
    required FetchMembersWithoutMentorUseCase fetchMembersWithoutMentorUseCase,
    required FetchMentorsWithoutMentatUseCase fetchMentorsWithoutMentatUseCase,
    required FetchMentatsUseCase fetchMentatsUseCase,
    required FetchMentorsUseCase fetchMentorsUseCase,
  })  : _addNewUserUseCase = addNewUserUseCase,
        _fetchMembersWithoutMentorUseCase = fetchMembersWithoutMentorUseCase,
        _fetchMentorsWithoutMentatUseCase = fetchMentorsWithoutMentatUseCase,
        _fetchMentatsUseCase = fetchMentatsUseCase,
        _fetchMentorsUseCase = fetchMentorsUseCase;

  final FetchMembersWithoutMentorUseCase _fetchMembersWithoutMentorUseCase;
  final FetchMentorsWithoutMentatUseCase _fetchMentorsWithoutMentatUseCase;
  final FetchMentatsUseCase _fetchMentatsUseCase;
  final FetchMentorsUseCase _fetchMentorsUseCase;
  final AddNewMemberUseCase _addNewUserUseCase;

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
  /// based on the roleBasedActionName
  ///
  /// if `roleBasedActionName `is setMentorId then mentorId will be set and the
  /// rest of the values will be null
  ///
  /// if `roleBasedActionName` is setMentatId then mentatId will be set and the
  /// rest of the values will be null
  ///
  /// ...
  void roleBasedAction(List<String> value) {
    switch (roleBasedActionName) {
      case RoleBasedActionNames.setMentorId:
        user = UserModel(
          mentorId: value.first,
        );

      case RoleBasedActionNames.setMentatId:
        user = UserModel(
          mentatId: value.first,
        );

      case RoleBasedActionNames.setMembers:
        user = UserModel(
          members: value,
        );

      case RoleBasedActionNames.setMentors:
        user = UserModel(
          mentors: value,
        );
    }
    notifyListeners();
  }

  /// Sets the roleBasedActionName
  void setRoleBaseActionName(RoleBasedActionNames val) {
    roleBasedActionName = val;
    notifyListeners();
  }

  /// Fetches the members without mentor
  Future<List<UserModel>> fetchMembersWithoutMentor() async {
    setRoleBaseActionName(RoleBasedActionNames.setMembers);

    final dataState = await _fetchMembersWithoutMentorUseCase(const NoParams());
    await Toast.toastDataStateMessageWrapper(dataState: dataState);
    return dataState.resultData ?? [];
  }

  /// Fetches the  mentors
  Future<List<UserModel>> fetchMentors() async {
    setRoleBaseActionName(RoleBasedActionNames.setMentorId);
    final dataState = await _fetchMentorsUseCase(const NoParams());
    await Toast.toastDataStateMessageWrapper(dataState: dataState);
    return dataState.resultData ?? [];
  }

  /// Fetches the mentats
  Future<List<UserModel>> fetchMentats() async {
    setRoleBaseActionName(RoleBasedActionNames.setMentatId);

    final dataState = await _fetchMentatsUseCase(const NoParams());
    await Toast.toastDataStateMessageWrapper(dataState: dataState);
    return dataState.resultData ?? [];
  }

  /// Fetches the mentors without mentat
  Future<List<UserModel>> fetchMentorsWithoutMentat() async {
    setRoleBaseActionName(RoleBasedActionNames.setMentors);

    final dataState = await _fetchMentorsWithoutMentatUseCase(const NoParams());
    await Toast.toastDataStateMessageWrapper(dataState: dataState);
    return dataState.resultData ?? [];
  }

  /// Adds a new user
  Future<void> addNewUser(UserModel userModel) async {
    final dataState = await _addNewUserUseCase(userModel);

    if (dataState is DataSuccess) {
      user = dataState.resultData ?? UserModel();
    } else if (dataState is DataFailed) {
      Toast.showErrorToast(desc: dataState.errorMessage);
    }
  }
}

///
/// This enum holds the action names that are used to set the roleBasedAction
///
/// setMentorId: This is used to set the mentorId
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
