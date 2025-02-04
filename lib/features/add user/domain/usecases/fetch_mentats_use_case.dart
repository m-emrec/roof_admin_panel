import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/add%20user/domain/repositories/add_member_repository.dart';

class FetchMentatsUseCase
    extends UseCase<DataState<List<UserModel>>, NoParams> {
  final AddMemberRepository repository;

  FetchMentatsUseCase(this.repository);

  @override
  Future<DataState<List<UserModel>>> call(NoParams params) {
    return repository.fetchMentats();
  }
}
