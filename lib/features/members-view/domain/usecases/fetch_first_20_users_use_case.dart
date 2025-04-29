import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/members-view/domain/repositories/members_repository.dart';

class FetchFirst20UsersUseCase
    extends UseCase<DataState<List<UserModel>>, NoParams> {
  FetchFirst20UsersUseCase(this.repository);
  final MembersRepository repository;

  @override
  Future<DataState<List<UserModel>>> call(NoParams params) async {
    return repository.fetchFirst20Users();
  }
}
