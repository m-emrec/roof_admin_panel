import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/feedback/domain/repositories/feedback_repository.dart';

/// A use case to fetch feedback owner≈
class FetchFeedbackOwnerUseCase extends UseCase<DataState<UserModel>, String> {
  /// A use case to fetch feedback owner≈
  FetchFeedbackOwnerUseCase({
    required FeedbackRepository repository,
  }) : _repository = repository;
  final FeedbackRepository _repository;
  @override
  Future<DataState<UserModel>> call(String params) {
    return _repository.fetchFeedbackOwner(params);
  }
}
