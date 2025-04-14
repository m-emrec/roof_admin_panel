import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/repositories/mentorship_widget_repository.dart';

///
class GetIfMentorUseCase {
  ///
  GetIfMentorUseCase(this._repository);
  final MentorshipWidgetRepository _repository;
  Future<DataState<MentorInfoEntity?>> call(
      {required String mentatId, required List<String> memberIds}) {
    return _repository.getIfMentor(mentatId, memberIds);
  }
}
