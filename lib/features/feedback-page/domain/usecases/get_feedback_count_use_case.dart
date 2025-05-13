import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/feedback-page/domain/repositories/feedback_repository.dart';

/// A use case class responsible for fetching the feedback count.
class GetFeedbackCountUseCase extends UseCase<int, NoParams> {
  /// A use case class responsible for fetching the feedback count.
  GetFeedbackCountUseCase(this._repository);

  final FeedbackRepository _repository;
  @override
  Future<int> call(NoParams params) {
    return _repository.getFeedbackCount();
  }
}
