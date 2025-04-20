import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/add-member/domain/usecases/add_new_member_use_case.dart';
import 'package:roof_admin_panel/features/add-member/domain/usecases/fetch_members_without_mentor_use_case.dart';
import 'package:roof_admin_panel/features/add-member/domain/usecases/fetch_mentats_use_case.dart';
import 'package:roof_admin_panel/features/add-member/domain/usecases/fetch_mentors_use_case.dart';
import 'package:roof_admin_panel/features/add-member/domain/usecases/fetch_mentors_without_mentat_use_case.dart';

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
    if (user.role?.contains(Role.member) == true ||
        user.role?.contains(Role.admin) == true) {
      user = user.copyWith(
        mentorId: userModel.mentorId,
        role: user.role,
      );
    } else if (user.role?.contains(Role.mentat) == true) {
      user = user.copyWith(
        mentors: userModel.mentors,
        role: user.role,
      );
    } else if (user.role?.contains(Role.mentor) == true) {
      user = user.copyWith(
        members: userModel.members,
        mentatId: userModel.mentatId,
        role: user.role,
      );
    }

    notifyListeners();
  }

  UserModel _setUser(UserModel userModel) {
    return user.copyWith(
      name: userModel.name,
      phoneNumber: userModel.phoneNumber,
      gender: userModel.gender,
      memberNumber: userModel.memberNumber,
      membershipStartDate: userModel.membershipStartDate,
      membershipEndDate: userModel.membershipEndDate,
    );
  }

  /// Adds a new user
  Future<DataState<UserModel>> addNewUser(UserModel userModel) async {
    user = _setUser(userModel);

    final dataState = await _addNewUserUseCase(user);
    return dataState;
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
