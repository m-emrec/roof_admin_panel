import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentat_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/repositories/mentorship_widget_repository.dart';

///
class GetIfMentatUseCase
    extends UseCase<DataState<MentatInfoEntity?>, List<String>> {
  ///
  GetIfMentatUseCase(this._repository);
  final MentorshipWidgetRepository _repository;
  @override
  Future<DataState<MentatInfoEntity?>> call(List<String> params) {
    return _repository.getForMentat(params);
  }
}
