import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:roof_admin_panel/features/feedback-page/domain/repositories/feedback_repository.dart';

/// A use case to fetch next feedbacks
class FetchNextFeedbacksUseCase
    extends UseCase<DataState<List<FeedbackModel>>, String> {
  /// A use case to fetch next feedbacks
  FetchNextFeedbacksUseCase(this._repository);
  final FeedbackRepository _repository;

  @override
  Future<DataState<List<FeedbackModel>>> call(String params) {
    return _repository.fetchNextFeedbacks(params);
  }
}
