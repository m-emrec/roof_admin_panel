import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/repositories/mentorship_widget_repository.dart';

///
class GetMentorForMemberUseCase
    extends UseCase<DataState<UserInfoEntity?>, String> {
  ///
  GetMentorForMemberUseCase(this._repository);
  final MentorshipWidgetRepository _repository;
  @override
  Future<DataState<UserInfoEntity?>> call(String params) {
    return _repository.getMentorForMember(params);
  }
}
