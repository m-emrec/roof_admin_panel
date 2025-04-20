import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/add-member/domain/repositories/add_member_repository.dart';

class FetchMentorsWithoutMentatUseCase
    extends UseCase<DataState<List<UserModel>>, NoParams> {
  final AddMemberRepository _addMemberRepository;
  FetchMentorsWithoutMentatUseCase(
    this._addMemberRepository,
  );

  @override
  Future<DataState<List<UserModel>>> call(NoParams params) {
    return _addMemberRepository.fetchMentorsWithoutMentat();
  }
}
