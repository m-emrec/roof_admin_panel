// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/core/resources/use_case.dart';
import 'package:roof_admin_panel/features/members/domain/repositories/members_repository.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';

class AddNewUserUseCase extends UseCase<DataState<UserModel>, UserModel> {
  final MembersRepository membersRepository;
  AddNewUserUseCase({
    required this.membersRepository,
  });

  @override
  Future<DataState<UserModel>> call(UserModel params) {
    return membersRepository.addNewUser(params);
  }
}
