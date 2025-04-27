import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/entities/user_entity.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/repositories/add_mentor_repository.dart';

class FetchMembersWithoutMentorUseCase
    extends UseCase<DataState<List<AddMentorEntity>>, NoParams> {
  FetchMembersWithoutMentorUseCase(this._repository);
  final AddMentorRepository _repository;
  @override
  Future<DataState<List<AddMentorEntity>>> call(NoParams params) {
    return _repository.fetchMembersWithoutMentor();
  }
}
