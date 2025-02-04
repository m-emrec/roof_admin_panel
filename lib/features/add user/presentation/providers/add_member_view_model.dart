import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';

import 'package:roof_admin_panel/features/add%20user/domain/usecases/add_new_member_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_members_without_mentor_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_mentats_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_mentors_without_mentat_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fethc_mentors_use_case.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

class AddMemberViewModel extends ChangeNotifier {
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

  /// The user that will be added
  ///
  /// All of the user's data will be stored here
  UserModel user = UserModel();

  ///  Sets the role for the user
  void setRole(Role role) {
    user = user.copyWith(role: [role]);
    notifyListeners();
  }

  A selectedParameter = A.setMentorId;

  void addSelectedUsers(List<String> value) {
    switch (selectedParameter) {
      case A.setMentorId:
        user = UserModel(
          mentorId: value.first,
        );

      case A.setMentatId:
        user = UserModel(
          mentatId: value.first,
        );

      case A.setMembers:
        user = UserModel(
          members: value,
        );

      case A.setMentors:
        user = UserModel(
          mentors: value,
        );
    }
    notifyListeners();
  }

  /// Fetches the members without mentor
  Future<List<UserModel>> fetchMembersWithoutMentor() async {
    setSelectedParameter(A.setMembers);

    final result = await _fetchMembersWithoutMentorUseCase(const NoParams());
    if (result is DataSuccess) {
      return result.resultData ?? [];
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
      return [];
    }
    return [];
  }

  /// Fetches the  mentors
  Future<List<UserModel>> fetchMentors() async {
    setSelectedParameter(A.setMentorId);
    final result = await _fetchMentorsUseCase(const NoParams());
    if (result is DataSuccess) {
      return result.resultData ?? [];
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
      return [];
    }
    return [];
  }

  /// Fetches the mentats
  Future<List<UserModel>> fetchMentats() async {
    setSelectedParameter(A.setMentatId);

    final result = await _fetchMentatsUseCase(const NoParams());
    if (result is DataSuccess) {
      Log.debug(result.resultData);
      return result.resultData ?? [];
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
      return [];
    }
    return [];
  }

  /// Fetches the mentors without mentat
  Future<List<UserModel>> fetchMentorsWithoutMentat() async {
    setSelectedParameter(A.setMentors);

    final result = await _fetchMentorsWithoutMentatUseCase(const NoParams());
    if (result is DataSuccess) {
      return result.resultData ?? [];
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
      return [];
    }
    return [];
  }

  /// Adds a new user
  Future<void> addNewUser(UserModel userModel) async {
    final result = await _addNewUserUseCase(userModel);
    if (result is DataSuccess) {
      user = result.resultData ?? UserModel();
      // _membersTableDataSource.generateUserDataGridRows(state.value ?? []);

      // users = state.value;
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
    }
  }

  void setSelectedParameter(A val) {
    selectedParameter = val;
    notifyListeners();
  }
}

enum A {
  setMentorId,
  setMentatId,
  setMembers,
  setMentors,
}
