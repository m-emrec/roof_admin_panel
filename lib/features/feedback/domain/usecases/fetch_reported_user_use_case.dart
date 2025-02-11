import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';

import 'package:roof_admin_panel/features/feedback/domain/repositories/feedback_repository.dart';

/// A use case class responsible for fetching a reported user.
class FetchReportedUserUseCase extends UseCase<DataState<UserModel>, String> {
  /// A use case class responsible for fetching a reported user.

  FetchReportedUserUseCase({
    required FeedbackRepository repository,
  }) : _repository = repository;
  final FeedbackRepository _repository;
  @override
  Future<DataState<UserModel>> call(String params) {
    return _repository.fetchReportedUser(params);
  }
}
