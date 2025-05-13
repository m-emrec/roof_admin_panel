import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';

import 'package:roof_admin_panel/features/feedback-page/domain/repositories/feedback_repository.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

/// A use case class responsible for fetching a reported user.
class FetchReportedUserUseCase extends UseCase<DataState<MemberModel>, String> {
  /// A use case class responsible for fetching a reported user.

  FetchReportedUserUseCase({
    required FeedbackRepository repository,
  }) : _repository = repository;
  final FeedbackRepository _repository;
  @override
  Future<DataState<MemberModel>> call(String params) {
    return _repository.fetchReportedUser(params);
  }
}
