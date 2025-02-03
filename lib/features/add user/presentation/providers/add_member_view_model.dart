import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/core/constants/enums/roles.dart';
import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/core/resources/use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/add_new_member_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_members_without_mentor_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_mentors_without_mentat_use_case.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

class AddMemberViewModel extends ChangeNotifier {
  AddMemberViewModel({
    required AddNewMemberUseCase addNewUserUseCase,
    required FetchMembersWithoutMentorUseCase fetchMembersWithoutMentorUseCase,
    required FetchMentorsWithoutMentatUseCase fetchMentorsWithoutMentatUseCase,
  })  : _addNewUserUseCase = addNewUserUseCase,
        _fetchMembersWithoutMentorUseCase = fetchMembersWithoutMentorUseCase,
        _fetchMentorsWithoutMentatUseCase = fetchMentorsWithoutMentatUseCase;

  final FetchMembersWithoutMentorUseCase _fetchMembersWithoutMentorUseCase;
  final FetchMentorsWithoutMentatUseCase _fetchMentorsWithoutMentatUseCase;

  final AddNewMemberUseCase _addNewUserUseCase;

  UserModel user = UserModel();

  void setRole(Role role) {
    user = user.copyWith(role: [role]);
    notifyListeners();
  }

  Future<List<UserModel>> fetchMembersWithoutMentor() async {
    final result = await _fetchMembersWithoutMentorUseCase(const NoParams());
    if (result is DataSuccess) {
      return result.resultData ?? [];
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
      return [];
    }
    return [];
  }

  Future<List<UserModel>> fetchMentorsWithoutMentat() async {
    final result = await _fetchMentorsWithoutMentatUseCase(const NoParams());
    if (result is DataSuccess) {
      return result.resultData ?? [];
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
      return [];
    }
    return [];
  }

  void addNewUser(UserModel userModel) async {
    final result = await _addNewUserUseCase(userModel);
    if (result is DataSuccess) {
      user = result.resultData ?? UserModel();
      // _membersTableDataSource.generateUserDataGridRows(state.value ?? []);

      // users = state.value;
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
    }
  }
}
