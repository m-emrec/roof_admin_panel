import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/member_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/repositories/mentorship_widget_repository.dart';

///
class GetIfMemberUseCase extends UseCase<DataState<MemberInfoEntity?>, String> {
  ///
  GetIfMemberUseCase(this._repository);
  final MentorshipWidgetRepository _repository;
  @override
  Future<DataState<MemberInfoEntity?>> call(String params) {
    return _repository.getIfMember(params);
  }
}
