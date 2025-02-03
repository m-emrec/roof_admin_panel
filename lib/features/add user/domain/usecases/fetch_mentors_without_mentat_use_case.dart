import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/core/resources/use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/repositories/add_member_repository.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';

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
