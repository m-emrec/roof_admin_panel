import 'package:core/core.dart';
import 'package:roof_admin_panel/features/add%20user/domain/repositories/add_member_repository.dart';

class FetchMentorsUseCase
    extends UseCase<DataState<List<UserModel>>, NoParams> {
  final AddMemberRepository repository;

  FetchMentorsUseCase(this.repository);

  @override
  Future<DataState<List<UserModel>>> call(NoParams params) {
    return repository.fetchMentors();
  }
}
