// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/core/resources/use_case.dart';
import 'package:roof_admin_panel/features/members/domain/repositories/members_repository.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';

class FetchNext20UsersUseCase
    extends UseCase<DataState<List<UserModel>>, String> {
  final MembersRepository repository;
  FetchNext20UsersUseCase({
    required this.repository,
  });

  @override
  Future<DataState<List<UserModel>>> call(String params) {
    return repository.fetchNext20Users(params);
  }
}
