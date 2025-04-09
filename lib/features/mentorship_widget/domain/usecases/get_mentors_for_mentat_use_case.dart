import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/repositories/mentorship_widget_repository.dart';

///
class GetMentorsForMentatUseCase
    extends UseCase<DataState<List<UserInfoEntity?>>, List<String>> {
  ///
  GetMentorsForMentatUseCase(this._repository);
  final MentorshipWidgetRepository _repository;
  @override
  Future<DataState<List<UserInfoEntity?>>> call(List<String> params) {
    return _repository.getMentorsForMentat(params);
  }
}
