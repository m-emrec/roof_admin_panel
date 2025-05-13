// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/members-view/domain/repositories/members_repository.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

class FetchNext20UsersUseCase
    extends UseCase<DataState<List<MemberModel>>, String> {
  final MembersRepository repository;
  FetchNext20UsersUseCase({
    required this.repository,
  });

  @override
  Future<DataState<List<MemberModel>>> call(String params) {
    return repository.fetchNext20Users(params);
  }
}
