import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/core/resources/use_case.dart';
import 'package:roof_admin_panel/features/members/domain/repositories/members_repository.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';

class FetchFirst20UsersUseCase
    extends UseCase<DataState<List<UserModel>>, NoParams> {
  FetchFirst20UsersUseCase(this.repository);
  final MembersRepository repository;

  @override
  Future<DataState<List<UserModel>>> call(NoParams params) async {
    return repository.fetchFirst20Users();
  }
}
